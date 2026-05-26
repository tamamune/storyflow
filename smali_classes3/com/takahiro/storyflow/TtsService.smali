.class public final Lcom/takahiro/storyflow/TtsService;
.super Landroid/app/Service;
.source "TtsService.kt"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/takahiro/storyflow/TtsService$TtsBinder;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTtsService.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TtsService.kt\ncom/takahiro/storyflow/TtsService\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,187:1\n1#2:188\n766#3:189\n857#3,2:190\n1549#3:192\n1620#3,3:193\n*S KotlinDebug\n*F\n+ 1 TtsService.kt\ncom/takahiro/storyflow/TtsService\n*L\n110#1:189\n110#1:190,2\n111#1:192\n111#1:193,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0012\u0018\u00002\u00020\u00012\u00020\u0002:\u00011B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0005H\u0002J\u0008\u0010\u001a\u001a\u00020\u001bH\u0002J\u0006\u0010\u001c\u001a\u00020\u0005J\u0012\u0010\u001d\u001a\u00020\u001e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 H\u0016J\u0008\u0010!\u001a\u00020\u001bH\u0016J\u0008\u0010\"\u001a\u00020\u001bH\u0016J\u0010\u0010#\u001a\u00020\u001b2\u0006\u0010$\u001a\u00020\u0007H\u0016J\u0018\u0010%\u001a\u00020\u001b2\u0006\u0010$\u001a\u00020\u00052\u0006\u0010&\u001a\u00020\u0007H\u0002J\u001e\u0010\'\u001a\u00020\u001b2\u0006\u0010(\u001a\u00020\u00052\u0006\u0010)\u001a\u00020\u000e2\u0006\u0010*\u001a\u00020\u0005J\u0008\u0010+\u001a\u00020\u001bH\u0002J,\u0010,\u001a\u00020\u001b2\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00102\u0006\u0010.\u001a\u00020\u00072\u0006\u0010)\u001a\u00020\u000e2\u0006\u0010*\u001a\u00020\u0005J\u0006\u0010/\u001a\u00020\u001bJ\u0010\u00100\u001a\u00020\u001b2\u0006\u0010(\u001a\u00020\u0005H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082D\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00060\tR\u00020\u0000X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\u0008\u0018\u00010\u0015R\u00020\u0016X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00062"
    }
    d2 = {
        "Lcom/takahiro/storyflow/TtsService;",
        "Landroid/app/Service;",
        "Landroid/speech/tts/TextToSpeech$OnInitListener;",
        "()V",
        "CHANNEL_ID",
        "",
        "NOTIFICATION_ID",
        "",
        "binder",
        "Lcom/takahiro/storyflow/TtsService$TtsBinder;",
        "currentIndex",
        "isTtsReady",
        "",
        "playbackRate",
        "",
        "sentences",
        "",
        "tts",
        "Landroid/speech/tts/TextToSpeech;",
        "voiceName",
        "wakeLock",
        "Landroid/os/PowerManager$WakeLock;",
        "Landroid/os/PowerManager;",
        "createNotification",
        "Landroid/app/Notification;",
        "contentText",
        "createNotificationChannel",
        "",
        "getAvailableVoices",
        "onBind",
        "Landroid/os/IBinder;",
        "intent",
        "Landroid/content/Intent;",
        "onCreate",
        "onDestroy",
        "onInit",
        "status",
        "sendBroadcastToActivity",
        "index",
        "speak",
        "text",
        "rate",
        "voice",
        "speakNext",
        "startSpeaking",
        "sentenceList",
        "startIndex",
        "stop",
        "updateNotification",
        "TtsBinder",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final CHANNEL_ID:Ljava/lang/String;

.field private final NOTIFICATION_ID:I

.field private final binder:Lcom/takahiro/storyflow/TtsService$TtsBinder;

.field private currentIndex:I

.field private isTtsReady:Z

.field private playbackRate:F

.field private sentences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tts:Landroid/speech/tts/TextToSpeech;

.field private voiceName:Ljava/lang/String;

.field private wakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 18
    const-string v0, "storyflow_tts_channel"

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->CHANNEL_ID:Ljava/lang/String;

    .line 19
    const/16 v0, 0x3e9

    iput v0, p0, Lcom/takahiro/storyflow/TtsService;->NOTIFICATION_ID:I

    .line 21
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/takahiro/storyflow/TtsService;->playbackRate:F

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->voiceName:Ljava/lang/String;

    .line 32
    new-instance v0, Lcom/takahiro/storyflow/TtsService$TtsBinder;

    invoke-direct {v0, p0}, Lcom/takahiro/storyflow/TtsService$TtsBinder;-><init>(Lcom/takahiro/storyflow/TtsService;)V

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->binder:Lcom/takahiro/storyflow/TtsService$TtsBinder;

    .line 14
    return-void
.end method

.method public static final synthetic access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I
    .locals 1
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;

    .line 14
    iget v0, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    return v0
.end method

.method public static final synthetic access$getSentences$p(Lcom/takahiro/storyflow/TtsService;)Ljava/util/List;
    .locals 1
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;

    .line 14
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    return-object v0
.end method

.method public static final synthetic access$getWakeLock$p(Lcom/takahiro/storyflow/TtsService;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;

    .line 14
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method public static final synthetic access$sendBroadcastToActivity(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;I)V
    .locals 0
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "index"    # I

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/takahiro/storyflow/TtsService;->sendBroadcastToActivity(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$setCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;I)V
    .locals 0
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;
    .param p1, "<set-?>"    # I

    .line 14
    iput p1, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    return-void
.end method

.method public static final synthetic access$speakNext(Lcom/takahiro/storyflow/TtsService;)V
    .locals 0
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;

    .line 14
    invoke-direct {p0}, Lcom/takahiro/storyflow/TtsService;->speakNext()V

    return-void
.end method

.method public static final synthetic access$updateNotification(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;)V
    .locals 0
    .param p0, "$this"    # Lcom/takahiro/storyflow/TtsService;
    .param p1, "text"    # Ljava/lang/String;

    .line 14
    invoke-direct {p0, p1}, Lcom/takahiro/storyflow/TtsService;->updateNotification(Ljava/lang/String;)V

    return-void
.end method

.method private final createNotification(Ljava/lang/String;)Landroid/app/Notification;
    .locals 5
    .param p1, "contentText"    # Ljava/lang/String;

    .line 152
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/takahiro/storyflow/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 154
    .local v0, "notificationIntent":Landroid/content/Intent;
    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    .line 155
    nop

    .line 153
    const/4 v2, 0x0

    const/high16 v3, 0x4000000

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 158
    .local v1, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v2, Landroidx/core/app/NotificationCompat$Builder;

    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    iget-object v4, p0, Lcom/takahiro/storyflow/TtsService;->CHANNEL_ID:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 159
    const-string v3, "Storyflow"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    .line 160
    move-object v3, p1

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    .line 161
    const v3, 0x10800a4

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    .line 162
    invoke-virtual {v2, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    .line 163
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    .line 164
    invoke-virtual {v2}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    const-string v3, "build(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    return-object v2
.end method

.method private final createNotificationChannel()V
    .locals 4

    .line 140
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 141
    new-instance v0, Landroid/app/NotificationChannel;

    .line 142
    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService;->CHANNEL_ID:Ljava/lang/String;

    .line 143
    const-string v2, "Storyflow TTS Service"

    check-cast v2, Ljava/lang/CharSequence;

    .line 144
    nop

    .line 141
    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 146
    .local v0, "serviceChannel":Landroid/app/NotificationChannel;
    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {p0, v1}, Lcom/takahiro/storyflow/TtsService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 147
    .local v1, "manager":Landroid/app/NotificationManager;
    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 149
    .end local v0    # "serviceChannel":Landroid/app/NotificationChannel;
    .end local v1    # "manager":Landroid/app/NotificationManager;
    :cond_0
    return-void
.end method

.method private final sendBroadcastToActivity(Ljava/lang/String;I)V
    .locals 2
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "index"    # I

    .line 174
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.takahiro.storyflow.TTS_STATUS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 175
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "status"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 176
    const-string v1, "index"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 177
    invoke-virtual {p0, v0}, Lcom/takahiro/storyflow/TtsService;->sendBroadcast(Landroid/content/Intent;)V

    .line 178
    return-void
.end method

.method private final speakNext()V
    .locals 8

    .line 119
    iget-boolean v0, p0, Lcom/takahiro/storyflow/TtsService;->isTtsReady:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 120
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    iget v1, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 121
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/takahiro/storyflow/TtsService;->playbackRate:F

    invoke-virtual {v1, v2}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 122
    :cond_0
    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService;->voiceName:Ljava/lang/String;

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-eqz v1, :cond_5

    .line 123
    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_5

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Landroid/speech/tts/Voice;

    .line 188
    .local v4, "it":Landroid/speech/tts/Voice;
    const/4 v5, 0x0

    .line 123
    .local v5, "$i$a$-find-TtsService$speakNext$1":I
    invoke-virtual {v4}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/takahiro/storyflow/TtsService;->voiceName:Ljava/lang/String;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    .end local v4    # "it":Landroid/speech/tts/Voice;
    .end local v5    # "$i$a$-find-TtsService$speakNext$1":I
    if-eqz v4, :cond_2

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    :goto_1
    check-cast v3, Landroid/speech/tts/Voice;

    if-eqz v3, :cond_5

    move-object v1, v3

    .line 188
    .local v1, "it":Landroid/speech/tts/Voice;
    const/4 v3, 0x0

    .line 123
    .local v3, "$i$a$-let-TtsService$speakNext$2":I
    iget-object v4, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-nez v4, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v4, v1}, Landroid/speech/tts/TextToSpeech;->setVoice(Landroid/speech/tts/Voice;)I

    .line 125
    .end local v1    # "it":Landroid/speech/tts/Voice;
    .end local v3    # "$i$a$-let-TtsService$speakNext$2":I
    :cond_5
    :goto_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 126
    .local v1, "params":Landroid/os/Bundle;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "storyflow_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "utteranceId"

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v3, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v3, :cond_6

    move-object v5, v0

    check-cast v5, Ljava/lang/CharSequence;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v6, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v5, v2, v1, v4}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    .line 128
    :cond_6
    invoke-direct {p0, v0}, Lcom/takahiro/storyflow/TtsService;->updateNotification(Ljava/lang/String;)V

    .line 130
    .end local v0    # "text":Ljava/lang/String;
    .end local v1    # "params":Landroid/os/Bundle;
    :cond_7
    return-void
.end method

.method private final updateNotification(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .line 168
    invoke-direct {p0, p1}, Lcom/takahiro/storyflow/TtsService;->createNotification(Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v0

    .line 169
    .local v0, "notification":Landroid/app/Notification;
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/takahiro/storyflow/TtsService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type android.app.NotificationManager"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/app/NotificationManager;

    .line 170
    .local v1, "manager":Landroid/app/NotificationManager;
    iget v2, p0, Lcom/takahiro/storyflow/TtsService;->NOTIFICATION_ID:I

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 171
    return-void
.end method


# virtual methods
.method public final getAvailableVoices()Ljava/lang/String;
    .locals 14

    .line 108
    iget-boolean v0, p0, Lcom/takahiro/storyflow/TtsService;->isTtsReady:Z

    const-string v1, ""

    if-eqz v0, :cond_6

    .line 109
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 110
    .local v0, "voices":Ljava/util/Set;
    :goto_0
    if-eqz v0, :cond_5

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 189
    .local v3, "$i$f$filter":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 190
    .local v6, "$i$f$filterTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Landroid/speech/tts/Voice;

    .local v9, "it":Landroid/speech/tts/Voice;
    const/4 v10, 0x0

    .line 110
    .local v10, "$i$a$-filter-TtsService$getAvailableVoices$1":I
    invoke-virtual {v9}, Landroid/speech/tts/Voice;->getLocale()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    const-string v12, "ja"

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    .line 190
    .end local v9    # "it":Landroid/speech/tts/Voice;
    .end local v10    # "$i$a$-filter-TtsService$getAvailableVoices$1":I
    if-eqz v9, :cond_1

    invoke-interface {v4, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 191
    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    :cond_2
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filterTo":I
    check-cast v4, Ljava/util/List;

    .line 189
    nop

    .line 110
    .end local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$filter":I
    nop

    .line 111
    nop

    .line 110
    check-cast v4, Ljava/lang/Iterable;

    .line 111
    move-object v2, v4

    .local v2, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 192
    .local v3, "$i$f$map":I
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v2, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v4, Ljava/util/Collection;

    .restart local v4    # "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 193
    .local v6, "$i$f$mapTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 194
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Landroid/speech/tts/Voice;

    .restart local v9    # "it":Landroid/speech/tts/Voice;
    const/4 v10, 0x0

    .line 111
    .local v10, "$i$a$-map-TtsService$getAvailableVoices$2":I
    invoke-virtual {v9}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v9

    .line 194
    .end local v9    # "it":Landroid/speech/tts/Voice;
    .end local v10    # "$i$a$-map-TtsService$getAvailableVoices$2":I
    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 195
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    :cond_3
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapTo":I
    check-cast v4, Ljava/util/List;

    .line 192
    nop

    .line 111
    .end local v2    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$map":I
    nop

    .line 112
    nop

    .line 111
    move-object v5, v4

    check-cast v5, Ljava/lang/Iterable;

    .line 112
    const-string v2, ","

    move-object v6, v2

    check-cast v6, Ljava/lang/CharSequence;

    const/16 v12, 0x3e

    const/4 v13, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v5 .. v13}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 110
    if-nez v2, :cond_4

    goto :goto_3

    :cond_4
    move-object v1, v2

    goto :goto_4

    .line 112
    :cond_5
    :goto_3
    nop

    .end local v0    # "voices":Ljava/util/Set;
    goto :goto_4

    .line 114
    :cond_6
    nop

    .line 108
    :goto_4
    return-object v1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 34
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->binder:Lcom/takahiro/storyflow/TtsService$TtsBinder;

    check-cast v0, Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .line 37
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 38
    invoke-direct {p0}, Lcom/takahiro/storyflow/TtsService;->createNotificationChannel()V

    .line 39
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    move-object v2, p0

    check-cast v2, Landroid/speech/tts/TextToSpeech$OnInitListener;

    invoke-direct {v0, v1, v2}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    .line 41
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/takahiro/storyflow/TtsService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.os.PowerManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/os/PowerManager;

    .line 42
    .local v0, "powerManager":Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "Storyflow::TtsWakeLock"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 44
    iget v1, p0, Lcom/takahiro/storyflow/TtsService;->NOTIFICATION_ID:I

    const-string v2, "\u8aad\u307f\u4e0a\u3052\u6e96\u5099\u4e2d..."

    invoke-direct {p0, v2}, Lcom/takahiro/storyflow/TtsService;->createNotification(Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/takahiro/storyflow/TtsService;->startForeground(ILandroid/app/Notification;)V

    .line 45
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .line 181
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->stop()I

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    move v1, v2

    :cond_2
    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 184
    :cond_3
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 185
    return-void
.end method

.method public onInit(I)V
    .locals 2
    .param p1, "status"    # I

    .line 48
    if-nez p1, :cond_1

    .line 49
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    sget-object v1, Ljava/util/Locale;->JAPANESE:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    .line 50
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/takahiro/storyflow/TtsService;->isTtsReady:Z

    .line 52
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_1

    new-instance v1, Lcom/takahiro/storyflow/TtsService$onInit$1;

    invoke-direct {v1, p0}, Lcom/takahiro/storyflow/TtsService$onInit$1;-><init>(Lcom/takahiro/storyflow/TtsService;)V

    check-cast v1, Landroid/speech/tts/UtteranceProgressListener;

    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    .line 78
    :cond_1
    return-void
.end method

.method public final speak(Ljava/lang/String;FLjava/lang/String;)V
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "rate"    # F
    .param p3, "voice"    # Ljava/lang/String;

    const-string v0, "text"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "voice"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    invoke-virtual {p0}, Lcom/takahiro/storyflow/TtsService;->stop()V

    .line 95
    iget-boolean v0, p0, Lcom/takahiro/storyflow/TtsService;->isTtsReady:Z

    if-eqz v0, :cond_7

    .line 96
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 97
    :cond_0
    move-object v0, p3

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    if-eqz v0, :cond_5

    .line 98
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_5

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/speech/tts/Voice;

    .line 188
    .local v3, "it":Landroid/speech/tts/Voice;
    const/4 v4, 0x0

    .line 98
    .local v4, "$i$a$-find-TtsService$speak$1":I
    invoke-virtual {v3}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    .end local v3    # "it":Landroid/speech/tts/Voice;
    .end local v4    # "$i$a$-find-TtsService$speak$1":I
    if-eqz v3, :cond_2

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    check-cast v2, Landroid/speech/tts/Voice;

    if-eqz v2, :cond_5

    move-object v0, v2

    .line 188
    .local v0, "it":Landroid/speech/tts/Voice;
    const/4 v2, 0x0

    .line 98
    .local v2, "$i$a$-let-TtsService$speak$2":I
    iget-object v3, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v3, v0}, Landroid/speech/tts/TextToSpeech;->setVoice(Landroid/speech/tts/Voice;)I

    .line 100
    .end local v0    # "it":Landroid/speech/tts/Voice;
    .end local v2    # "$i$a$-let-TtsService$speak$2":I
    :cond_5
    :goto_2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 101
    .local v0, "params":Landroid/os/Bundle;
    const-string v2, "utteranceId"

    const-string v3, "preview"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v2, :cond_6

    move-object v4, p1

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v2, v4, v1, v0, v3}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    .line 103
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u8a66\u8074: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/takahiro/storyflow/TtsService;->updateNotification(Ljava/lang/String;)V

    .line 105
    .end local v0    # "params":Landroid/os/Bundle;
    :cond_7
    return-void
.end method

.method public final startSpeaking(Ljava/util/List;IFLjava/lang/String;)V
    .locals 3
    .param p1, "sentenceList"    # Ljava/util/List;
    .param p2, "startIndex"    # I
    .param p3, "rate"    # F
    .param p4, "voice"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;IF",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "sentenceList"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "voice"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    iput-object p1, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    .line 82
    iput p2, p0, Lcom/takahiro/storyflow/TtsService;->currentIndex:I

    .line 83
    iput p3, p0, Lcom/takahiro/storyflow/TtsService;->playbackRate:F

    .line 84
    iput-object p4, p0, Lcom/takahiro/storyflow/TtsService;->voiceName:Ljava/lang/String;

    .line 86
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 87
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_1

    const-wide/32 v1, 0x927c0

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 90
    :cond_1
    invoke-direct {p0}, Lcom/takahiro/storyflow/TtsService;->speakNext()V

    .line 91
    return-void
.end method

.method public final stop()V
    .locals 3

    .line 133
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->stop()I

    .line 134
    :cond_0
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/takahiro/storyflow/TtsService;->sentences:Ljava/util/List;

    .line 135
    const-string v0, "\u505c\u6b62\u4e2d"

    invoke-direct {p0, v0}, Lcom/takahiro/storyflow/TtsService;->updateNotification(Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    move v1, v2

    :cond_1
    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 137
    :cond_2
    return-void
.end method
