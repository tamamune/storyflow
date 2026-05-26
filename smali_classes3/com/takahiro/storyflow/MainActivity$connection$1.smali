.class public final Lcom/takahiro/storyflow/MainActivity$connection$1;
.super Ljava/lang/Object;
.source "MainActivity.kt"

# interfaces
.implements Landroid/content/ServiceConnection;


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
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\u0005H\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/takahiro/storyflow/MainActivity$connection$1",
        "Landroid/content/ServiceConnection;",
        "onServiceConnected",
        "",
        "className",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
        "arg0",
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

    iput-object p1, p0, Lcom/takahiro/storyflow/MainActivity$connection$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    const-string v0, "className"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "service"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    move-object v0, p2

    check-cast v0, Lcom/takahiro/storyflow/TtsService$TtsBinder;

    .line 34
    .local v0, "binder":Lcom/takahiro/storyflow/TtsService$TtsBinder;
    iget-object v1, p0, Lcom/takahiro/storyflow/MainActivity$connection$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    invoke-virtual {v0}, Lcom/takahiro/storyflow/TtsService$TtsBinder;->getService()Lcom/takahiro/storyflow/TtsService;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/takahiro/storyflow/MainActivity;->access$setTtsService$p(Lcom/takahiro/storyflow/MainActivity;Lcom/takahiro/storyflow/TtsService;)V

    .line 35
    iget-object v1, p0, Lcom/takahiro/storyflow/MainActivity$connection$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/takahiro/storyflow/MainActivity;->access$setBound$p(Lcom/takahiro/storyflow/MainActivity;Z)V

    .line 36
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "arg0"    # Landroid/content/ComponentName;

    const-string v0, "arg0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/takahiro/storyflow/MainActivity$connection$1;->this$0:Lcom/takahiro/storyflow/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/takahiro/storyflow/MainActivity;->access$setBound$p(Lcom/takahiro/storyflow/MainActivity;Z)V

    .line 39
    return-void
.end method
