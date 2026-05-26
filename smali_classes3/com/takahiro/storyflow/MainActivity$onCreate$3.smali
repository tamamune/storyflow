.class public final Lcom/takahiro/storyflow/MainActivity$onCreate$3;
.super Landroid/webkit/WebChromeClient;
.source "MainActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/takahiro/storyflow/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J2\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0014\u0010\u0006\u001a\u0010\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0016\u00a8\u0006\u000c"
    }
    d2 = {
        "com/takahiro/storyflow/MainActivity$onCreate$3",
        "Landroid/webkit/WebChromeClient;",
        "onShowFileChooser",
        "",
        "webView",
        "Landroid/webkit/WebView;",
        "filePathCallback",
        "Landroid/webkit/ValueCallback;",
        "",
        "Landroid/net/Uri;",
        "fileChooserParams",
        "Landroid/webkit/WebChromeClient$FileChooserParams;",
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
.field final synthetic this$0:Lcom/takahiro/storyflow/MainActivity;


# direct methods
.method constructor <init>(Lcom/takahiro/storyflow/MainActivity;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/takahiro/storyflow/MainActivity;

    iput-object p1, p0, Lcom/takahiro/storyflow/MainActivity$onCreate$3;->this$0:Lcom/takahiro/storyflow/MainActivity;

    .line 124
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 4
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "filePathCallback"    # Landroid/webkit/ValueCallback;
    .param p3, "fileChooserParams"    # Landroid/webkit/WebChromeClient$FileChooserParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/takahiro/storyflow/MainActivity$onCreate$3;->this$0:Lcom/takahiro/storyflow/MainActivity;

    invoke-static {v0}, Lcom/takahiro/storyflow/MainActivity;->access$getFilePathCallback$p(Lcom/takahiro/storyflow/MainActivity;)Landroid/webkit/ValueCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/takahiro/storyflow/MainActivity$onCreate$3;->this$0:Lcom/takahiro/storyflow/MainActivity;

    invoke-static {v0, p2}, Lcom/takahiro/storyflow/MainActivity;->access$setFilePathCallback$p(Lcom/takahiro/storyflow/MainActivity;Landroid/webkit/ValueCallback;)V

    .line 133
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 134
    .local v0, "intentPicker":Landroid/content/Intent;
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 136
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "text/plain"

    aput-object v3, v1, v2

    const-string v2, "application/epub+zip"

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 137
    .local v1, "mimeTypes":[Ljava/lang/String;
    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    iget-object v2, p0, Lcom/takahiro/storyflow/MainActivity$onCreate$3;->this$0:Lcom/takahiro/storyflow/MainActivity;

    invoke-static {v2}, Lcom/takahiro/storyflow/MainActivity;->access$getFileChooserLauncher$p(Lcom/takahiro/storyflow/MainActivity;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 140
    return v3
.end method
