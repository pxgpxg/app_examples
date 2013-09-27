.class public abstract Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;
.super Ljava/lang/Object;
.source "AbstractDAOItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themes/provider/AbstractDAOItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "Creator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tmobile/themes/provider/AbstractDAOItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 93
    .local p0, this:Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;,"Lcom/tmobile/themes/provider/AbstractDAOItem$Creator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract init(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation
.end method

.method public newInstance(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .locals 2
    .parameter "c"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, this:Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;,"Lcom/tmobile/themes/provider/AbstractDAOItem$Creator<TT;>;"
    if-eqz p1, :cond_1

    .line 123
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 124
    invoke-virtual {p0, p1}, Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;->init(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/AbstractDAOItem;

    move-result-object v0

    .line 129
    :goto_0
    return-object v0

    .line 126
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 129
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
