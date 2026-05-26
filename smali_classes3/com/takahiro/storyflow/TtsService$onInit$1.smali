.class public final Lcom/takahiro/storyflow/TtsService$onInit$1;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "TtsService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/takahiro/storyflow/TtsService;->onInit(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J\u0012\u0010\u0006\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J\u0012\u0010\u0007\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "com/takahiro/storyflow/TtsService$onInit$1",
        "Landroid/speech/tts/UtteranceProgressListener;",
        "onDone",
        "",
        "utteranceId",
        "",
        "onError",
        "onStart",
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
.field final synthetic this$0:Lcom/takahiro/storyflow/TtsService;


# direct methods
.method constructor <init>(Lcom/takahiro/storyflow/TtsService;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/takahiro/storyflow/TtsService;

    iput-object p1, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    .line 52
    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Ljava/lang/String;)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 59
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, "storyflow_"

    invoke-static {p1, v4, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-ne v2, v0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_3

    .line 60
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v2}, Lcom/takahiro/storyflow/TtsService;->access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I

    move-result v3

    add-int/2addr v3, v0

    invoke-static {v2, v3}, Lcom/takahiro/storyflow/TtsService;->access$setCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;I)V

    .line 61
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v2}, Lcom/takahiro/storyflow/TtsService;->access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I

    move-result v2

    iget-object v3, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v3}, Lcom/takahiro/storyflow/TtsService;->access$getSentences$p(Lcom/takahiro/storyflow/TtsService;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 62
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v0}, Lcom/takahiro/storyflow/TtsService;->access$speakNext(Lcom/takahiro/storyflow/TtsService;)V

    goto :goto_2

    .line 64
    :cond_1
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    const-string v3, "\u8aad\u4e86\u3057\u307e\u3057\u305f"

    invoke-static {v2, v3}, Lcom/takahiro/storyflow/TtsService;->access$updateNotification(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;)V

    .line 65
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    iget-object v3, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v3}, Lcom/takahiro/storyflow/TtsService;->access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I

    move-result v3

    const-string v4, "DONE"

    invoke-static {v2, v4, v3}, Lcom/takahiro/storyflow/TtsService;->access$sendBroadcastToActivity(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;I)V

    .line 66
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v2}, Lcom/takahiro/storyflow/TtsService;->access$getWakeLock$p(Lcom/takahiro/storyflow/TtsService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-ne v2, v0, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v0}, Lcom/takahiro/storyflow/TtsService;->access$getWakeLock$p(Lcom/takahiro/storyflow/TtsService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 69
    :cond_3
    :goto_2
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 71
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, "storyflow_"

    invoke-static {p1, v4, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-ne v2, v0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_2

    .line 72
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    iget-object v3, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v3}, Lcom/takahiro/storyflow/TtsService;->access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I

    move-result v3

    const-string v4, "ERROR"

    invoke-static {v2, v4, v3}, Lcom/takahiro/storyflow/TtsService;->access$sendBroadcastToActivity(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;I)V

    .line 73
    iget-object v2, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v2}, Lcom/takahiro/storyflow/TtsService;->access$getWakeLock$p(Lcom/takahiro/storyflow/TtsService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v0}, Lcom/takahiro/storyflow/TtsService;->access$getWakeLock$p(Lcom/takahiro/storyflow/TtsService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 75
    :cond_2
    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .locals 4
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 54
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, "storyflow_"

    invoke-static {p1, v3, v0, v1, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    move v0, v2

    :cond_0
    if-eqz v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    iget-object v1, p0, Lcom/takahiro/storyflow/TtsService$onInit$1;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-static {v1}, Lcom/takahiro/storyflow/TtsService;->access$getCurrentIndex$p(Lcom/takahiro/storyflow/TtsService;)I

    move-result v1

    const-string v2, "START"

    invoke-static {v0, v2, v1}, Lcom/takahiro/storyflow/TtsService;->access$sendBroadcastToActivity(Lcom/takahiro/storyflow/TtsService;Ljava/lang/String;I)V

    .line 57
    :cond_1
    return-void
.end method
