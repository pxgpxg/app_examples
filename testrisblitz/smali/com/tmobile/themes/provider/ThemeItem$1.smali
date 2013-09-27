.class final Lcom/tmobile/themes/provider/ThemeItem$1;
.super Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;
.source "ThemeItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themes/provider/ThemeItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tmobile/themes/provider/AbstractDAOItem$Creator",
        "<",
        "Lcom/tmobile/themes/provider/ThemeItem;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic init(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/tmobile/themes/provider/ThemeItem$1;->init(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/ThemeItem;

    move-result-object v0

    return-object v0
.end method

.method public init(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/ThemeItem;
    .locals 1
    .parameter "c"

    .prologue
    .line 69
    new-instance v0, Lcom/tmobile/themes/provider/ThemeItem;

    invoke-direct {v0, p1}, Lcom/tmobile/themes/provider/ThemeItem;-><init>(Landroid/database/Cursor;)V

    return-object v0
.end method
