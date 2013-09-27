.class Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;
.super Ljava/lang/Object;
.source "ThemeChooser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themechooser/ThemeChooser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field public preview:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "row"

    .prologue
    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    const v0, 0x7f070001

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;->preview:Landroid/widget/ImageView;

    .line 296
    return-void
.end method
