.class public final synthetic Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcom/takahiro/storyflow/MainActivity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput p2, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$2:Lcom/takahiro/storyflow/MainActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget v1, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1$$ExternalSyntheticLambda0;->f$2:Lcom/takahiro/storyflow/MainActivity;

    invoke-static {v0, v1, v2}, Lcom/takahiro/storyflow/MainActivity$ttsReceiver$1;->$r8$lambda$7Ig0tNGDj2icngPCd_ynXJG-Bd0(Ljava/lang/String;ILcom/takahiro/storyflow/MainActivity;)V

    return-void
.end method
