.class public final Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/takahiro/storyflow/MainActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001c\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "com/takahiro/storyflow/MainActivity$ttsReceiver$1",
        "Landroid/content/BroadcastReceiver;",
        "onReceive",
        "",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
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
.method public static synthetic $r8$lambda$7Ig0tNGDj2icngPCd_ynXJG-Bd0(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;->onReceive$lambda$0(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/takahiro/storyflow/MainActivity;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/takahiro/storyflow/MainActivity;

    iput-object p1, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    .line 42
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static final onReceive$lambda$0(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V
    .locals 4
    .param p0, "$status"    # Ljava/lang/String;
    .param p1, "$index"    # I
    .param p2, "this$0"    # Lcom/takahiro/storyflow/MainActivity;

    const-string v0, "this$0"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    nop

    .line 48
    const-string v0, "START"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "webView"

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 49
    const/4 v0, -0x1

    if-eq p1, v0, :cond_3

    .line 50
    invoke-static {p2}, Lcom/takahiro/storyflow/MainActivity;->access$getWebView$p(Lcom/takahiro/storyflow/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "if(window.app) window.app.onNativeSpeechStart("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v3, 0x29

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    goto :goto_0

    .line 53
    :cond_1
    const-string v0, "DONE"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p2}, Lcom/takahiro/storyflow/MainActivity;->access$getWebView$p(Lcom/takahiro/storyflow/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_2
    const-string v1, "if(window.app) window.app.onNativeSpeechEnd()"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 55
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 44
    if-eqz p2, :cond_0

    const-string v0, "status"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 45
    .local v0, "status":Ljava/lang/String;
    :goto_0
    const/4 v1, -0x1

    if-eqz p2, :cond_1

    const-string v2, "index"

    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 46
    .local v1, "index":I
    :cond_1
    iget-object v2, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    iget-object v3, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    new-instance v4, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;

    invoke-direct {v4, v0, v1, v3}, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V

    invoke-virtual {v2, v4}, Lcom/takahiro/storyflow/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 56
    return-void
.end method
