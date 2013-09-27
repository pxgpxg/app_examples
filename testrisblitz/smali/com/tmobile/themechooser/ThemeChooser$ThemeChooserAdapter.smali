.class Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;
.super Lcom/tmobile/themes/widget/ThemeAdapter;
.source "ThemeChooser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themechooser/ThemeChooser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ThemeChooserAdapter"
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 267
    invoke-direct {p0, p1}, Lcom/tmobile/themes/widget/ThemeAdapter;-><init>(Landroid/app/Activity;)V

    .line 268
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 5
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 279
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    check-cast v2, Lcom/tmobile/themes/provider/ThemeItem;

    .line 280
    .local v2, themeItem:Lcom/tmobile/themes/provider/ThemeItem;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;

    .line 281
    .local v0, holder:Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v1, v3, Landroid/content/res/Configuration;->orientation:I

    .line 282
    .local v1, orientation:I
    iget-object v3, v0, Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;->preview:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Lcom/tmobile/themes/provider/ThemeItem;->getPreviewUri(I)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 283
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 287
    invoke-virtual {p0, p1}, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;->getDAOItem(I)Lcom/tmobile/themes/provider/AbstractDAOItem;

    move-result-object v0

    return-object v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 272
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030001

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 273
    .local v0, row:Landroid/view/View;
    new-instance v1, Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;

    invoke-direct {v1, v0}, Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 274
    return-object v0
.end method
