/**
 * Storyflow Premium - Immersive Reader Logic
 */

class StoryflowApp {
    constructor() {
        this.state = {
            sentences: [],
            currentIndex: 0,
            isPlaying: false,
            playbackRate: parseFloat(localStorage.getItem('sf_rate') || '1.0'),
            selectedVoiceURI: localStorage.getItem('sf_voice') || '',
            history: JSON.parse(localStorage.getItem('sf_history') || '[]'),
            dictionary: JSON.parse(localStorage.getItem('sf_dict') || '[]').map(({ word, reading }) => ({ word, reading })),
            currentTitle: '新規テキスト',
            timerHandle: null,
            timerMinutes: 0,
            ttsEngine: localStorage.getItem('sf_engine') || 'standard',
            googleApiKey: localStorage.getItem('sf_google_api_key') || ''
        };

        this.googleAudioPlayer = new Audio();
        this.googleCache = { index: -1, blobUrl: null }; // Prefetch cache
        this.currentGoogleBlobUrl = null; // Currently playing blob URL
        if (!this.tts) {
            console.warn("SpeechSynthesis is not supported in this environment.");
            // Fallback object to prevent crashes
            this.tts = {
                speak: () => {},
                cancel: () => {},
                pause: () => {},
                resume: () => {},
                getVoices: () => [],
                onvoiceschanged: null
            };
        }
        this.utterance = null;
        this.dummyAudio = null;

        this.init();
    }

    init() {
        this.cacheDOM();
        this.bindEvents();
        this.setupMediaSession();
        this.checkSavedSession();
        this.updateHistoryUI();
        this.initVoices();
        this.updateTtsUiVisibility();
        
        // Setup Google Audio Player
        this.googleAudioPlayer.onended = () => {
            if (this.state.isPlaying) {
                this.state.currentIndex++;
                this.speakCurrent();
            }
        };
    }

    updateTtsUiVisibility() {
        if (this.dom.googleApiKeyGroup) {
            this.dom.googleApiKeyGroup.classList.toggle('hidden', this.state.ttsEngine !== 'google');
        }
        if (this.dom.openTtsSettingsBtn) {
            this.dom.openTtsSettingsBtn.classList.toggle('hidden', this.state.ttsEngine === 'google');
        }
    }

    cacheDOM() {
        this.dom = {
            textContainer: document.getElementById('textContainer'),
            playBtn: document.getElementById('playBtn'),
            seekBar: document.getElementById('seekBar'),
            currentTime: document.getElementById('currentTime'),
            remainingTime: document.getElementById('remainingTime'),
            titleLabel: document.getElementById('currentFileTitle'),
            progressText: document.getElementById('currentProgressText'),
            filePicker: document.getElementById('filePicker'),
            bottomOpenBtn: document.getElementById('bottomOpenBtn'),
            navLibrary: document.getElementById('navLibrary'),
            initialOpenBtn: document.getElementById('initialOpenBtn'),
            resumeBtn: document.getElementById('resumeBtn'),
            speedBtn: document.getElementById('speedBtn'),
            dictBtn: document.getElementById('dictBtn'),
            skipBack: document.getElementById('skipBack'),
            skipForward: document.getElementById('skipForward'),
            navLibrary: document.getElementById('navLibrary'),
            libraryModal: document.getElementById('libraryModal'),
            settingsModal: document.getElementById('settingsModal'),
            closeLibraryModal: document.getElementById('closeLibraryModal'),
            closeSettingsModal: document.getElementById('closeSettingsModal'),
            modalOverlay: document.getElementById('modalOverlay'),
            dictModal: document.getElementById('dictModal'),
            closeDictModal: document.getElementById('closeDictModal'),
            dictList: document.getElementById('dictList'),
            dictListView: document.getElementById('dictListView'),
            dictEditView: document.getElementById('dictEditView'),
            addWordBtn: document.getElementById('addWordBtn'),
            exportDictBtn: document.getElementById('exportDictBtn'),
            importDictBtn: document.getElementById('importDictBtn'),
            saveWordBtn: document.getElementById('saveWordBtn'),
            cancelWordBtn: document.getElementById('cancelWordBtn'),
            previewWordBtn: document.getElementById('previewWordBtn'),
            dictWordInput: document.getElementById('dictWordInput'),
            dictReadingInput: document.getElementById('dictReadingInput'),
            voiceSelect: document.getElementById('voiceSelect'),
            speedSlider: document.getElementById('speedSlider'),
            speedDisplay: document.getElementById('speedDisplay'),
            timerSelect: document.getElementById('timerSelect'),
            timerStatus: document.getElementById('timerStatus'),
            openTtsSettingsBtn: document.getElementById('openTtsSettingsBtn'),
            engineSelect: document.getElementById('engineSelect'),
            googleApiKeyGroup: document.getElementById('googleApiKeyGroup'),
            googleApiKeyInput: document.getElementById('googleApiKeyInput')
        };
    }

    bindEvents() {
        if (this.dom.playBtn) this.dom.playBtn.addEventListener('click', () => this.togglePlayback());
        if (this.dom.initialOpenBtn) this.dom.initialOpenBtn.addEventListener('click', () => {
            if (window.AndroidBridge) window.AndroidBridge.openBook();
            else this.dom.filePicker.click();
        });
        if (this.dom.bottomOpenBtn) this.dom.bottomOpenBtn.addEventListener('click', () => {
            if (window.AndroidBridge) window.AndroidBridge.openBook();
            else this.dom.filePicker.click();
        });
        if (this.dom.resumeBtn) this.dom.resumeBtn.addEventListener('click', () => this.restoreState());
        if (this.dom.dictBtn) this.dom.dictBtn.addEventListener('click', () => this.openDictionary());
        if (this.dom.filePicker) this.dom.filePicker.addEventListener('change', (e) => this.handleFile(e));
        if (this.dom.seekBar) this.dom.seekBar.addEventListener('input', (e) => this.seek(e));
        
        // Settings Modal Open
        if (this.dom.speedBtn) this.dom.speedBtn.addEventListener('click', () => this.openSettings());
        if (this.dom.navLibrary) this.dom.navLibrary.addEventListener('click', () => this.openLibrary());
        if (this.dom.closeLibraryModal) this.dom.closeLibraryModal.addEventListener('click', () => this.closeLibrary());
        if (this.dom.closeSettingsModal) this.dom.closeSettingsModal.addEventListener('click', () => this.closeSettings());

        // Settings Changes
        if (this.dom.voiceSelect) this.dom.voiceSelect.addEventListener('change', (e) => {
            this.state.selectedVoiceURI = e.target.value;
            localStorage.setItem('sf_voice', this.state.selectedVoiceURI);
        });

        if (this.dom.speedSlider) this.dom.speedSlider.addEventListener('input', (e) => {
            const val = parseFloat(e.target.value);
            this.state.playbackRate = val;
            if (this.dom.speedDisplay) this.dom.speedDisplay.textContent = val.toFixed(1);
            localStorage.setItem('sf_rate', val);
        });

        if (this.dom.timerSelect) this.dom.timerSelect.addEventListener('change', (e) => {
            this.setSleepTimer(parseInt(e.target.value));
        });

        if (this.dom.openTtsSettingsBtn) this.dom.openTtsSettingsBtn.addEventListener('click', () => {
            if (window.AndroidBridge) window.AndroidBridge.openTtsSettings();
        });

        if (this.dom.engineSelect) {
            this.dom.engineSelect.value = this.state.ttsEngine;
            this.dom.engineSelect.addEventListener('change', (e) => {
                this.state.ttsEngine = e.target.value;
                localStorage.setItem('sf_engine', this.state.ttsEngine);
                this.updateTtsUiVisibility();
                this.initVoices(); // Refresh list
                this.pause();
            });
        }

        if (this.dom.googleApiKeyInput) {
            this.dom.googleApiKeyInput.value = this.state.googleApiKey;
            this.dom.googleApiKeyInput.addEventListener('input', (e) => {
                this.state.googleApiKey = e.target.value;
                localStorage.setItem('sf_google_api_key', this.state.googleApiKey);
            });
        }

        // Dictionary Specific Events
        if (this.dom.addWordBtn) this.dom.addWordBtn.addEventListener('click', () => this.showWordEditor());
        if (this.dom.exportDictBtn) this.dom.exportDictBtn.addEventListener('click', () => {
            if (window.AndroidBridge) {
                // エクスポートデータから不要なイントネーション情報を完全に除外してシリアライズします
                const cleanDict = this.state.dictionary.map(({ word, reading }) => ({ word, reading }));
                window.AndroidBridge.exportDictionary(JSON.stringify(cleanDict));
            }
        });
        if (this.dom.importDictBtn) this.dom.importDictBtn.addEventListener('click', () => {
            if (window.AndroidBridge) {
                window.AndroidBridge.importDictionary();
            }
        });
        if (this.dom.saveWordBtn) this.dom.saveWordBtn.addEventListener('click', () => this.saveWord());
        if (this.dom.previewWordBtn) this.dom.previewWordBtn.addEventListener('click', () => this.previewWord());
        if (this.dom.cancelWordBtn) this.dom.cancelWordBtn.addEventListener('click', () => this.hideWordEditor());
        if (this.dom.closeDictModal) this.dom.closeDictModal.addEventListener('click', () => this.closeDictionary());
        if (this.dom.modalOverlay) this.dom.modalOverlay.addEventListener('click', () => {
            this.closeDictionary();
            this.closeLibrary();
            this.closeSettings();
        });
        
        // Skip 1 sentence back/forward in reader view
        // Skip button logic (single/double click)
        const setupSkip = (btn, deltaSingle, deltaDouble) => {
            if (!btn) return;
            let clickCount = 0;
            let timer = null;
            btn.addEventListener('click', () => {
                clickCount++;
                if (clickCount === 1) {
                    timer = setTimeout(() => {
                        this.skip(deltaSingle);
                        clickCount = 0;
                    }, 250);
                } else if (clickCount === 2) {
                    clearTimeout(timer);
                    this.skip(deltaDouble);
                    clickCount = 0;
                }
            });
        };

        setupSkip(this.dom.skipBack, -3, -10);
        setupSkip(this.dom.skipForward, 3, 10);

        // Text Interaction (Single Tap: Select, Double Tap: Play)
        if (this.dom.textContainer) {
            let lastTap = 0;
            this.dom.textContainer.addEventListener('click', (e) => {
                const sentenceEl = e.target.closest('.sentence');
                if (sentenceEl) {
                    const index = parseInt(sentenceEl.dataset.index);
                    const now = Date.now();
                    const DOUBLE_TAP_DELAY = 300;
                    
                    if (now - lastTap < DOUBLE_TAP_DELAY) {
                        // Double Tap: Play from here
                        this.jumpTo(index, true);
                    } else {
                        // Single Tap: Just select/jump here
                        this.jumpTo(index, false);
                    }
                    lastTap = now;
                }
            });
        }

        // Modal Controls
        const openLibrary = () => {
            this.updateHistoryUI();
            this.dom.libraryModal.classList.add('active');
            this.dom.modalOverlay.classList.add('active');
        };
        const closeAllModals = () => {
            document.querySelectorAll('.side-modal').forEach(m => m.classList.remove('active'));
            this.dom.modalOverlay.classList.remove('active');
        };

        if (this.dom.navLibrary) this.dom.navLibrary.addEventListener('click', openLibrary);
        if (this.dom.closeLibraryModal) this.dom.closeLibraryModal.addEventListener('click', closeAllModals);
        if (this.dom.closeSettingsModal) this.dom.closeSettingsModal.addEventListener('click', closeAllModals);
        if (this.dom.closeDictModal) this.dom.closeDictModal.addEventListener('click', closeAllModals);
        if (this.dom.modalOverlay) this.dom.modalOverlay.addEventListener('click', closeAllModals);

        // History list click delegation
        const historyList = document.getElementById('historyList');
        if (historyList) {
            historyList.addEventListener('click', (e) => {
                const deleteBtn = e.target.closest('.h-delete-btn');
                const historyItem = e.target.closest('.history-item');
                
                if (deleteBtn) {
                    e.stopPropagation();
                    const index = parseInt(deleteBtn.dataset.index);
                    this.deleteHistory(index);
                    return;
                }

                if (historyItem) {
                    const index = parseInt(historyItem.dataset.index);
                    const h = this.state.history[index];
                    if (h) {
                        this.loadText(h.text, h.title, h.index);
                        closeAllModals();
                    }
                }
            });
        }

        // Dictionary list click delegation
        if (this.dom.dictList) {
            this.dom.dictList.addEventListener('click', (e) => {
                const editBtn = e.target.closest('.edit-dict-btn');
                const deleteBtn = e.target.closest('.delete-dict-btn');
                
                if (editBtn) {
                    const index = parseInt(editBtn.dataset.index);
                    this.showWordEditor(index);
                } else if (deleteBtn) {
                    const index = parseInt(deleteBtn.dataset.index);
                    this.deleteWord(index);
                }
            });
        }
    }

    handleNativeFile(data, name, isBase64) {
        if (isBase64) {
            // Convert Base64 to Blob for JSZip
            const byteCharacters = atob(data);
            const byteNumbers = new Array(byteCharacters.length);
            for (let i = 0; i < byteCharacters.length; i++) {
                byteNumbers[i] = byteCharacters.charCodeAt(i);
            }
            const byteArray = new Uint8Array(byteNumbers);
            const blob = new Blob([byteArray], {type: 'application/epub+zip'});
            this.handleEpub(blob, name);
        } else {
            this.loadText(data, name);
        }
    }

    handleFile(e) {
        const file = e.target.files[0];
        if (!file) return;

        if (file.name.toLowerCase().endsWith('.epub')) {
            this.handleEpub(file);
        } else {
            // Use the more modern and reliable file.text() API
            file.text().then(text => {
                this.loadText(text, file.name);
            }).catch(err => {
                alert("ファイルの読み込みに失敗しました: " + err.message);
            });
        }
    }

    async handleEpub(file, manualName = null) {
        if (!window.JSZip) {
            alert("JSZipライブラリが読み込まれていません。");
            return;
        }

        try {
            if (this.dom.titleLabel) this.dom.titleLabel.textContent = "解析中...";

            const zip = new JSZip();
            const contents = await zip.loadAsync(file);

            // 1. META-INF/container.xml からOPFファイルのパスを取得
            const containerXmlFile = contents.file("META-INF/container.xml");
            if (!containerXmlFile) throw new Error("META-INF/container.xml が見つかりません。");
            
            const containerXmlStr = await containerXmlFile.async("string");
            const parser = new DOMParser();
            const containerDoc = parser.parseFromString(containerXmlStr, "text/xml");
            const rootfile = containerDoc.querySelector("rootfile");
            const opfPath = rootfile ? rootfile.getAttribute("full-path") : null;
            if (!opfPath) throw new Error("container.xml に OPFパスがありません。");

            // 2. OPFファイルを読み込み、目次とファイルリストを取得
            const opfFile = contents.file(opfPath);
            if (!opfFile) throw new Error("OPFファイルが見つかりません: " + opfPath);
            
            const opfStr = await opfFile.async("string");
            const opfDoc = parser.parseFromString(opfStr, "text/xml");

            // タイトルの抽出
            const titleEl = opfDoc.querySelector("title");
            let bookTitle = manualName || (file.name ? file.name.replace(/\.epub$/i, '') : "不明な書籍");
            if (titleEl && titleEl.textContent) {
                bookTitle = titleEl.textContent;
            }

            const manifestItems = Array.from(opfDoc.querySelectorAll("manifest item"));
            const spineItemRefs = Array.from(opfDoc.querySelectorAll("spine itemref"));

            const manifestMap = {};
            manifestItems.forEach(item => {
                manifestMap[item.getAttribute("id")] = item.getAttribute("href");
            });

            const opfDir = opfPath.substring(0, opfPath.lastIndexOf('/') + 1);
            let fullText = "";

            // 3. 各章（spine）のHTMLファイルを順番に読み込んでテキスト化
            for (const itemref of spineItemRefs) {
                const idref = itemref.getAttribute("idref");
                const href = manifestMap[idref];
                if (href) {
                    const htmlPath = opfDir + href;
                    const decodedPath = decodeURIComponent(htmlPath);
                    const htmlFile = contents.file(decodedPath);
                    if (htmlFile) {
                        const htmlStr = await htmlFile.async("string");
                        const htmlDoc = parser.parseFromString(htmlStr, "text/html");
                        
                        const body = htmlDoc.body;
                        if (body) {
                            // ブロック要素の後に改行を追加
                            const blocks = ['p', 'div', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'li', 'blockquote'];
                            blocks.forEach(tag => {
                                const elements = body.getElementsByTagName(tag);
                                for (let i = 0; i < elements.length; i++) {
                                    elements[i].innerHTML = elements[i].innerHTML + "\n";
                                }
                            });
                            
                            // <br>を改行に変換
                            const brs = body.getElementsByTagName('br');
                            while(brs.length > 0) {
                                brs[0].parentNode.replaceChild(htmlDoc.createTextNode("\n"), brs[0]);
                            }

                            // ルビのフリガナ部分（<rt>, <rp>）を削除して、漢字が重複して読まれるのを防ぐ
                            const rts = body.getElementsByTagName('rt');
                            while(rts.length > 0) rts[0].parentNode.removeChild(rts[0]);
                            const rps = body.getElementsByTagName('rp');
                            while(rps.length > 0) rps[0].parentNode.removeChild(rps[0]);

                            // プレーンテキストの抽出
                            fullText += (body.textContent || body.innerText) + "\n\n";
                        }
                    }
                }
            }

            // 余分な改行の整理
            fullText = fullText.replace(/\n{3,}/g, '\n\n').trim();

            if (fullText) {
                this.loadText(fullText, bookTitle);
            } else {
                throw new Error("テキストを抽出できませんでした。");
            }

        } catch (err) {
            console.error("EPUB parsing error:", err);
            alert("EPUBの読み込みに失敗しました: " + err.message);
            if (this.dom.titleLabel) this.dom.titleLabel.textContent = "読み込みエラー";
        }
    }

    loadText(text, title, savedIndex = 0) {
        this.state.originalText = text;
        this.state.sentences = [];
        
        let html = '';
        let globalIndex = 0;
        
        // 正規化と段落分け
        const normalizedText = text.replace(/\r\n/g, '\n');
        const paragraphs = normalizedText.split('\n');
        
        paragraphs.forEach(p => {
            if (p.trim().length === 0) {
                html += '<br>';
                return;
            }
            html += '<p class="book-paragraph">';
            // 句読点を保持して分割
            const sentenceMatches = p.match(/[^。！？.!?]+[。！？.!?]*/g) || [p];
            sentenceMatches.forEach(s => {
                if (s.trim().length > 0) {
                    this.state.sentences.push(s);
                    html += `<span class="sentence" data-index="${globalIndex}">${s}</span>`;
                    globalIndex++;
                }
            });
            html += '</p>';
        });

        if (this.dom.textContainer) {
            this.dom.textContainer.innerHTML = html;
        }

        this.state.currentIndex = savedIndex;
        this.state.currentTitle = title;
        if (this.dom.titleLabel) this.dom.titleLabel.textContent = title;

        this.pause();
        this.updateMeta();
        this.renderHighlight();
        this.addToHistory(title, text, savedIndex, this.state.sentences.length);
    }

    /* --- Rendering --- */
    renderHighlight(shouldScroll = true) {
        if (this.state.sentences.length === 0) return;

        const all = this.dom.textContainer.querySelectorAll('.sentence');
        all.forEach(s => s.classList.remove('active'));

        const current = this.dom.textContainer.querySelector(`[data-index="${this.state.currentIndex}"]`);
        if (current) {
            current.classList.add('active');
            if (shouldScroll) {
                current.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    }

    /* --- Playback Control --- */
    togglePlayback() {
        if (this.state.isPlaying) {
            this.pause();
        } else {
            this.play();
        }
    }

    play() {
        if (this.state.sentences.length === 0) return;
        
        this.state.isPlaying = true;
        if (this.dom.playBtn) this.dom.playBtn.innerHTML = '<i class="fas fa-pause"></i>';
        
        // Removed non-existent initDummyAudio call
        this.speakCurrent();
        if (navigator.mediaSession) navigator.mediaSession.playbackState = 'playing';
    }

    pause() {
        this.state.isPlaying = false;
        if (this.dom.playBtn) this.dom.playBtn.innerHTML = '<i class="fas fa-play"></i>';
        if (window.AndroidBridge) {
            window.AndroidBridge.stop();
        } else if (this.tts && typeof this.tts.cancel === 'function') {
            this.tts.cancel();
        }
        this.googleAudioPlayer.pause();
        this.googleAudioPlayer.src = '';
        this.clearGoogleCache();
        if (navigator.mediaSession) navigator.mediaSession.playbackState = 'paused';
    }

    stop() {
        this.pause();
        this.state.currentIndex = 0;
        this.updateMeta();
        this.renderHighlight();
    }

    speakCurrent() {
        if (!this.state.isPlaying || this.state.currentIndex >= this.state.sentences.length) {
            if (this.state.currentIndex >= this.state.sentences.length) {
                this.stop();
            }
            return;
        }

        if (this.state.ttsEngine === 'google') {
            const ssmlText = this.getProcessedSentenceSSML(this.state.currentIndex);
            this.playGoogleCloud(ssmlText);
            return;
        }

        // ユーザー辞書の適用（一括 - 重複・再置換防止のマーカー方式）
        const processedSentences = this.state.sentences.map(s => {
            let t = s;
            const sortedDict = [...this.state.dictionary].sort((a, b) => b.word.length - a.word.length);
            const replacements = [];
            sortedDict.forEach((entry, i) => {
                if (entry.word && entry.reading) {
                    if (t.includes(entry.word)) {
                        const marker = `___DICT_MARKER_${i}___`;
                        t = t.replaceAll(entry.word, marker);
                        replacements.push({ marker, reading: entry.reading });
                    }
                }
            });
            replacements.forEach(rep => {
                t = t.replaceAll(rep.marker, rep.reading);
            });
            return t;
        });

        try {
            // Apply Voice (Native Bridge) - Sending all sentences as a queue
            if (window.AndroidBridge) {
                const voiceName = this.state.selectedVoiceURI || "";
                const rate = parseFloat(this.state.playbackRate) || 1.0;
                const sentencesJson = JSON.stringify(processedSentences);
                window.AndroidBridge.speak(sentencesJson, this.state.currentIndex, rate, voiceName);
            } else {
                let text = processedSentences[this.state.currentIndex];
                this.utterance = new SpeechSynthesisUtterance(text);
                const voices = this.tts.getVoices();
                const selectedVoice = voices.find(v => v.voiceURI === this.state.selectedVoiceURI);
                if (selectedVoice) this.utterance.voice = selectedVoice;

                this.utterance.lang = 'ja-JP';
                this.utterance.rate = this.state.playbackRate;
                
                this.utterance.onerror = (e) => {
                    console.error("TTS Error:", e);
                    if (e.error !== 'interrupted') {
                        alert("音声再生エラーが発生しました: " + e.error);
                    }
                };
                
                this.utterance.onstart = () => {
                    this.renderHighlight();
                    this.updateMeta();
                    this.updateMediaMetadata();
                };

                this.utterance.onend = () => {
                    if (this.state.isPlaying) {
                        this.state.currentIndex++;
                        this.speakCurrent();
                    }
                };

                this.tts.speak(this.utterance);
            }
        } catch (e) {
            alert("再生命令エラー: " + e.message + "\n" + e.stack);
        }
    }

    onNativeSpeechStart(index) {
        if (index !== undefined) {
            this.state.currentIndex = index;
        }
        this.renderHighlight(true); 
        this.updateMeta();
        this.updateMediaMetadata();
    }

    onNativeSpeechEnd() {
        if (this.state.isPlaying) {
            this.state.currentIndex++;
            this.speakCurrent();
        }
    }

    scrollToCurrent() {
        const active = this.dom.textContainer.querySelector('.active');
        if (active) {
            active.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
    }

    jumpTo(index, autoPlay = false) {
        this.state.currentIndex = index;
        const wasPlaying = this.state.isPlaying || autoPlay;
        this.pause();
        this.renderHighlight(false);
        this.updateMeta();
        
        if (wasPlaying) {
            this.play();
        } else {
            this.pause(); // Ensure it stops if it was just a selection
            this.scrollToCurrent();
        }
    }

    skip(delta) {
        let newIndex = this.state.currentIndex + delta;
        newIndex = Math.max(0, Math.min(this.state.sentences.length - 1, newIndex));
        this.jumpTo(newIndex);
    }

    seek(e) {
        const percent = e.target.value;
        const index = Math.floor((percent / 100) * (this.state.sentences.length - 1));
        this.jumpTo(index);
    }

    openLibrary() {
        this.dom.libraryModal.classList.add('active');
        this.dom.modalOverlay.classList.add('active');
        this.updateHistoryUI();
    }

    closeLibrary() {
        this.dom.libraryModal.classList.remove('active');
        this.dom.modalOverlay.classList.remove('active');
    }

    closeSettings() {
        this.dom.settingsModal.classList.remove('active');
        this.dom.modalOverlay.classList.remove('active');
    }

    /* --- Dictionary Logic --- */
    openDictionary() {
        this.dom.dictModal.classList.add('active');
        this.dom.modalOverlay.classList.add('active');
        this.updateDictUI();
    }

    closeDictionary() {
        this.dom.dictModal.classList.remove('active');
        this.dom.modalOverlay.classList.remove('active');
        if (window.AndroidBridge) window.AndroidBridge.stop();
        this.hideWordEditor(); // Ensure editor is also hidden when modal closes
    }

    updateDictUI() {
        if (!this.dom.dictList) return;
        this.dom.dictList.innerHTML = this.state.dictionary.map((entry, i) => `
            <div class="dict-item">
                <div class="dict-info">
                    <h4>${entry.word}</h4>
                    <p>${entry.reading}</p>
                </div>
                <div class="dict-btns">
                    <button class="icon-btn edit-dict-btn" data-index="${i}"><i class="fas fa-edit"></i></button>
                    <button class="icon-btn delete-dict-btn" data-index="${i}"><i class="fas fa-trash-alt"></i></button>
                </div>
            </div>
        `).join('');
    }

    showWordEditor(index = -1) {
        this.dom.dictListView.classList.add('hidden');
        this.dom.dictEditView.classList.remove('hidden');
        
        if (index >= 0) {
            const entry = this.state.dictionary[index];
            this.dom.dictWordInput.value = entry.word;
            this.dom.dictReadingInput.value = entry.reading;
            this.dom.dictWordInput.dataset.editIndex = index;
        } else {
            this.dom.dictWordInput.value = '';
            this.dom.dictReadingInput.value = '';
            this.dom.dictWordInput.dataset.editIndex = -1;
        }
    }

    hideWordEditor() {
        this.dom.dictListView.classList.remove('hidden');
        this.dom.dictEditView.classList.add('hidden');
    }

    saveWord() {
        const word = this.dom.dictWordInput.value.trim();
        const reading = this.dom.dictReadingInput.value.trim();
        if (!word || !reading) return;

        const index = parseInt(this.dom.dictWordInput.dataset.editIndex);
        const entry = { word, reading };

        if (index >= 0) {
            this.state.dictionary[index] = entry;
        } else {
            this.state.dictionary.push(entry);
        }

        localStorage.setItem('sf_dict', JSON.stringify(this.state.dictionary));
        this.updateDictUI();
        this.hideWordEditor();
    }

    importDictionaryData(json) {
        try {
            const data = JSON.parse(json);
            if (Array.isArray(data)) {
                if (confirm(`${data.length}件の単語をインポートしますか？現在の辞書は上書きされます。`)) {
                    // インポートデータから不要なイントネーション情報を除外します
                    this.state.dictionary = data.map(({ word, reading }) => ({ word, reading }));
                    localStorage.setItem('sf_dict', JSON.stringify(this.state.dictionary));
                    this.updateDictUI();
                    alert("インポートが完了しました。");
                }
            } else {
                throw new Error("無効なファイル形式です。");
            }
        } catch (e) {
            alert("インポート失敗: " + e.message);
        }
    }

    deleteWord(index) {
        if (confirm("辞書からこの単語を削除しますか？")) {
            this.state.dictionary.splice(index, 1);
            localStorage.setItem('sf_dict', JSON.stringify(this.state.dictionary));
            this.updateDictUI();
        }
    }

    previewWord() {
        const reading = this.dom.dictReadingInput.value.trim();
        if (!reading) return;
        
        const ssml = this.generateWordSSML({ reading });
        
        if (window.AndroidBridge) {
            window.AndroidBridge.stop();
        } else {
            this.tts.cancel();
        }

        try {
            if (window.AndroidBridge) {
                const voiceName = this.state.selectedVoiceURI || "";
                const rate = parseFloat(this.state.playbackRate) || 1.0;
                window.AndroidBridge.speakSingle(ssml, rate, voiceName);
            } else {
                const utterance = new SpeechSynthesisUtterance(ssml);
                const voices = this.tts.getVoices();
                const selectedVoice = voices.find(v => v.voiceURI === this.state.selectedVoiceURI);
                if (selectedVoice) utterance.voice = selectedVoice;
                utterance.lang = 'ja-JP';
                utterance.rate = this.state.playbackRate;
                this.tts.speak(utterance);
            }
        } catch (e) {
            alert("試聴エラー: " + e.message);
        }
    }

    generateWordSSML(entry) {
        return `<speak>${entry.reading}</speak>`;
    }

    hiraToKata(str) {
        return str.replace(/[\u3041-\u3096]/g, match => {
            const chr = match.charCodeAt(0) + 0x60;
            return String.fromCharCode(chr);
        });
    }

    /* --- Settings & UI --- */
    openSettings() {
        this.dom.settingsModal.classList.add('active');
        this.dom.modalOverlay.classList.add('active');
        
        // Refresh voices list when opening settings
        this.initVoices();

        // Sync UI
        if (this.dom.speedSlider) this.dom.speedSlider.value = this.state.playbackRate;
        if (this.dom.speedDisplay) this.dom.speedDisplay.textContent = this.state.playbackRate.toFixed(1);
    }

    initVoices() {
        const load = () => {
            if (this.state.ttsEngine === 'google') {
                const googleVoices = [
                    { name: 'ja-JP-Wavenet-A', label: 'Google 女性 A (WaveNet)' },
                    { name: 'ja-JP-Wavenet-B', label: 'Google 女性 B (WaveNet)' },
                    { name: 'ja-JP-Wavenet-C', label: 'Google 男性 C (WaveNet)' },
                    { name: 'ja-JP-Wavenet-D', label: 'Google 男性 D (WaveNet)' },
                    { name: 'ja-JP-Neural2-B', label: 'Google 女性 Neural2' },
                    { name: 'ja-JP-Neural2-C', label: 'Google 男性 Neural2' }
                ];
                
                // If the currently selected voice is not in the Google list, reset it
                if (!googleVoices.find(v => v.name === this.state.selectedVoiceURI)) {
                    this.state.selectedVoiceURI = googleVoices[0].name;
                    localStorage.setItem('sf_voice', this.state.selectedVoiceURI);
                }

                if (this.dom.voiceSelect) {
                    this.dom.voiceSelect.innerHTML = googleVoices.map(v => 
                        `<option value="${v.name}" ${v.name === this.state.selectedVoiceURI ? 'selected' : ''}>${v.label}</option>`
                    ).join('');
                }
                return;
            }

            if (window.AndroidBridge) {
                const voiceStr = window.AndroidBridge.getVoices();
                if (voiceStr) {
                    const voiceNames = voiceStr.split(',');
                    if (this.dom.voiceSelect) {
                        this.dom.voiceSelect.innerHTML = voiceNames.map(name => 
                            `<option value="${name}" ${name === this.state.selectedVoiceURI ? 'selected' : ''}>${name}</option>`
                        ).join('');
                        
                        if (!this.state.selectedVoiceURI && voiceNames.length > 0) {
                            this.state.selectedVoiceURI = voiceNames[0];
                        }
                    }
                    return;
                }
            }

            if (!this.tts) return;
            let voices = this.tts.getVoices();
            
            if (voices.length === 0) {
                console.log("No voices found, retrying...");
                if (this.dom.voiceSelect) {
                    if (window.AndroidBridge) {
                        this.dom.voiceSelect.innerHTML = '<option value="native">Android 標準音声</option>';
                    } else {
                        this.dom.voiceSelect.innerHTML = '<option value="">読み込み中...</option>';
                    }
                }
                return;
            }

            // Prefer Japanese, but fallback to any voice if none found
            let jaVoices = voices.filter(v => 
                v.lang.toLowerCase().includes('ja') || 
                v.lang.toLowerCase().includes('jp') ||
                v.name.toLowerCase().includes('japanese')
            );
            
            let displayVoices = jaVoices.length > 0 ? jaVoices : voices;

            if (this.dom.voiceSelect) {
                this.dom.voiceSelect.innerHTML = displayVoices.map(v => 
                    `<option value="${v.voiceURI}" ${v.voiceURI === this.state.selectedVoiceURI ? 'selected' : ''}>${v.name} (${v.lang})</option>`
                ).join('');
                
                if (!this.state.selectedVoiceURI && displayVoices.length > 0) {
                    this.state.selectedVoiceURI = displayVoices[0].voiceURI;
                }
            }
        };

        // Try to load immediately and with several delays (standard fix for Android WebView)
        load();
        [100, 500, 1000, 2000, 5000].forEach(ms => setTimeout(load, ms));

        if (this.tts && this.tts.onvoiceschanged !== undefined) {
            this.tts.onvoiceschanged = load;
        }
    }

    setSleepTimer(min) {
        if (this.state.timerHandle) clearTimeout(this.state.timerHandle);
        this.state.timerMinutes = min;
        
        if (min === 0) {
            if (this.dom.timerStatus) this.dom.timerStatus.textContent = '';
            return;
        }

        if (min === 999) {
            if (this.dom.timerStatus) this.dom.timerStatus.textContent = '現在の章の終わりで停止します';
            return;
        }

        if (this.dom.timerStatus) this.dom.timerStatus.textContent = `${min}分後に停止します`;
        
        this.state.timerHandle = setTimeout(() => {
            this.pause();
            alert("スリープタイマーにより停止しました。");
            this.setSleepTimer(0);
            if (this.dom.timerSelect) this.dom.timerSelect.value = "0";
        }, min * 60 * 1000);
    }

    // (Replaced toggleSpeed with openSettings logic above)
    updateSpeedUI() {
        // 現在の速度設定をUIに表示しない（cogアイコンのみ）
    }

    updateMeta() {
        const current = this.state.currentIndex;
        const total = this.state.sentences.length;
        
        if (this.dom.seekBar) this.dom.seekBar.value = total > 0 ? (current / (total - 1)) * 100 : 0;
        if (this.dom.progressText) this.dom.progressText.textContent = `${current + 1} / ${total}`;
        
        const avgSec = 3 / this.state.playbackRate;
        const currentSec = current * avgSec;
        const remainingSec = (total - current) * avgSec;

        if (this.dom.currentTime) this.dom.currentTime.textContent = this.formatTime(currentSec);
        if (this.dom.remainingTime) this.dom.remainingTime.textContent = '-' + this.formatTime(remainingSec);
        
        this.saveState(); // Automatically save progress whenever meta updates
    }

    formatTime(sec) {
        const h = Math.floor(sec / 3600);
        const m = Math.floor((sec % 3600) / 60);
        const s = Math.floor(sec % 60);
        return (h > 0 ? h + ':' : '') + String(m).padStart(2, '0') + ':' + String(s).padStart(2, '0');
    }

    /* --- Persistence --- */
    saveState() {
        const session = {
            title: this.state.currentTitle,
            text: this.state.originalText || this.state.sentences.join('。'),
            index: this.state.currentIndex
        };
        localStorage.setItem('sf_session', JSON.stringify(session));

        const historyItem = this.state.history.find(h => h.title === this.state.currentTitle);
        if (historyItem) {
            historyItem.index = this.state.currentIndex;
            historyItem.total = this.state.sentences.length;
            localStorage.setItem('sf_history', JSON.stringify(this.state.history));
        }
    }

    checkSavedSession() {
        const data = localStorage.getItem('sf_session');
        if (data && this.dom.resumeBtn) {
            const session = JSON.parse(data);
            if (session.text && session.text.length > 0) {
                this.dom.resumeBtn.classList.remove('hidden-btn');
            }
        }
    }

    restoreState() {
        const data = localStorage.getItem('sf_session');
        if (data) {
            const session = JSON.parse(data);
            if (session.text) {
                this.loadText(session.text, session.title, session.index || 0);
            }
        }
    }

    addToHistory(title, text, index = 0, total = 0) {
        const save = () => {
            const entry = {
                title,
                text,
                index,
                total,
                date: new Date().toISOString()
            };

            this.state.history = this.state.history.filter(h => h.title !== title);
            this.state.history.unshift(entry);

            if (this.state.history.length > 15) {
                this.state.history.pop();
            }

            localStorage.setItem('sf_history', JSON.stringify(this.state.history));
            this.updateHistoryUI();
        };

        try {
            save();
        } catch (e) {
            console.warn("保存容量がいっぱいです。古い履歴を削除して再試行します。");
            try {
                // 失敗した場合、履歴を半分に減らして再試行
                this.state.history = this.state.history.slice(0, Math.floor(this.state.history.length / 2));
                save();
            } catch (e2) {
                console.error("履歴の保存を断念しました:", e2);
            }
        }
    }

    updateHistoryUI() {
        const list = document.getElementById('historyList');
        if (!list) return;
        list.innerHTML = this.state.history.map((h, i) => {
            const current = (h.index || 0) + 1;
            const total = h.total || 0;
            const progressStr = total > 0 ? `${current} / ${total} 行` : '';
            return `
            <div class="history-item" data-index="${i}">
                <div class="h-icon"><i class="fas fa-file-alt"></i></div>
                <div class="h-info">
                    <h4>${h.title}</h4>
                    <p>${new Date(h.date).toLocaleDateString()} <span style="float:right; color:var(--accent); font-weight:600;">${progressStr}</span></p>
                </div>
                <button class="h-delete-btn" data-index="${i}" title="削除">
                    <i class="fas fa-trash-alt"></i>
                </button>
            </div>
            `;
        }).join('');
    }

    deleteHistory(index) {
        if (confirm("この履歴を削除してもよろしいですか？")) {
            this.state.history.splice(index, 1);
            localStorage.setItem('sf_history', JSON.stringify(this.state.history));
            this.updateHistoryUI();
        }
    }

    /* --- Background & Media Session --- */
    initDummyAudio() {
        if (!this.dummyAudio) {
            // 完全無音（8kHz 8bit Mono 0.1秒間、振幅中央値0x80）のWAVデータを使用します。
            // 従来の極小データ（2サンプル）と違ってループ回数が激減し、DCオフセット（音の歪み）もないため、プチプチという破裂音（プチプチ音）を完全に防ぎます。
            this.dummyAudio = new Audio('data:audio/wav;base64,UklGRiADAABXQVZFZm10IBAAAAABAAEAQB8AAEAfAAABAAgAZGF0YSADAACAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgA==');
            this.dummyAudio.loop = true;
        }
        this.dummyAudio.play().catch(() => {});
    }

    setupMediaSession() {
        if ('mediaSession' in navigator) {
            navigator.mediaSession.setActionHandler('play', () => this.play());
            navigator.mediaSession.setActionHandler('pause', () => this.pause());
            navigator.mediaSession.setActionHandler('previoustrack', () => this.skip(-1));
            navigator.mediaSession.setActionHandler('nexttrack', () => this.skip(1));
        }
    }

    updateMediaMetadata() {
        if ('mediaSession' in navigator) {
            navigator.mediaSession.metadata = new MediaMetadata({
                title: this.state.currentTitle,
                artist: 'Storyflow Premium',
                album: this.state.sentences[this.state.currentIndex] || '',
                artwork: [{ src: 'https://cdn-icons-png.flaticon.com/512/3039/3039535.png', sizes: '512x512', type: 'image/png' }]
            });
        }
    }

    async playGoogleCloud(ssml) {
        if (!ssml) return;
        const currentIndex = this.state.currentIndex;

        // Clear current blob if exists (it's finished)
        if (this.currentGoogleBlobUrl) {
            URL.revokeObjectURL(this.currentGoogleBlobUrl);
            this.currentGoogleBlobUrl = null;
        }

        // Check if we have this sentence in cache
        if (this.googleCache.index === currentIndex && this.googleCache.blobUrl) {
            console.log('Using cached audio for index:', currentIndex);
            this.currentGoogleBlobUrl = this.googleCache.blobUrl;
            // Clear cache reference but NOT the blob URL yet
            this.googleCache.blobUrl = null;
            this.googleCache.index = -1;
        } else {
            // No cache, fetch now
            if (!this.state.googleApiKey) {
                alert('Google Cloud API Keyを共有してください。');
                this.openSettings();
                this.pause();
                return;
            }

            try {
                this.currentGoogleBlobUrl = await this.fetchGoogleAudio(ssml);
            } catch (error) {
                console.error('Google TTS Error:', error);
                alert('Google TTS Error: ' + error.message);
                this.pause();
                return;
            }
        }

        // Play current
        if (this.currentGoogleBlobUrl) {
            this.googleAudioPlayer.pause();
            this.googleAudioPlayer.src = '';
            this.googleAudioPlayer.load();
            this.googleAudioPlayer.src = this.currentGoogleBlobUrl;
            this.googleAudioPlayer.play().catch(e => {
                console.error("Google Play Error:", e);
            });
        }
        
        this.renderHighlight();
        this.updateMeta();
        this.updateMediaMetadata();

        // Prefetch next sentence
        setTimeout(() => this.prefetchNextGoogleCloud(currentIndex + 1), 100);
    }

    async prefetchNextGoogleCloud(nextIndex) {
        if (nextIndex >= this.state.sentences.length) return;
        
        // If already cached, don't re-fetch
        if (this.googleCache.index === nextIndex) return;

        const nextSsml = this.getProcessedSentenceSSML(nextIndex);
        if (!nextSsml) return;

        try {
            console.log('Prefetching next index:', nextIndex);
            const blobUrl = await this.fetchGoogleAudio(nextSsml);
            this.googleCache.index = nextIndex;
            this.googleCache.blobUrl = blobUrl;
        } catch (e) {
            console.warn('Prefetch failed:', e);
        }
    }

    async fetchGoogleAudio(ssml) {
        const response = await fetch(`https://texttospeech.googleapis.com/v1/text:synthesize?key=${this.state.googleApiKey}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                input: { ssml: ssml },
                voice: { languageCode: 'ja-JP', name: this.state.selectedVoiceURI },
                audioConfig: { 
                    audioEncoding: 'LINEAR16',
                    speakingRate: parseFloat(this.state.playbackRate)
                }
            })
        });

        const data = await response.json();
        if (data.audioContent) {
            const blob = this.base64ToBlob(data.audioContent, 'audio/wav');
            return URL.createObjectURL(blob);
        } else {
            throw new Error(data.error?.message || '不明なエラー');
        }
    }

    getProcessedSentenceSSML(index) {
        if (index < 0 || index >= this.state.sentences.length) return null;
        let t = this.state.sentences[index];
        
        // Escape special XML characters for SSML safety
        t = t.replace(/&/g, '&amp;')
             .replace(/</g, '&lt;')
             .replace(/>/g, '&gt;')
             .replace(/"/g, '&quot;')
             .replace(/'/g, '&apos;');

        // Sort dictionary by word length descending to prevent sub-string matching issues
        const sortedDict = [...this.state.dictionary].sort((a, b) => b.word.length - a.word.length);
        const replacements = [];

        sortedDict.forEach((entry, i) => {
            if (entry.word && entry.reading) {
                const escWord = entry.word.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;');
                const escReading = entry.reading.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;');
                
                if (t.includes(escWord)) {
                    const marker = `___DICT_MARKER_${i}___`;
                    t = t.replaceAll(escWord, marker);
                    replacements.push({
                        marker: marker,
                        html: `<sub alias="${escReading}">${escWord}</sub>`
                    });
                }
            }
        });

        // Restore placeholders with the proper SSML tags
        replacements.forEach(rep => {
            t = t.replaceAll(rep.marker, rep.html);
        });

        return `<speak>${t}</speak>`;
    }

    base64ToBlob(base64, type) {
        const binStr = atob(base64);
        const len = binStr.length;
        const arr = new Uint8Array(len);
        for (let i = 0; i < len; i++) {
            arr[i] = binStr.charCodeAt(i);
        }
        return new Blob([arr], { type: type });
    }

    clearGoogleCache() {
        if (this.googleCache && this.googleCache.blobUrl) {
            URL.revokeObjectURL(this.googleCache.blobUrl);
            this.googleCache.blobUrl = null;
            this.googleCache.index = -1;
        }
        if (this.currentGoogleBlobUrl) {
            URL.revokeObjectURL(this.currentGoogleBlobUrl);
            this.currentGoogleBlobUrl = null;
        }
    }
}

window.app = new StoryflowApp();

// Global Error Handler for debugging
window.onerror = function(message, source, lineno, colno, error) {
    const errorMsg = `エラー発生: ${message}\n場所: ${source}:${lineno}`;
    console.error(errorMsg);
    alert(errorMsg);
    return false;
};
