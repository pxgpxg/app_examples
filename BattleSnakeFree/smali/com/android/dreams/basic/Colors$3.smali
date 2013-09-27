.class Lcom/android/dreams/basic/Colors$3;
.super Ljava/lang/Object;
.source "Colors.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/dreams/basic/Colors;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/dreams/basic/Colors;


# direct methods
.method constructor <init>(Lcom/android/dreams/basic/Colors;)V
    .locals 0
    .parameter

    .prologue
    .line 110
    iput-object p1, p0, Lcom/android/dreams/basic/Colors$3;->this$0:Lcom/android/dreams/basic/Colors;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$3;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$3;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->stop()V

    .line 115
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$3;->this$0:Lcom/android/dreams/basic/Colors;

    const/4 v1, 0x0

    #setter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0, v1}, Lcom/android/dreams/basic/Colors;->access$002(Lcom/android/dreams/basic/Colors;Lcom/android/dreams/basic/ColorsGLRenderer;)Lcom/android/dreams/basic/ColorsGLRenderer;

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$3;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$100(Lcom/android/dreams/basic/Colors;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 118
    return-void
.end method
