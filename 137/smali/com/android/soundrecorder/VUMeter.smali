.class public Lcom/android/soundrecorder/VUMeter;
.super Landroid/view/View;
.source "VUMeter.java"


# instance fields
.field mCurrentAngle:F

.field mPaint:Landroid/graphics/Paint;

.field mRecorder:Lcom/android/soundrecorder/Recorder;

.field mShadow:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 44
    invoke-virtual {p0, p1}, Lcom/android/soundrecorder/VUMeter;->init(Landroid/content/Context;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/soundrecorder/VUMeter;->init(Landroid/content/Context;)V

    .line 50
    return-void
.end method


# virtual methods
.method init(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 54
    .local v0, background:Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/VUMeter;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/android/soundrecorder/VUMeter;->mPaint:Landroid/graphics/Paint;

    .line 57
    iget-object v1, p0, Lcom/android/soundrecorder/VUMeter;->mPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 58
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/android/soundrecorder/VUMeter;->mShadow:Landroid/graphics/Paint;

    .line 59
    iget-object v1, p0, Lcom/android/soundrecorder/VUMeter;->mShadow:Landroid/graphics/Paint;

    const/16 v2, 0x3c

    invoke-static {v2, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 61
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    .line 63
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    .line 64
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .parameter "canvas"

    .prologue
    .line 73
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 75
    const v12, 0x3ec90fdb

    .line 76
    .local v12, minAngle:F
    const v11, 0x402fede0

    .line 78
    .local v11, maxAngle:F
    const v7, 0x3ec90fdb

    .line 79
    .local v7, angle:F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    if-eqz v1, :cond_0

    .line 80
    const v1, 0x4016cbe5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v2}, Lcom/android/soundrecorder/Recorder;->getMaxAmplitude()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x4700

    div-float/2addr v1, v2

    add-float/2addr v7, v1

    .line 82
    :cond_0
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    cmpl-float v1, v7, v1

    if-lez v1, :cond_2

    .line 83
    move-object/from16 v0, p0

    iput v7, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    .line 87
    :goto_0
    const v1, 0x402fede0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    .line 89
    invoke-virtual/range {p0 .. p0}, Lcom/android/soundrecorder/VUMeter;->getWidth()I

    move-result v1

    int-to-float v0, v1

    move/from16 v16, v0

    .line 90
    .local v16, w:F
    invoke-virtual/range {p0 .. p0}, Lcom/android/soundrecorder/VUMeter;->getHeight()I

    move-result v1

    int-to-float v9, v1

    .line 91
    .local v9, h:F
    const/high16 v1, 0x4000

    div-float v13, v16, v1

    .line 92
    .local v13, pivotX:F
    const/high16 v1, 0x4060

    sub-float v1, v9, v1

    const/high16 v2, 0x4120

    sub-float v14, v1, v2

    .line 93
    .local v14, pivotY:F
    const/high16 v1, 0x4080

    mul-float/2addr v1, v9

    const/high16 v2, 0x40a0

    div-float v10, v1, v2

    .line 94
    .local v10, l:F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v15, v1

    .line 95
    .local v15, sin:F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    double-to-float v8, v1

    .line 96
    .local v8, cos:F
    mul-float v1, v10, v8

    sub-float v17, v13, v1

    .line 97
    .local v17, x0:F
    mul-float v1, v10, v15

    sub-float v18, v14, v1

    .line 98
    .local v18, y0:F
    const/high16 v1, 0x4000

    add-float v2, v17, v1

    const/high16 v1, 0x4000

    add-float v3, v18, v1

    const/high16 v1, 0x4000

    add-float v4, v13, v1

    const/high16 v1, 0x4000

    add-float v5, v14, v1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/soundrecorder/VUMeter;->mShadow:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 99
    const/high16 v1, 0x4000

    add-float/2addr v1, v13

    const/high16 v2, 0x4000

    add-float/2addr v2, v14

    const/high16 v3, 0x4060

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/soundrecorder/VUMeter;->mShadow:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 100
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/soundrecorder/VUMeter;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, v18

    move v4, v13

    move v5, v14

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 101
    const/high16 v1, 0x4060

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/soundrecorder/VUMeter;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 103
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    if-eqz v1, :cond_1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->state()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 104
    const-wide/16 v1, 0x46

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lcom/android/soundrecorder/VUMeter;->postInvalidateDelayed(J)V

    .line 105
    :cond_1
    return-void

    .line 85
    .end local v8           #cos:F
    .end local v9           #h:F
    .end local v10           #l:F
    .end local v13           #pivotX:F
    .end local v14           #pivotY:F
    .end local v15           #sin:F
    .end local v16           #w:F
    .end local v17           #x0:F
    .end local v18           #y0:F
    :cond_2
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    const v2, 0x3e3851ec

    sub-float/2addr v1, v2

    invoke-static {v7, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/soundrecorder/VUMeter;->mCurrentAngle:F

    goto/16 :goto_0
.end method

.method public setRecorder(Lcom/android/soundrecorder/Recorder;)V
    .locals 0
    .parameter "recorder"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/android/soundrecorder/VUMeter;->mRecorder:Lcom/android/soundrecorder/Recorder;

    .line 68
    invoke-virtual {p0}, Lcom/android/soundrecorder/VUMeter;->invalidate()V

    .line 69
    return-void
.end method
