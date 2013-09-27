.class public Lcom/tmobile/themechooser/ReflectionLayout;
.super Landroid/widget/FrameLayout;
.source "ReflectionLayout.java"


# instance fields
.field private final mDarkPaint:Landroid/graphics/Paint;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mReflectionPaint:Landroid/graphics/Paint;

.field private final mShader:Landroid/graphics/Shader;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/tmobile/themechooser/ReflectionLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/tmobile/themechooser/ReflectionLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mDarkPaint:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mReflectionPaint:Landroid/graphics/Paint;

    .line 52
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mMatrix:Landroid/graphics/Matrix;

    .line 66
    invoke-virtual {p0, v5}, Lcom/tmobile/themechooser/ReflectionLayout;->setWillNotDraw(Z)V

    .line 68
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mDarkPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x6800

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    new-instance v0, Landroid/graphics/LinearGradient;

    const/high16 v4, 0x3f80

    const/high16 v6, -0x100

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    move v3, v1

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mShader:Landroid/graphics/Shader;

    .line 71
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mReflectionPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mShader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 72
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mReflectionPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 73
    return-void
.end method

.method private drawReflection(Landroid/graphics/Canvas;)V
    .locals 14
    .parameter "canvas"

    .prologue
    const/high16 v13, 0x3f80

    const/4 v12, 0x0

    .line 109
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/tmobile/themechooser/ReflectionLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 110
    .local v7, child:Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v9

    .line 111
    .local v9, childw:I
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v8

    .line 112
    .local v8, childh:I
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ReflectionLayout;->getHeight()I

    move-result v11

    .line 113
    .local v11, selfh:I
    sub-int v10, v11, v8

    .line 120
    .local v10, poolh:I
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v1, v0

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v2, v0

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v3, v0

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v0

    invoke-virtual {p0}, Lcom/tmobile/themechooser/ReflectionLayout;->getBottom()I

    move-result v4

    add-int/2addr v0, v4

    int-to-float v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x4

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 125
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 126
    const/high16 v0, -0x4080

    invoke-virtual {p1, v13, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 127
    mul-int/lit8 v0, v8, 0x2

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p1, v12, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 128
    invoke-virtual {v7, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 129
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 132
    int-to-float v2, v8

    int-to-float v3, v9

    int-to-float v4, v11

    iget-object v5, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mDarkPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v12

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 135
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v1, v10

    invoke-virtual {v0, v13, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 136
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v1, v8

    invoke-virtual {v0, v12, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 137
    iget-object v0, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mShader:Landroid/graphics/Shader;

    iget-object v1, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 138
    int-to-float v2, v8

    int-to-float v3, v9

    int-to-float v4, v11

    iget-object v5, p0, Lcom/tmobile/themechooser/ReflectionLayout;->mReflectionPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v12

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 141
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 142
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "canvas"

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ReflectionLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 99
    invoke-direct {p0, p1}, Lcom/tmobile/themechooser/ReflectionLayout;->drawReflection(Landroid/graphics/Canvas;)V

    .line 106
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6
    .parameter "wspec"
    .parameter "hspec"

    .prologue
    .line 77
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 79
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ReflectionLayout;->getChildCount()I

    move-result v3

    if-lez v3, :cond_0

    .line 80
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/tmobile/themechooser/ReflectionLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 81
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 82
    .local v2, childw:I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 85
    .local v1, childh:I
    invoke-static {v2, p1}, Lcom/tmobile/themechooser/ReflectionLayout;->resolveSize(II)I

    move-result v3

    int-to-float v4, v1

    const v5, 0x3f99999a

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v4, p2}, Lcom/tmobile/themechooser/ReflectionLayout;->resolveSize(II)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/tmobile/themechooser/ReflectionLayout;->setMeasuredDimension(II)V

    .line 88
    .end local v0           #child:Landroid/view/View;
    .end local v1           #childh:I
    .end local v2           #childw:I
    :cond_0
    return-void
.end method
