.class public abstract Lcom/tmobile/themes/provider/AbstractDAOItem;
.super Ljava/lang/Object;
.source "AbstractDAOItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;
    }
.end annotation


# instance fields
.field protected mCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    if-nez p1, :cond_0

    .line 38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cursor cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lcom/tmobile/themes/provider/AbstractDAOItem;->mCursor:Landroid/database/Cursor;

    .line 41
    return-void
.end method

.method protected static parseUriNullSafe(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1
    .parameter "uriString"

    .prologue
    .line 84
    if-eqz p0, :cond_0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/tmobile/themes/provider/AbstractDAOItem;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 55
    return-void
.end method

.method public abstract getUri(Landroid/content/Context;)Landroid/net/Uri;
.end method

.method public setPosition(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/tmobile/themes/provider/AbstractDAOItem;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 63
    return-void
.end method
