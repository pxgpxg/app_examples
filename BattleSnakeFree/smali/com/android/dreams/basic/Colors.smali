.class public Lcom/android/dreams/basic/Colors;
.super Landroid/service/dreams/DreamService;
.source "Colors.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# static fields
.field static final TAG:Ljava/lang/String;


# instance fields
.field private mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;

.field private mRendererHandler:Landroid/os/Handler;

.field private mRendererHandlerThread:Landroid/os/HandlerThread;

.field private mTextureView:Landroid/view/TextureView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/android/dreams/basic/Colors;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/dreams/basic/Colors;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/service/dreams/DreamService;-><init>()V

    return-void
.end method

.method public static varargs LOG(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .parameter "fmt"
    .parameter "args"

    .prologue
    .line 37
    return-void
.end method

.method static synthetic access$000(Lcom/android/dreams/basic/Colors;)Lcom/android/dreams/basic/ColorsGLRenderer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/dreams/basic/Colors;Lcom/android/dreams/basic/ColorsGLRenderer;)Lcom/android/dreams/basic/ColorsGLRenderer;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/android/dreams/basic/Colors;->mRenderer:Lcom/android/dreams/basic/ColorsGLRenderer;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/dreams/basic/Colors;)Landroid/os/HandlerThread;
    .locals 1
    .parameter "x0"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    return-object v0
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/dreams/basic/Colors;->setInteractive(Z)V

    .line 69
    invoke-virtual {p0, v1}, Lcom/android/dreams/basic/Colors;->setLowProfile(Z)V

    .line 70
    invoke-virtual {p0, v1}, Lcom/android/dreams/basic/Colors;->setFullscreen(Z)V

    .line 71
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {p0, v0}, Lcom/android/dreams/basic/Colors;->setContentView(Landroid/view/View;)V

    .line 72
    return-void
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 52
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onCreate()V

    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/dreams/basic/Colors;->setInteractive(Z)V

    .line 56
    new-instance v0, Landroid/view/TextureView;

    invoke-direct {v0, p0}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/dreams/basic/Colors;->mTextureView:Landroid/view/TextureView;

    .line 57
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 59
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Landroid/os/HandlerThread;

    sget-object v1, Lcom/android/dreams/basic/Colors;->TAG:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    .line 61
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 62
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandler:Landroid/os/Handler;

    .line 64
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 4
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 77
    const-string v0, "onSurfaceTextureAvailable(%s, %d, %d)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/android/dreams/basic/Colors;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/dreams/basic/Colors$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/dreams/basic/Colors$1;-><init>(Lcom/android/dreams/basic/Colors;Landroid/graphics/SurfaceTexture;II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 89
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 5
    .parameter "surface"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 108
    const-string v1, "onSurfaceTextureDestroyed(%s)"

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v1, v2}, Lcom/android/dreams/basic/Colors;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 110
    iget-object v1, p0, Lcom/android/dreams/basic/Colors;->mRendererHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/dreams/basic/Colors$3;

    invoke-direct {v2, p0}, Lcom/android/dreams/basic/Colors$3;-><init>(Lcom/android/dreams/basic/Colors;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 122
    :try_start_0
    iget-object v1, p0, Lcom/android/dreams/basic/Colors;->mRendererHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_0
    return v3

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v1, "Error while waiting for renderer"

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-static {v1, v2}, Lcom/android/dreams/basic/Colors;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 4
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 94
    const-string v0, "onSurfaceTextureSizeChanged(%s, %d, %d)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/android/dreams/basic/Colors;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    iget-object v0, p0, Lcom/android/dreams/basic/Colors;->mRendererHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/dreams/basic/Colors$2;

    invoke-direct {v1, p0, p2, p3}, Lcom/android/dreams/basic/Colors$2;-><init>(Lcom/android/dreams/basic/Colors;II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 104
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 3
    .parameter "surface"

    .prologue
    .line 132
    const-string v0, "onSurfaceTextureUpdated(%s)"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/android/dreams/basic/Colors;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    return-void
.end method
