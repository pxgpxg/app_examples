.class public Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;
.super Landroid/content/ContentProvider;
.source "PackageListProvider.java"


# static fields
.field public static final CONTENT_FILTER_URI:Landroid/net/Uri;

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final PACKAGE_URI:Landroid/net/Uri;

.field public static final SCAN_URI:Landroid/net/Uri;

.field private static final sURIMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;

.field private mDatabaseHelper:Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 25
    const-string v0, "content://com.cyanogenmod.settings.device.hwa.PackageListProvider/dir"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->CONTENT_URI:Landroid/net/Uri;

    .line 27
    const-string v0, "content://com.cyanogenmod.settings.device.hwa.PackageListProvider/dir/filter"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 29
    const-string v0, "content://com.cyanogenmod.settings.device.hwa.PackageListProvider/dir/package"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    .line 31
    const-string v0, "content://com.cyanogenmod.settings.device.hwa.PackageListProvider/dir/scan"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->SCAN_URI:Landroid/net/Uri;

    .line 41
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    .line 49
    sget-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.cyanogenmod.settings.device.hwa.PackageListProvider"

    const-string v2, "dir"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    sget-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.cyanogenmod.settings.device.hwa.PackageListProvider"

    const-string v2, "dir/package/*"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 51
    sget-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.cyanogenmod.settings.device.hwa.PackageListProvider"

    const-string v2, "dir/scan"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    sget-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.cyanogenmod.settings.device.hwa.PackageListProvider"

    const-string v2, "dir/filter/*"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 53
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/4 v1, 0x0

    .line 57
    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 65
    :goto_0
    return v1

    .line 59
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, packageName:Ljava/lang/String;
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "packages"

    const-string v4, "package_name IS ? "

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    aput-object v0, v5, v1

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 62
    .local v1, rows:I
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 57
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "uri"

    .prologue
    .line 70
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 3
    .parameter "uri"
    .parameter "values"

    .prologue
    const/4 v2, 0x0

    .line 75
    sget-object v0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 85
    :goto_0
    return-object p1

    .line 77
    :pswitch_0
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/cyanogenmod/settings/device/hwa/DatabaseTools;->scanPackages(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/Context;)V

    .line 78
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 81
    :pswitch_1
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "packages"

    invoke-virtual {v0, v1, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 82
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 75
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContext:Landroid/content/Context;

    .line 91
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    .line 92
    new-instance v0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabaseHelper:Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;

    .line 93
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabaseHelper:Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 94
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 10
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v5, 0x0

    .line 100
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 101
    .local v0, queryBuilder:Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v1, "packages"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 102
    sget-object v1, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 110
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 112
    .local v8, cursor:Landroid/database/Cursor;
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    invoke-interface {v8, v1, p1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 113
    return-object v8

    .line 106
    .end local v8           #cursor:Landroid/database/Cursor;
    :pswitch_1
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v9

    .line 107
    .local v9, query:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "application_label LIKE \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 102
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/4 v1, 0x0

    .line 119
    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 128
    :goto_0
    return v1

    .line 121
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, packageName:Ljava/lang/String;
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "packages"

    const-string v4, "package_name IS ? "

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    aput-object v0, v5, v1

    invoke-virtual {v2, v3, p2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 124
    .local v1, rows:I
    const-string v2, "PackageListProvider"

    const-string v3, "Db update completed"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 119
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
