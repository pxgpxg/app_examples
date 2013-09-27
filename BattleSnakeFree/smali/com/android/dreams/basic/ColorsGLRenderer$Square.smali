.class final Lcom/android/dreams/basic/ColorsGLRenderer$Square;
.super Ljava/lang/Object;
.source "ColorsGLRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/dreams/basic/ColorsGLRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Square"
.end annotation


# instance fields
.field final COLOR_PLANES_PER_VERTEX:I

.field final COORDS_PER_VERTEX:I

.field private final HUES:[F

.field final _tmphsv:[F

.field private final colorBuffer:Ljava/nio/FloatBuffer;

.field private final colorStride:I

.field private cornerFrequencies:[F

.field private cornerRotation:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private mColorHandle:I

.field private mPositionHandle:I

.field private final mProgram:I

.field squareCoords:[F

.field private final vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexCount:I

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>()V
    .locals 13

    .prologue
    const/4 v2, 0x4

    const/16 v4, 0xc

    const/4 v1, 0x3

    const/4 v3, 0x0

    .line 355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    const-string v0, "attribute vec4 a_position;attribute vec4 a_color;varying vec4 v_color;void main() {  gl_Position = a_position;  v_color = a_color;}"

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexShaderCode:Ljava/lang/String;

    .line 311
    const-string v0, "precision mediump float;varying vec4 v_color;void main() {  gl_FragColor = v_color;}"

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->fragmentShaderCode:Ljava/lang/String;

    .line 328
    iput v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->COORDS_PER_VERTEX:I

    .line 329
    new-array v0, v4, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->squareCoords:[F

    .line 334
    const/4 v0, 0x6

    new-array v0, v0, [S

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawOrder:[S

    .line 336
    new-array v0, v2, [F

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->HUES:[F

    .line 343
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->squareCoords:[F

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    .line 344
    iput v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexStride:I

    .line 346
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->cornerFrequencies:[F

    .line 349
    iput v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->COLOR_PLANES_PER_VERTEX:I

    .line 350
    const/16 v0, 0x10

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorStride:I

    .line 406
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->_tmphsv:[F

    .line 356
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    if-ge v8, v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->cornerFrequencies:[F

    const/high16 v2, 0x3f80

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v9

    const-wide/high16 v11, 0x4014

    mul-double/2addr v9, v11

    double-to-float v5, v9

    add-float/2addr v2, v5

    aput v2, v0, v8

    .line 356
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 359
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v9

    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    int-to-double v11, v0

    mul-double/2addr v9, v11

    double-to-int v0, v9

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->cornerRotation:I

    .line 361
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->squareCoords:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 364
    .local v6, bb:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 365
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 366
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->squareCoords:[F

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 367
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 369
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    mul-int/lit8 v0, v0, 0x10

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 370
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 371
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    .line 374
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawOrder:[S

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 377
    .local v7, dlb:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 378
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 379
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawListBuffer:Ljava/nio/ShortBuffer;

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawOrder:[S

    invoke-virtual {v0, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 380
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->drawListBuffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 382
    const-string v0, "attribute vec4 a_position;attribute vec4 a_color;varying vec4 v_color;void main() {  gl_Position = a_position;  v_color = a_color;}"

    const-string v2, "precision mediump float;varying vec4 v_color;void main() {  gl_FragColor = v_color;}"

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->buildProgram(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v0, v2}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$000(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mProgram:I

    .line 385
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mProgram:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 386
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "glUseProgram("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mProgram:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$100(Ljava/lang/String;)V

    .line 389
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mProgram:I

    const-string v2, "a_position"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mPositionHandle:I

    .line 390
    const-string v0, "glGetAttribLocation(a_position)"

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$100(Ljava/lang/String;)V

    .line 393
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mPositionHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 396
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mPositionHandle:I

    const/16 v2, 0x1406

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 400
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mProgram:I

    const-string v1, "a_color"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mColorHandle:I

    .line 401
    const-string v0, "glGetAttribLocation(a_color)"

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$100(Ljava/lang/String;)V

    .line 402
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mColorHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 403
    const-string v0, "glEnableVertexAttribArray"

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$100(Ljava/lang/String;)V

    .line 404
    return-void

    .line 329
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x80t 0xbft
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0xbft
        0x0t 0x0t 0x80t 0xbft
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x80t 0xbft
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 334
    :array_1
    .array-data 0x2
        0x0t 0x0t
        0x1t 0x0t
        0x2t 0x0t
        0x0t 0x0t
        0x2t 0x0t
        0x3t 0x0t
    .end array-data

    .line 336
    :array_2
    .array-data 0x4
        0x0t 0x0t 0x70t 0x42t
        0x0t 0x0t 0xf0t 0x42t
        0x0t 0x80t 0xabt 0x43t
        0x0t 0x0t 0x48t 0x43t
    .end array-data
.end method


# virtual methods
.method public draw()V
    .locals 14

    .prologue
    const/high16 v13, 0x3f80

    const/high16 v12, 0x437f

    const/4 v3, 0x0

    .line 409
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 410
    .local v9, now:J
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 411
    long-to-float v0, v9

    const/high16 v1, 0x457a

    div-float v11, v0, v1

    .line 412
    .local v11, t:F
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    if-ge v8, v0, :cond_0

    .line 413
    const-wide v0, 0x401921fb54442d18L

    float-to-double v4, v11

    mul-double/2addr v0, v4

    iget-object v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->cornerFrequencies:[F

    aget v2, v2, v8

    float-to-double v4, v2

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v7, v0

    .line 414
    .local v7, freq:F
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->_tmphsv:[F

    iget-object v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->HUES:[F

    iget v2, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->cornerRotation:I

    add-int/2addr v2, v8

    iget v4, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    rem-int/2addr v2, v4

    aget v1, v1, v2

    aput v1, v0, v3

    .line 415
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->_tmphsv:[F

    const/4 v1, 0x1

    aput v13, v0, v1

    .line 416
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->_tmphsv:[F

    const/4 v1, 0x2

    const/high16 v2, 0x3e80

    mul-float/2addr v2, v7

    const/high16 v4, 0x3f40

    add-float/2addr v2, v4

    aput v2, v0, v1

    .line 417
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->_tmphsv:[F

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v6

    .line 418
    .local v6, c:I
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    const/high16 v1, 0xff

    and-int/2addr v1, v6

    shr-int/lit8 v1, v1, 0x10

    int-to-float v1, v1

    div-float/2addr v1, v12

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 419
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    const v1, 0xff00

    and-int/2addr v1, v6

    shr-int/lit8 v1, v1, 0x8

    int-to-float v1, v1

    div-float/2addr v1, v12

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 420
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    and-int/lit16 v1, v6, 0xff

    int-to-float v1, v1

    div-float/2addr v1, v12

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 421
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 412
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 423
    .end local v6           #c:I
    .end local v7           #freq:F
    :cond_0
    iget-object v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 424
    iget v0, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->mColorHandle:I

    const/4 v1, 0x4

    const/16 v2, 0x1406

    const/16 v4, 0x10

    iget-object v5, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->colorBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 427
    const-string v0, "glVertexAttribPointer"

    #calls: Lcom/android/dreams/basic/ColorsGLRenderer;->checkGlError(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/dreams/basic/ColorsGLRenderer;->access$100(Ljava/lang/String;)V

    .line 430
    const/4 v0, 0x6

    iget v1, p0, Lcom/android/dreams/basic/ColorsGLRenderer$Square;->vertexCount:I

    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 431
    return-void
.end method
