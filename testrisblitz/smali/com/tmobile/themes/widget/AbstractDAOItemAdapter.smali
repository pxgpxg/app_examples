.class public abstract Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;
.super Landroid/widget/CursorAdapter;
.source "AbstractDAOItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tmobile/themes/provider/AbstractDAOItem;",
        ">",
        "Landroid/widget/CursorAdapter;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field protected mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mExistingUri:Landroid/net/Uri;

.field private final mInflater:Landroid/view/LayoutInflater;

.field private mMarkedPosition:I

.field private mMarking:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/database/Cursor;Z)V
    .locals 1
    .parameter "context"
    .parameter "c"
    .parameter "autoRequery"

    .prologue
    .line 47
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 44
    const/4 v0, -0x1

    iput v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    .line 48
    iput-object p1, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mContext:Landroid/content/Context;

    .line 49
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 50
    invoke-direct {p0, p2}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->allocInternal(Landroid/database/Cursor;)V

    .line 51
    return-void
.end method

.method private allocInternal(Landroid/database/Cursor;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 64
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 65
    invoke-virtual {p0, p1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->onAllocInternal(Landroid/database/Cursor;)V

    .line 69
    :goto_0
    return-void

    .line 67
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    goto :goto_0
.end method

.method private getExistingOrCurrentUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2
    .parameter "context"
    .parameter "existingUri"

    .prologue
    .line 181
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    if-eqz p2, :cond_0

    .line 192
    .end local p2
    :goto_0
    return-object p2

    .line 184
    .restart local p2
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getCurrentlyAppliedItem(Landroid/content/Context;)Lcom/tmobile/themes/provider/AbstractDAOItem;

    move-result-object v0

    .line 185
    .local v0, current:Lcom/tmobile/themes/provider/AbstractDAOItem;,"TT;"
    if-eqz v0, :cond_1

    .line 187
    :try_start_0
    invoke-virtual {v0, p1}, Lcom/tmobile/themes/provider/AbstractDAOItem;->getUri(Landroid/content/Context;)Landroid/net/Uri;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object p2

    .line 189
    .end local p2
    invoke-virtual {v0}, Lcom/tmobile/themes/provider/AbstractDAOItem;->close()V

    goto :goto_0

    .restart local p2
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/tmobile/themes/provider/AbstractDAOItem;->close()V

    throw v1

    .line 192
    :cond_1
    const/4 p2, 0x0

    goto :goto_0
.end method

.method private markCurrentOrExistingItem(Landroid/net/Uri;Z)I
    .locals 3
    .parameter "existingUri"
    .parameter "notifyChange"

    .prologue
    .line 129
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    invoke-virtual {p0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0, v2, p1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->findExistingOrCurrentItem(Landroid/content/Context;Landroid/net/Uri;)I

    move-result v1

    .line 130
    .local v1, position:I
    iget v2, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    if-eq v2, v1, :cond_0

    .line 131
    iget v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    .line 132
    .local v0, oldPosition:I
    iput v1, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    .line 133
    invoke-virtual {p0, v0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->onMarkChanged(I)V

    .line 134
    if-eqz p2, :cond_0

    .line 135
    invoke-virtual {p0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->notifyDataSetChanged()V

    .line 138
    .end local v0           #oldPosition:I
    :cond_0
    return v1
.end method


# virtual methods
.method public findExistingOrCurrentItem(Landroid/content/Context;Landroid/net/Uri;)I
    .locals 2
    .parameter "context"
    .parameter "existingUri"

    .prologue
    .line 172
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getExistingOrCurrentUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    .line 173
    .local v0, needle:Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 174
    invoke-virtual {p0, p1, v0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->findItem(Landroid/content/Context;Landroid/net/Uri;)I

    move-result v1

    .line 176
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public findItem(Landroid/content/Context;Landroid/net/Uri;)I
    .locals 6
    .parameter "context"
    .parameter "uri"

    .prologue
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    const/4 v3, -0x1

    .line 204
    if-nez p2, :cond_1

    move v1, v3

    .line 212
    :cond_0
    :goto_0
    return v1

    .line 205
    :cond_1
    invoke-virtual {p0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getCount()I

    move-result v1

    .local v1, n:I
    move v2, v1

    .line 206
    .end local v1           #n:I
    .local v2, n:I
    :goto_1
    add-int/lit8 v1, v2, -0x1

    .end local v2           #n:I
    .restart local v1       #n:I
    if-lez v2, :cond_2

    .line 207
    invoke-virtual {p0, v1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getDAOItem(I)Lcom/tmobile/themes/provider/AbstractDAOItem;

    move-result-object v0

    .line 208
    .local v0, item:Lcom/tmobile/themes/provider/AbstractDAOItem;,"TT;"
    invoke-virtual {v0, p1}, Lcom/tmobile/themes/provider/AbstractDAOItem;->getUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    move v2, v1

    .line 211
    .end local v1           #n:I
    .restart local v2       #n:I
    goto :goto_1

    .end local v0           #item:Lcom/tmobile/themes/provider/AbstractDAOItem;,"TT;"
    .end local v2           #n:I
    .restart local v1       #n:I
    :cond_2
    move v1, v3

    .line 212
    goto :goto_0
.end method

.method protected getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 54
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    iget-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method protected abstract getCurrentlyAppliedItem(Landroid/content/Context;)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation
.end method

.method public getDAOItem(I)Lcom/tmobile/themes/provider/AbstractDAOItem;
    .locals 1
    .parameter "position"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getCount()I

    move-result v0

    if-ltz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    invoke-virtual {v0, p1}, Lcom/tmobile/themes/provider/AbstractDAOItem;->setPosition(I)V

    .line 223
    iget-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    .line 225
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMarkedPosition()I
    .locals 2

    .prologue
    .line 147
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    iget-boolean v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarking:Z

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "getMarkedPosition() called without automatic marking support."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_0
    iget v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    return v0
.end method

.method public notifyDataSetChanged()V
    .locals 2

    .prologue
    .line 73
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    invoke-virtual {p0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->allocInternal(Landroid/database/Cursor;)V

    .line 74
    invoke-super {p0}, Landroid/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 75
    iget-boolean v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarking:Z

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mExistingUri:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->markCurrentOrExistingItem(Landroid/net/Uri;Z)I

    .line 78
    :cond_0
    return-void
.end method

.method public notifyDataSetInvalidated()V
    .locals 1

    .prologue
    .line 82
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mDAOItem:Lcom/tmobile/themes/provider/AbstractDAOItem;

    .line 83
    invoke-super {p0}, Landroid/widget/CursorAdapter;->notifyDataSetInvalidated()V

    .line 84
    return-void
.end method

.method protected abstract onAllocInternal(Landroid/database/Cursor;)V
.end method

.method protected onMarkChanged(I)V
    .locals 0
    .parameter "oldMarkedPosition"

    .prologue
    .line 162
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    return-void
.end method

.method public setUseAutomaticMarking(ZLandroid/net/Uri;)V
    .locals 1
    .parameter "enabled"
    .parameter "existingUri"

    .prologue
    .line 104
    .local p0, this:Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;,"Lcom/tmobile/themes/widget/AbstractDAOItemAdapter<TT;>;"
    iput-boolean p1, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarking:Z

    .line 105
    iput-object p2, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mExistingUri:Landroid/net/Uri;

    .line 107
    if-eqz p1, :cond_0

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->markCurrentOrExistingItem(Landroid/net/Uri;Z)I

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/tmobile/themes/widget/AbstractDAOItemAdapter;->mMarkedPosition:I

    goto :goto_0
.end method
