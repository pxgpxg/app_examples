.class public Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;
.super Landroid/app/ListFragment;
.source "PackageListFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;,
        Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;,
        Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/ListFragment;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/widget/SearchView$OnQueryTextListener;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Landroid/widget/AbsListView$OnScrollListener;"
    }
.end annotation


# static fields
.field public static mPackageObserver:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;


# instance fields
.field private adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

.field private mBusy:Z

.field private mContentResolver:Landroid/content/ContentResolver;

.field protected mContext:Landroid/content/Context;

.field private mCurFilter:Ljava/lang/String;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mListView:Landroid/widget/ListView;

.field private mLoaderManager:Landroid/app/LoaderManager;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mSearchView:Landroid/widget/SearchView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/ListFragment;-><init>()V

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    .line 264
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Landroid/view/LayoutInflater;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$002(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/view/LayoutInflater;)Landroid/view/LayoutInflater;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mInflater:Landroid/view/LayoutInflater;

    return-object p1
.end method

.method static synthetic access$100(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Landroid/content/pm/PackageManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$102(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/content/pm/PackageManager;)Landroid/content/pm/PackageManager;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object p1
.end method

.method static synthetic access$200(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mBusy:Z

    return v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->restartLoading()V

    return-void
.end method

.method private restartLoading()V
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mLoaderManager:Landroid/app/LoaderManager;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 90
    return-void
.end method

.method private startLoading()V
    .locals 3

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    .line 85
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mLoaderManager:Landroid/app/LoaderManager;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 86
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x3

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 56
    invoke-super {p0, p1}, Landroid/app/ListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 57
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContext:Landroid/content/Context;

    .line 58
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    .line 59
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContentResolver:Landroid/content/ContentResolver;

    .line 60
    new-instance v0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;-><init>(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/os/Handler;)V

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageObserver:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;

    .line 61
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageObserver:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;

    invoke-virtual {v0, v1, v8, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 63
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mLoaderManager:Landroid/app/LoaderManager;

    .line 64
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/high16 v1, 0x7f05

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SearchView;

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mSearchView:Landroid/widget/SearchView;

    .line 66
    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/String;

    const-string v0, "application_label"

    aput-object v0, v5, v7

    const-string v0, "package_name"

    aput-object v0, v5, v8

    const/4 v0, 0x2

    const-string v1, "hwa_enabled"

    aput-object v1, v5, v0

    const-string v0, "_id"

    aput-object v0, v5, v3

    .line 69
    .local v5, from:[Ljava/lang/String;
    new-array v6, v3, [I

    fill-array-data v6, :array_0

    .line 71
    .local v6, to:[I
    new-instance v0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f030001

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;-><init>(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    .line 73
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 74
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->setListShown(Z)V

    .line 75
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v8}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 76
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 77
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 78
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mSearchView:Landroid/widget/SearchView;

    invoke-virtual {v0, p0}, Landroid/widget/SearchView;->setOnQueryTextListener(Landroid/widget/SearchView$OnQueryTextListener;)V

    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mSearchView:Landroid/widget/SearchView;

    invoke-virtual {v0, v7}, Landroid/widget/SearchView;->setSubmitButtonEnabled(Z)V

    .line 80
    invoke-direct {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->startLoading()V

    .line 81
    return-void

    .line 69
    nop

    :array_0
    .array-data 0x4
        0x3t 0x0t 0x5t 0x7ft
        0x4t 0x0t 0x5t 0x7ft
        0x5t 0x0t 0x5t 0x7ft
    .end array-data
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 7
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 95
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 96
    sget-object v1, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->CONTENT_FILTER_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 102
    .local v2, baseUri:Landroid/net/Uri;
    :goto_0
    new-instance v0, Landroid/content/CursorLoader;

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContext:Landroid/content/Context;

    const-string v6, "hwa_enabled, system_app, application_label"

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .local v0, cursorLoader:Landroid/content/CursorLoader;
    return-object v0

    .line 100
    .end local v0           #cursorLoader:Landroid/content/CursorLoader;
    .end local v2           #baseUri:Landroid/net/Uri;
    :cond_0
    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->CONTENT_URI:Landroid/net/Uri;

    .restart local v2       #baseUri:Landroid/net/Uri;
    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 188
    const v0, 0x7f050005

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 190
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    move v1, v0

    .line 191
    :goto_0
    const v0, 0x7f050004

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 193
    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContext:Landroid/content/Context;

    const-class v4, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 194
    const-string v3, "package_name"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    const-string v0, "hwa_enabled"

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 196
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 197
    return-void

    .line 190
    :cond_0
    const/4 v0, 0x0

    move v1, v0

    goto :goto_0
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V
    .locals 1
    .parameter
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 111
    .local p1, cursorLoader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    invoke-virtual {v0, p2}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 112
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    invoke-virtual {v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->notifyDataSetChanged()V

    .line 113
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->setListShown(Z)V

    .line 114
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, arg0:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->adapter:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 119
    return-void
.end method

.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 3
    .parameter "newText"

    .prologue
    const/4 v2, 0x1

    .line 123
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    move-object v0, p1

    .line 124
    .local v0, newFilter:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    if-nez v1, :cond_2

    if-nez v0, :cond_2

    .line 136
    :cond_0
    :goto_1
    return v2

    .line 123
    .end local v0           #newFilter:Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 127
    .restart local v0       #newFilter:Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 130
    :cond_3
    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mCurFilter:Ljava/lang/String;

    .line 131
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 132
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, p1}, Landroid/widget/ListView;->setFilterText(Ljava/lang/String;)V

    .line 135
    :goto_2
    invoke-direct {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->restartLoading()V

    goto :goto_1

    .line 134
    :cond_4
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->clearTextFilter()V

    goto :goto_2
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1
    .parameter "query"

    .prologue
    .line 141
    const/4 v0, 0x0

    return v0
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    .line 183
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 8
    .parameter "view"
    .parameter "scrollState"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 146
    packed-switch p2, :pswitch_data_0

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 148
    :pswitch_0
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mBusy:Z

    .line 150
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v0

    .line 151
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v0, :cond_0

    .line 152
    invoke-virtual {p1, v2}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 153
    .local v5, v:Landroid/view/View;
    const v6, 0x7f050002

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 155
    .local v3, icon:Landroid/widget/ImageView;
    invoke-virtual {v3}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 156
    const v6, 0x7f050004

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 160
    .local v4, packageName:Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v6, v4}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :goto_2
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 151
    .end local v4           #packageName:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 162
    .restart local v4       #packageName:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 163
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 164
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 172
    .end local v0           #count:I
    .end local v1           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v2           #i:I
    .end local v3           #icon:Landroid/widget/ImageView;
    .end local v4           #packageName:Ljava/lang/String;
    .end local v5           #v:Landroid/view/View;
    :pswitch_1
    iput-boolean v6, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mBusy:Z

    goto :goto_0

    .line 175
    :pswitch_2
    iput-boolean v6, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mBusy:Z

    goto :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
