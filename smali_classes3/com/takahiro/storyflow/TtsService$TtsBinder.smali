.class public final Lcom/takahiro/storyflow/TtsService$TtsBinder;
.super Landroid/os/Binder;
.source "TtsService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/takahiro/storyflow/TtsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "TtsBinder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/takahiro/storyflow/TtsService$TtsBinder;",
        "Landroid/os/Binder;",
        "(Lcom/takahiro/storyflow/TtsService;)V",
        "getService",
        "Lcom/takahiro/storyflow/TtsService;",
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
.method public constructor <init>(Lcom/takahiro/storyflow/TtsService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/takahiro/storyflow/TtsService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/takahiro/storyflow/TtsService$TtsBinder;->this$0:Lcom/takahiro/storyflow/TtsService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public final getService()Lcom/takahiro/storyflow/TtsService;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/takahiro/storyflow/TtsService$TtsBinder;->this$0:Lcom/takahiro/storyflow/TtsService;

    return-object v0
.end method
