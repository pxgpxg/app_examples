.class public abstract Lcom/tmobile/themes/widget/ThemeAdapter;
.super Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;
.source "ThemeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tmobile/themes/widget/AbstractDAOItemAdapter",
        "<",
        "Lcom/tmobile/themes/provider/ThemeItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 35
    invoke-static {p1}, Lcom/tmobile/themes/widget/ThemeAdapter;->loadThemes(Landroid/app/Activity;)Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;-><init>(Landroid/app/Activity;Landroid/database/Cursor;Z)V

    .line 36
    return-void
.end method

.method private static loadThemes(Landroid/app/Activity;)Landroid/database/Cursor;
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 39
    sget-object v0, Lcom/tmobile/themes/provider/Themes$ThemeColumns;->CONTENT_PLURAL_URI:Landroid/net/Uri;

    const-string v1, "name"

    invoke-virtual {p0, v0, v2, v2, v1}, Landroid/app/Activity;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic getCurrentlyAppliedItem(Landroid/content/Context;)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/tmobile/themes/widget/ThemeAdapter;->getCurrentlyAppliedItem(Landroid/content/Context;)Lcom/tmobile/themes/provider/ThemeItem;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentlyAppliedItem(Landroid/content/Context;)Lcom/tmobile/themes/provider/ThemeItem;
    .locals 1
    .parameter "context"

    .prologue
    .line 48
    invoke-static {p1}, Lcom/tmobile/themes/provider/Themes;->getAppliedTheme(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v0

    invoke-static {v0}, Lcom/tmobile/themes/provider/ThemeItem;->getInstance(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/ThemeItem;

    move-result-object v0

    return-object v0
.end method

.method protected onAllocInternal(Landroid/database/Cursor;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 53
    new-instance v0, Lcom/tmobile/themes/provider/ThemeItem;

    invoke-direct {v0, p1}, Lcom/tmobile/themes/provider/ThemeItem;-><init>(Landroid/database/Cursor;)V

    iput-object v0, p0, Lcom/tmobile/themes/widget/ThemeAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    .line 54
    return-void
.end method
