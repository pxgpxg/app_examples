.class Lcom/android/dreams/basic/Colors$1;
.super Ljava/lang/Object;
.source "Colors.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/dreams/basic/Colors;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/dreams/basic/Colors;

.field final synthetic val$height:I

.field final synthetic val$surface:Landroid/graphics/SurfaceTexture;

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/android/dreams/basic/Colors;Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 79
    iput-object p1, p0, Lcom/android/dreams/basic/Colors$1;->this$0:Lcom/android/dreams/basic/Colors;

    iput-object p2, p0, Lcom/android/dreams/basic/Colors$1;->val$surface:Landroid/graphics/SurfaceTexture;

    iput p3, p0, Lcom/android/dreams/basic/Colors$1;->val$width:I

    iput p4, p0, Lcom/android/dreams/basic/Colors$1;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 82
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$1;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$1;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->stop()V

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$1;->this$0:Lcom/android/dreams/basic/Colors;

    new-instance v1, Lcom/android/dreams/basic/ColorsGLRenderer;

    iget-object v2, p0, Lcom/android/dreams/basic/Colors$1;->val$surface:Landroid/graphics/SurfaceTexture;

    iget v3, p0, Lcom/android/dreams/basic/Colors$1;->val$width:I

    iget v4, p0, Lcom/android/dreams/basic/Colors$1;->val$height:I

    invoke-direct {v1, v2, v3, v4}, Lcom/android/dreams/basic/ColorsGLRenderer;-><init>(Landroid/graphics/SurfaceTexture;II)V

    #setter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0, v1}, Lcom/android/dreams/basic/Colors;->access$002(Lcom/android/dreams/basic/Colors;Lcom/android/dreams/basic/ColorsGLRenderer;)Lcom/android/dreams/basic/ColorsGLRenderer;

    .line 86
    iget-object v0, p0, Lcom/android/dreams/basic/Colors$1;->this$0:Lcom/android/dreams/basic/Colors;

    #getter for: Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;
    invoke-static {v0}, Lcom/android/dreams/basic/Colors;->access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->start()V

    .line 87
    return-void
.end method
