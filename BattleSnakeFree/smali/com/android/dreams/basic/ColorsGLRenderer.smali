.class final Lcom/android/dreams/basic/ColorsGLRenderer;
.super Ljava/lang/Object;
.source "ColorsGLRenderer.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/dreams/basic/ColorsGLRenderer$Square;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String;


# instance fields
.field private final mChoreographer:Landroid/view/Choreographer;

.field private mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field private mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mFrameNum:I

.field private mHeight:I

.field private mSquare:Lcom/android/dreams/basic/ColorsGLRenderer$Square;

.field private final mSurface:Landroid/graphics/SurfaceTexture;

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-class v0, Lcom/android/dreams/basic/ColorsGLRenderer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/SurfaceTexture;II)V
    .locals 1
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mFrameNum:I

    .line 74
    iput-object p1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mSurface:Landroid/graphics/SurfaceTexture;

    .line 75
    iput p2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mWidth:I

    .line 76
    iput p3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mHeight:I

    .line 78
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mChoreographer:Landroid/view/Choreographer;

    .line 79
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-static {p0, p1}, Lcom/android/dreams/basic/ColorsGLRenderer;->buildProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 48
    invoke-static {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V

    return-void
.end method

.method private static buildProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 9
    .parameter "vertex"
    .parameter "fragment"

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 231
    const v6, 0x8b31

    invoke-static {p0, v6}, Lcom/android/dreams/basic/ColorsGLRenderer;->buildShader(Ljava/lang/String;I)I

    move-result v4

    .line 232
    .local v4, vertexShader:I
    if-nez v4, :cond_1

    move v2, v5

    .line 258
    :cond_0
    :goto_0
    return v2

    .line 234
    :cond_1
    const v6, 0x8b30

    invoke-static {p1, v6}, Lcom/android/dreams/basic/ColorsGLRenderer;->buildShader(Ljava/lang/String;I)I

    move-result v1

    .line 235
    .local v1, fragmentShader:I
    if-nez v1, :cond_2

    move v2, v5

    goto :goto_0

    .line 237
    :cond_2
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v2

    .line 238
    .local v2, program:I
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 239
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 241
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 242
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 244
    invoke-static {v2}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 245
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 247
    new-array v3, v7, [I

    .line 248
    .local v3, status:[I
    const v6, 0x8b82

    invoke-static {v2, v6, v3, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 249
    aget v6, v3, v5

    if-eq v6, v7, :cond_0

    .line 250
    invoke-static {v2}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, error:Ljava/lang/String;
    sget-object v6, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error while linking program:\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    invoke-static {v4}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 253
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 254
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    move v2, v5

    .line 255
    goto :goto_0
.end method

.method private static buildShader(Ljava/lang/String;I)I
    .locals 7
    .parameter "source"
    .parameter "type"

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 262
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v1

    .line 264
    .local v1, shader:I
    invoke-static {v1, p0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 265
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 267
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 268
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 270
    new-array v2, v5, [I

    .line 271
    .local v2, status:[I
    const v4, 0x8b81

    invoke-static {v1, v4, v2, v3}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 272
    aget v4, v2, v3

    if-eq v4, v5, :cond_0

    .line 273
    invoke-static {v1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, error:Ljava/lang/String;
    sget-object v4, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error while compiling shader:\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    move v1, v3

    .line 279
    .end local v0           #error:Ljava/lang/String;
    .end local v1           #shader:I
    :cond_0
    return v1
.end method

.method private checkCurrent()V
    .locals 5

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    const/16 v2, 0x3059

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentSurface(I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 148
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "eglMakeCurrent failed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v2

    invoke-static {v2}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_1
    return-void
.end method

.method private checkEglError()V
    .locals 4

    .prologue
    .line 283
    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .line 284
    .local v0, error:I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 285
    sget-object v1, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EGL error = 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    :cond_0
    return-void
.end method

.method private static checkGlError()V
    .locals 1

    .prologue
    .line 290
    const-string v0, ""

    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V

    .line 291
    return-void
.end method

.method private static checkGlError(Ljava/lang/String;)V
    .locals 4
    .parameter "what"

    .prologue
    .line 294
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .line 295
    .local v0, error:I
    if-eqz v0, :cond_0

    .line 296
    sget-object v1, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GL error: ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") = 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    :cond_0
    return-void
.end method

.method private chooseEglConfig()Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x1

    .line 205
    new-array v5, v4, [I

    .line 206
    .local v5, configsCount:[I
    new-array v3, v4, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 207
    .local v3, configs:[Ljavax/microedition/khronos/egl/EGLConfig;
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->getConfig()[I

    move-result-object v2

    .line 208
    .local v2, configSpec:[I
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface/range {v0 .. v5}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "eglChooseConfig failed "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v4

    invoke-static {v4}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_0
    aget v0, v5, v6

    if-lez v0, :cond_1

    .line 212
    aget-object v0, v3, v6

    .line 214
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 2
    .parameter "egl"
    .parameter "eglDisplay"
    .parameter "eglConfig"

    .prologue
    .line 200
    const/4 v1, 0x3

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 201
    .local v0, attrib_list:[I
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    return-object v1

    .line 200
    nop

    :array_0
    .array-data 0x4
        0x98t 0x30t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x38t 0x30t 0x0t 0x0t
    .end array-data
.end method

.method private finishGL()V
    .locals 3

    .prologue
    .line 195
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 196
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 197
    return-void
.end method

.method private static getConfig()[I
    .locals 1

    .prologue
    .line 218
    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 0x4
        0x40t 0x30t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
        0x24t 0x30t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
        0x23t 0x30t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
        0x22t 0x30t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
        0x21t 0x30t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x25t 0x30t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x26t 0x30t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x38t 0x30t 0x0t 0x0t
    .end array-data
.end method

.method private initGL()V
    .locals 8

    .prologue
    .line 155
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v3

    check-cast v3, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 157
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    iput-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 158
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-ne v3, v4, :cond_0

    .line 159
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "eglGetDisplay failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v5

    invoke-static {v5}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 163
    :cond_0
    const/4 v3, 0x2

    new-array v2, v3, [I

    .line 164
    .local v2, version:[I
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v3, v4, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 165
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "eglInitialize failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v5

    invoke-static {v5}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 169
    :cond_1
    invoke-direct {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->chooseEglConfig()Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    .line 170
    .local v0, eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;
    if-nez v0, :cond_2

    .line 171
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "eglConfig not initialized"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 174
    :cond_2
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-static {v3, v4, v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v3

    iput-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 176
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mSurface:Landroid/graphics/SurfaceTexture;

    const/4 v6, 0x0

    invoke-interface {v3, v4, v0, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    iput-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 178
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v3, v4, :cond_6

    .line 179
    :cond_3
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v3}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    .line 180
    .local v1, error:I
    const/16 v3, 0x300b

    if-ne v1, v3, :cond_5

    .line 181
    sget-object v3, Lcom/android/dreams/basic/ColorsGLRenderer;->TAG:Ljava/lang/String;

    const-string v4, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .end local v1           #error:I
    :cond_4
    return-void

    .line 184
    .restart local v1       #error:I
    :cond_5
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createWindowSurface failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v1}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 188
    .end local v1           #error:I
    :cond_6
    iget-object v3, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v6, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v7, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v3, v4, v5, v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 189
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "eglMakeCurrent failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v5

    invoke-static {v5}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public doFrame(J)V
    .locals 5
    .parameter "frameTimeNanos"

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    .line 103
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mFrameNum:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mFrameNum:I

    .line 106
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mFrameNum:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 107
    invoke-static {v3, v2, v2, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 114
    :cond_0
    invoke-direct {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkCurrent()V

    .line 116
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mWidth:I

    iget v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mHeight:I

    invoke-static {v4, v4, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 130
    const/16 v0, 0x4000

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 131
    invoke-static {}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError()V

    .line 133
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mSquare:Lcom/android/dreams/basic/ColorsGLRenderer$Square;

    invoke-virtual {v0}, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->draw()V

    .line 135
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 136
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Cannot swap buffers"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_1
    invoke-direct {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->checkEglError()V

    .line 141
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mChoreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 142
    return-void
.end method

.method public setSize(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 97
    iput p1, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mWidth:I

    .line 98
    iput p2, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mHeight:I

    .line 99
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->initGL()V

    .line 83
    new-instance v0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;

    invoke-direct {v0}, Lcom/android/dreams/basic/ColorsGLRenderer$Square;-><init>()V

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mSquare:Lcom/android/dreams/basic/ColorsGLRenderer$Square;

    .line 85
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mFrameNum:I

    .line 86
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mChoreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 87
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mChoreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer;->mSquare:Lcom/android/dreams/basic/ColorsGLRenderer$Square;

    .line 93
    invoke-direct {p0}, Lcom/android/dreams/basic/ColorsGLRenderer;->finishGL()V

    .line 94
    return-void
.end method
