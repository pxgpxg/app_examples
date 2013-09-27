.class public Lcom/android/providers/settings/SettingsProvider;
.super Landroid/content/ContentProvider;
.source "SettingsProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/providers/settings/SettingsProvider$SettingsCache;,
        Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;,
        Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;,
        Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    }
.end annotation


# static fields
.field private static final COLUMN_VALUE:[Ljava/lang/String;

.field private static final NULL_SETTING:Landroid/os/Bundle;

.field private static final TOO_LARGE_TO_CACHE_MARKER:Landroid/os/Bundle;

.field private static final sGlobalCache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;

.field private static final sKnownMutationsInFlight:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;"
        }
    .end annotation
.end field

.field private static sObserverInstances:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSecureCaches:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/providers/settings/SettingsProvider$SettingsCache;",
            ">;"
        }
    .end annotation
.end field

.field static final sSecureGlobalKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSystemCaches:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/providers/settings/SettingsProvider$SettingsCache;",
            ">;"
        }
    .end annotation
.end field

.field static final sSystemGlobalKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBackupManager:Landroid/app/backup/BackupManager;

.field protected final mOpenHelpers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/providers/settings/DatabaseHelper;",
            ">;"
        }
    .end annotation
.end field

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 70
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "value"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->COLUMN_VALUE:[Ljava/lang/String;

    .line 75
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    .line 77
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    .line 79
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    const-string v1, "global"

    invoke-direct {v0, v1}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sGlobalCache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    .line 85
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    .line 96
    const-string v0, "value"

    invoke-static {v0, v3}, Landroid/os/Bundle;->forPair(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->NULL_SETTING:Landroid/os/Bundle;

    .line 100
    const-string v0, "_dummy"

    invoke-static {v0, v3}, Landroid/os/Bundle;->forPair(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->TOO_LARGE_TO_CACHE_MARKER:Landroid/os/Bundle;

    .line 114
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    .line 115
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    invoke-static {v0}, Landroid/provider/Settings$Secure;->getMovedKeys(Ljava/util/HashSet;)V

    .line 119
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    .line 120
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    invoke-static {v0}, Landroid/provider/Settings$System;->getNonLegacyMovedKeys(Ljava/util/HashSet;)V

    .line 288
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 89
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    .line 1064
    return-void
.end method

.method static synthetic access$000()Landroid/util/SparseArray;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/providers/settings/SettingsProvider;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsProvider;->fullyPopulateCaches(I)V

    return-void
.end method

.method static synthetic access$300()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->NULL_SETTING:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$400()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->TOO_LARGE_TO_CACHE_MARKER:Landroid/os/Bundle;

    return-object v0
.end method

.method private checkWritePermissions(Lcom/android/providers/settings/SettingsProvider$SqlArguments;)V
    .locals 5
    .parameter "args"

    .prologue
    .line 271
    const-string v0, "secure"

    iget-object v1, p1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "global"

    iget-object v1, p1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.WRITE_SECURE_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 275
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Permission denial: writing to secure settings requires %1$s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "android.permission.WRITE_SECURE_SETTINGS"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    :cond_1
    return-void
.end method

.method private ensureAndroidIdIsSet(I)Z
    .locals 13
    .parameter "userHandle"

    .prologue
    .line 468
    sget-object v1, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "value"

    aput-object v3, v2, v0

    const-string v3, "name=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v5, "android_id"

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    move v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/providers/settings/SettingsProvider;->queryForUser(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v7

    .line 474
    .local v7, c:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 475
    .local v11, value:Ljava/lang/String;
    :goto_0
    if-nez v11, :cond_2

    .line 476
    new-instance v9, Ljava/security/SecureRandom;

    invoke-direct {v9}, Ljava/security/SecureRandom;-><init>()V

    .line 477
    .local v9, random:Ljava/security/SecureRandom;
    invoke-virtual {v9}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v8

    .line 478
    .local v8, newAndroidIdValue:Ljava/lang/String;
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 479
    .local v12, values:Landroid/content/ContentValues;
    const-string v0, "name"

    const-string v1, "android_id"

    invoke-virtual {v12, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    const-string v0, "value"

    invoke-virtual {v12, v0, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    sget-object v0, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v12, p1}, Lcom/android/providers/settings/SettingsProvider;->insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;

    move-result-object v10

    .line 482
    .local v10, uri:Landroid/net/Uri;
    if-nez v10, :cond_1

    .line 483
    const-string v0, "SettingsProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to generate new ANDROID_ID for user "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 484
    const/4 v0, 0x0

    .line 491
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .end local v8           #newAndroidIdValue:Ljava/lang/String;
    .end local v9           #random:Ljava/security/SecureRandom;
    .end local v10           #uri:Landroid/net/Uri;
    .end local v12           #values:Landroid/content/ContentValues;
    :goto_1
    return v0

    .line 474
    .end local v11           #value:Ljava/lang/String;
    :cond_0
    const/4 v11, 0x0

    goto :goto_0

    .line 486
    .restart local v8       #newAndroidIdValue:Ljava/lang/String;
    .restart local v9       #random:Ljava/security/SecureRandom;
    .restart local v10       #uri:Landroid/net/Uri;
    .restart local v11       #value:Ljava/lang/String;
    .restart local v12       #values:Landroid/content/ContentValues;
    :cond_1
    :try_start_1
    const-string v0, "SettingsProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Generated and saved new ANDROID_ID ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] for user "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 489
    .end local v8           #newAndroidIdValue:Ljava/lang/String;
    .end local v9           #random:Ljava/security/SecureRandom;
    .end local v10           #uri:Landroid/net/Uri;
    .end local v12           #values:Landroid/content/ContentValues;
    :cond_2
    const/4 v0, 0x1

    .line 491
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .end local v11           #value:Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private establishDbTracking(I)V
    .locals 6
    .parameter "userHandle"

    .prologue
    .line 370
    monitor-enter p0

    .line 371
    :try_start_0
    iget-object v3, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/providers/settings/DatabaseHelper;

    .line 372
    .local v1, dbhelper:Lcom/android/providers/settings/DatabaseHelper;
    if-nez v1, :cond_0

    .line 373
    new-instance v1, Lcom/android/providers/settings/DatabaseHelper;

    .end local v1           #dbhelper:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Lcom/android/providers/settings/DatabaseHelper;-><init>(Landroid/content/Context;I)V

    .line 374
    .restart local v1       #dbhelper:Lcom/android/providers/settings/DatabaseHelper;
    iget-object v3, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v3, p1, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 376
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    new-instance v4, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    const-string v5, "system"

    invoke-direct {v4, v5}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 377
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    new-instance v4, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    const-string v5, "secure"

    invoke-direct {v4, v5}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 378
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 380
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    invoke-virtual {v1}, Lcom/android/providers/settings/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 393
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v4, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    monitor-enter v4

    .line 394
    :try_start_1
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_1

    .line 395
    new-instance v2, Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, p1, v3}, Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;-><init>(Lcom/android/providers/settings/SettingsProvider;ILjava/lang/String;)V

    .line 396
    .local v2, observer:Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    invoke-virtual {v3, p1, v2}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 397
    invoke-virtual {v2}, Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;->startWatching()V

    .line 399
    .end local v2           #observer:Lcom/android/providers/settings/SettingsProvider$SettingsFileObserver;
    :cond_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 401
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsProvider;->ensureAndroidIdIsSet(I)Z

    .line 403
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsProvider;->startAsyncCachePopulation(I)V

    .line 404
    return-void

    .line 380
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #dbhelper:Lcom/android/providers/settings/DatabaseHelper;
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 399
    .restart local v0       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v1       #dbhelper:Lcom/android/providers/settings/DatabaseHelper;
    :catchall_1
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v3
.end method

.method private fullyPopulateCache(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;)V
    .locals 14
    .parameter "dbHelper"
    .parameter "table"
    .parameter "cache"

    .prologue
    .line 436
    invoke-virtual {p1}, Lcom/android/providers/settings/DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 437
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v4, "name"

    aput-object v4, v3, v2

    const/4 v2, 0x1

    const-string v4, "value"

    aput-object v4, v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "201"

    move-object/from16 v2, p2

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 443
    .local v10, c:Landroid/database/Cursor;
    :try_start_0
    monitor-enter p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 444
    :try_start_1
    invoke-virtual/range {p3 .. p3}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->evictAll()V

    .line 445
    const/4 v2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->setFullyMatchesDisk(Z)V

    .line 446
    const/4 v12, 0x0

    .line 447
    .local v12, rows:I
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 448
    add-int/lit8 v12, v12, 0x1

    .line 449
    const/4 v2, 0x0

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 450
    .local v11, name:Ljava/lang/String;
    const/4 v2, 0x1

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 451
    .local v13, value:Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v11, v13}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->populate(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 461
    .end local v11           #name:Ljava/lang/String;
    .end local v12           #rows:I
    .end local v13           #value:Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 463
    :catchall_1
    move-exception v2

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v2

    .line 453
    .restart local v12       #rows:I
    :cond_0
    const/16 v2, 0xc8

    if-le v12, v2, :cond_1

    .line 456
    const/4 v2, 0x0

    :try_start_3
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->setFullyMatchesDisk(Z)V

    .line 457
    const-string v2, "SettingsProvider"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "row count exceeds max cache entries for table "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    :cond_1
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 463
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 465
    return-void
.end method

.method private fullyPopulateCaches(I)V
    .locals 3
    .parameter "userHandle"

    .prologue
    .line 425
    iget-object v1, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/providers/settings/DatabaseHelper;

    .line 427
    .local v0, dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    if-nez p1, :cond_0

    .line 428
    const-string v1, "global"

    sget-object v2, Lcom/android/providers/settings/SettingsProvider;->sGlobalCache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/providers/settings/SettingsProvider;->fullyPopulateCache(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;)V

    .line 430
    :cond_0
    const-string v2, "secure"

    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    invoke-direct {p0, v0, v2, v1}, Lcom/android/providers/settings/SettingsProvider;->fullyPopulateCache(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;)V

    .line 431
    const-string v2, "system"

    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    invoke-direct {p0, v0, v2, v1}, Lcom/android/providers/settings/SettingsProvider;->fullyPopulateCache(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;)V

    .line 432
    return-void
.end method

.method private getOrConstructCache(ILandroid/util/SparseArray;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    .locals 1
    .parameter "callingUser"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/providers/settings/SettingsProvider$SettingsCache;",
            ">;)",
            "Lcom/android/providers/settings/SettingsProvider$SettingsCache;"
        }
    .end annotation

    .prologue
    .line 497
    .local p2, which:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lcom/android/providers/settings/SettingsProvider$SettingsCache;>;"
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    .line 498
    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    return-object v0
.end method

.method private getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;
    .locals 4
    .parameter "callingUser"

    .prologue
    .line 503
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 505
    .local v1, oldId:J
    :try_start_0
    iget-object v3, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/providers/settings/DatabaseHelper;

    .line 506
    .local v0, dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    if-nez v0, :cond_0

    .line 507
    invoke-direct {p0, p1}, Lcom/android/providers/settings/SettingsProvider;->establishDbTracking(I)V

    .line 508
    iget-object v3, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    check-cast v0, Lcom/android/providers/settings/DatabaseHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 512
    .restart local v0       #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    :cond_0
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-object v0

    .end local v0           #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    :catchall_0
    move-exception v3

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3
.end method

.method private getUriFor(Landroid/net/Uri;Landroid/content/ContentValues;J)Landroid/net/Uri;
    .locals 5
    .parameter "tableUri"
    .parameter "values"
    .parameter "rowId"

    .prologue
    .line 198
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 199
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid URI: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 201
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 202
    .local v1, table:Ljava/lang/String;
    const-string v2, "system"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "secure"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "global"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 205
    :cond_1
    const-string v2, "name"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, name:Ljava/lang/String;
    invoke-static {p1, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 208
    .end local v0           #name:Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_2
    invoke-static {p1, p3, p4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    goto :goto_0
.end method

.method private insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;
    .locals 14
    .parameter "url"
    .parameter "initialValues"
    .parameter "desiredUserHandle"

    .prologue
    .line 832
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v3

    .line 833
    .local v3, callingUser:I
    move/from16 v0, p3

    if-eq v3, v0, :cond_0

    .line 834
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v11

    const-string v12, "android.permission.INTERACT_ACROSS_USERS_FULL"

    const-string v13, "Not permitted to access settings for other users"

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 842
    :cond_0
    new-instance v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    invoke-direct {v1, p1}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;)V

    .line 843
    .local v1, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    const-string v11, "favorites"

    iget-object v12, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 844
    const/4 v11, 0x0

    .line 894
    :goto_0
    return-object v11

    .line 849
    :cond_1
    const-string v11, "name"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 850
    .local v7, name:Ljava/lang/String;
    const-string v11, "location_providers_allowed"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 851
    invoke-direct/range {p0 .. p2}, Lcom/android/providers/settings/SettingsProvider;->parseProviderList(Landroid/net/Uri;Landroid/content/ContentValues;)Z

    move-result v11

    if-nez v11, :cond_2

    const/4 v11, 0x0

    goto :goto_0

    .line 856
    :cond_2
    if-eqz v7, :cond_5

    .line 857
    sget-object v11, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    invoke-virtual {v11, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    sget-object v11, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    invoke-virtual {v11, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 858
    :cond_3
    const-string v11, "global"

    iget-object v12, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_4

    .line 861
    :cond_4
    const-string v11, "global"

    iput-object v11, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    .line 866
    :cond_5
    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->checkWritePermissions(Lcom/android/providers/settings/SettingsProvider$SqlArguments;)V

    .line 869
    const-string v11, "global"

    iget-object v12, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 870
    const/16 p3, 0x0

    .line 873
    :cond_6
    iget-object v11, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    move/from16 v0, p3

    invoke-virtual {p0, v0, v11}, Lcom/android/providers/settings/SettingsProvider;->cacheForTable(ILjava/lang/String;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    move-result-object v2

    .line 874
    .local v2, cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    const-string v11, "value"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 875
    .local v10, value:Ljava/lang/String;
    invoke-static {v2, v7, v10}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->isRedundantSetValue(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 876
    invoke-static {p1, v7}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    goto :goto_0

    .line 879
    :cond_7
    sget-object v11, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 880
    .local v6, mutationCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 881
    move/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v5

    .line 882
    .local v5, dbH:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {v5}, Lcom/android/providers/settings/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 883
    .local v4, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v11, v1, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v4, v11, v12, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    .line 884
    .local v8, rowId:J
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 885
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-gtz v11, :cond_8

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 887
    :cond_8
    move-object/from16 v0, p2

    invoke-static {v2, v0}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->populate(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Landroid/content/ContentValues;)V

    .line 892
    move-object/from16 v0, p2

    invoke-direct {p0, p1, v0, v8, v9}, Lcom/android/providers/settings/SettingsProvider;->getUriFor(Landroid/net/Uri;Landroid/content/ContentValues;J)Landroid/net/Uri;

    move-result-object p1

    .line 893
    move/from16 v0, p3

    invoke-direct {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider;->sendNotify(Landroid/net/Uri;I)V

    move-object v11, p1

    .line 894
    goto/16 :goto_0
.end method

.method private lookupValue(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 14
    .parameter "dbHelper"
    .parameter "table"
    .parameter "cache"
    .parameter "key"

    .prologue
    .line 615
    if-nez p3, :cond_1

    .line 616
    const-string v3, "SettingsProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cache is null for user "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : key="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    const/4 v13, 0x0

    .line 653
    :cond_0
    :goto_0
    return-object v13

    .line 619
    :cond_1
    monitor-enter p3

    .line 620
    :try_start_0
    invoke-virtual/range {p3 .. p4}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/os/Bundle;

    .line 621
    .local v13, value:Landroid/os/Bundle;
    if-eqz v13, :cond_2

    .line 622
    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->TOO_LARGE_TO_CACHE_MARKER:Landroid/os/Bundle;

    if-eq v13, v3, :cond_3

    .line 623
    monitor-exit p3

    goto :goto_0

    .line 635
    .end local v13           #value:Landroid/os/Bundle;
    :catchall_0
    move-exception v3

    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 626
    .restart local v13       #value:Landroid/os/Bundle;
    :cond_2
    :try_start_1
    invoke-virtual/range {p3 .. p3}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->fullyMatchesDisk()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 633
    sget-object v13, Lcom/android/providers/settings/SettingsProvider;->NULL_SETTING:Landroid/os/Bundle;

    .end local v13           #value:Landroid/os/Bundle;
    monitor-exit p3

    goto :goto_0

    .line 635
    .restart local v13       #value:Landroid/os/Bundle;
    :cond_3
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 637
    invoke-virtual {p1}, Lcom/android/providers/settings/DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 638
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v11, 0x0

    .line 640
    .local v11, cursor:Landroid/database/Cursor;
    :try_start_2
    sget-object v4, Lcom/android/providers/settings/SettingsProvider;->COLUMN_VALUE:[Ljava/lang/String;

    const-string v5, "name=?"

    const/4 v3, 0x1

    new-array v6, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p4, v6, v3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v3, p2

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 642
    if-eqz v11, :cond_4

    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_4

    .line 643
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 644
    const/4 v3, 0x0

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v3}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->putIfAbsent(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v13

    .line 650
    .end local v13           #value:Landroid/os/Bundle;
    if-eqz v11, :cond_0

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .restart local v13       #value:Landroid/os/Bundle;
    :cond_4
    if-eqz v11, :cond_5

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 652
    :cond_5
    const/4 v3, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v3}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->putIfAbsent(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 653
    sget-object v13, Lcom/android/providers/settings/SettingsProvider;->NULL_SETTING:Landroid/os/Bundle;

    goto :goto_0

    .line 646
    :catch_0
    move-exception v12

    .line 647
    .local v12, e:Landroid/database/sqlite/SQLiteException;
    :try_start_3
    const-string v3, "SettingsProvider"

    const-string v4, "settings lookup error"

    invoke-static {v3, v4, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 648
    const/4 v13, 0x0

    .line 650
    .end local v13           #value:Landroid/os/Bundle;
    if-eqz v11, :cond_0

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .end local v12           #e:Landroid/database/sqlite/SQLiteException;
    .restart local v13       #value:Landroid/os/Bundle;
    :catchall_1
    move-exception v3

    if-eqz v11, :cond_6

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v3
.end method

.method private parseProviderList(Landroid/net/Uri;Landroid/content/ContentValues;)Z
    .locals 13
    .parameter "url"
    .parameter "initialValues"

    .prologue
    .line 762
    const-string v0, "value"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 763
    .local v12, value:Ljava/lang/String;
    const/4 v9, 0x0

    .line 764
    .local v9, newProviders:Ljava/lang/String;
    if-eqz v12, :cond_5

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_5

    .line 765
    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Ljava/lang/String;->charAt(I)C

    move-result v10

    .line 766
    .local v10, prefix:C
    const/16 v0, 0x2b

    if-eq v10, v0, :cond_0

    const/16 v0, 0x2d

    if-ne v10, v0, :cond_5

    .line 768
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 771
    const-string v11, ""

    .line 772
    .local v11, providers:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "value"

    aput-object v1, v2, v0

    .line 773
    .local v2, columns:[Ljava/lang/String;
    const-string v3, "name=\'location_providers_allowed\'"

    .line 774
    .local v3, where:Ljava/lang/String;
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/providers/settings/SettingsProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 775
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 777
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 778
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v11

    .line 780
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 784
    :cond_1
    invoke-virtual {v11, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 785
    .local v8, index:I
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    add-int v7, v8, v0

    .line 787
    .local v7, end:I
    if-lez v8, :cond_2

    add-int/lit8 v0, v8, -0x1

    invoke-virtual {v11, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_2

    const/4 v8, -0x1

    .line 788
    :cond_2
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v7, v0, :cond_3

    invoke-virtual {v11, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_3

    const/4 v8, -0x1

    .line 790
    :cond_3
    const/16 v0, 0x2b

    if-ne v10, v0, :cond_7

    if-gez v8, :cond_7

    .line 792
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    .line 793
    move-object v9, v12

    .line 815
    :cond_4
    :goto_0
    if-eqz v9, :cond_5

    .line 816
    const-string v0, "value"

    invoke-virtual {p2, v0, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    .end local v2           #columns:[Ljava/lang/String;
    .end local v3           #where:Ljava/lang/String;
    .end local v6           #cursor:Landroid/database/Cursor;
    .end local v7           #end:I
    .end local v8           #index:I
    .end local v10           #prefix:C
    .end local v11           #providers:Ljava/lang/String;
    :cond_5
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 780
    .restart local v2       #columns:[Ljava/lang/String;
    .restart local v3       #where:Ljava/lang/String;
    .restart local v6       #cursor:Landroid/database/Cursor;
    .restart local v10       #prefix:C
    .restart local v11       #providers:Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 795
    .restart local v7       #end:I
    .restart local v8       #index:I
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 797
    :cond_7
    const/16 v0, 0x2d

    if-ne v10, v0, :cond_a

    if-ltz v8, :cond_a

    .line 800
    if-lez v8, :cond_9

    .line 801
    add-int/lit8 v8, v8, -0x1

    .line 806
    :cond_8
    :goto_2
    const/4 v0, 0x0

    invoke-virtual {v11, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 807
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v7, v0, :cond_4

    .line 808
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v11, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 802
    :cond_9
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v7, v0, :cond_8

    .line 803
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 812
    :cond_a
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private queryForUser(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;
    .locals 18
    .parameter "url"
    .parameter "select"
    .parameter "where"
    .parameter "whereArgs"
    .parameter "sort"
    .parameter "forUser"

    .prologue
    .line 664
    new-instance v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-direct {v11, v0, v1, v2}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 666
    .local v11, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    const-string v5, "global"

    iget-object v6, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x0

    :goto_0
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v14

    .line 668
    .local v14, dbH:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {v14}, Lcom/android/providers/settings/DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 675
    .local v4, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v5, "favorites"

    iget-object v6, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 676
    const/16 v17, 0x0

    .line 703
    :goto_1
    return-object v17

    .end local v4           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v14           #dbH:Lcom/android/providers/settings/DatabaseHelper;
    :cond_0
    move/from16 v5, p6

    .line 666
    goto :goto_0

    .line 677
    .restart local v4       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v14       #dbH:Lcom/android/providers/settings/DatabaseHelper;
    :cond_1
    const-string v5, "old_favorites"

    iget-object v6, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 678
    const-string v5, "favorites"

    iput-object v5, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    .line 679
    const-string v5, "PRAGMA table_info(favorites);"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 680
    .local v13, cursor:Landroid/database/Cursor;
    if-eqz v13, :cond_3

    .line 681
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-lez v5, :cond_2

    const/16 v16, 0x1

    .line 682
    .local v16, exists:Z
    :goto_2
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 683
    if-nez v16, :cond_4

    const/16 v17, 0x0

    goto :goto_1

    .line 681
    .end local v16           #exists:Z
    :cond_2
    const/16 v16, 0x0

    goto :goto_2

    .line 685
    :cond_3
    const/16 v17, 0x0

    goto :goto_1

    .line 689
    .end local v13           #cursor:Landroid/database/Cursor;
    :cond_4
    new-instance v3, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v3}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 690
    .local v3, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    iget-object v5, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 692
    iget-object v6, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v7, v11, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->args:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v5, p2

    move-object/from16 v10, p5

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 695
    .local v17, ret:Landroid/database/Cursor;
    :try_start_0
    move-object/from16 v0, v17

    check-cast v0, Landroid/database/AbstractCursor;

    move-object v12, v0

    .line 696
    .local v12, c:Landroid/database/AbstractCursor;
    invoke-virtual/range {p0 .. p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-virtual {v12, v5, v0, v1}, Landroid/database/AbstractCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;I)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 697
    .end local v12           #c:Landroid/database/AbstractCursor;
    :catch_0
    move-exception v15

    .line 700
    .local v15, e:Ljava/lang/ClassCastException;
    const-string v5, "SettingsProvider"

    const-string v6, "Incompatible cursor derivation!"

    invoke-static {v5, v6}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 701
    throw v15
.end method

.method private sendNotify(Landroid/net/Uri;I)V
    .locals 14
    .parameter "uri"
    .parameter "userHandle"

    .prologue
    .line 224
    const/4 v0, 0x0

    .line 225
    .local v0, backedUpDataChanged:Z
    const/4 v6, 0x0

    .local v6, property:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 226
    .local v7, table:Ljava/lang/String;
    const-string v10, "global"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 227
    .local v1, isGlobal:Z
    const-string v10, "system"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 228
    const-string v6, "sys.settings_system_version"

    .line 229
    const/4 v0, 0x1

    .line 238
    :cond_0
    :goto_0
    if-eqz v6, :cond_1

    .line 239
    const-wide/16 v10, 0x0

    invoke-static {v6, v10, v11}, Landroid/os/SystemProperties;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-wide/16 v12, 0x1

    add-long v8, v10, v12

    .line 241
    .local v8, version:J
    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    invoke-static {v6, v10}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .end local v8           #version:J
    :cond_1
    if-eqz v0, :cond_2

    .line 246
    iget-object v10, p0, Lcom/android/providers/settings/SettingsProvider;->mBackupManager:Landroid/app/backup/BackupManager;

    invoke-virtual {v10}, Landroid/app/backup/BackupManager;->dataChanged()V

    .line 250
    :cond_2
    const-string v10, "notify"

    invoke-virtual {p1, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 251
    .local v2, notify:Ljava/lang/String;
    if-eqz v2, :cond_3

    const-string v10, "true"

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 252
    :cond_3
    if-eqz v1, :cond_7

    const/4 v3, -0x1

    .line 253
    .local v3, notifyTarget:I
    :goto_1
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v4

    .line 255
    .local v4, oldId:J
    :try_start_0
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {v10, p1, v11, v12, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;ZI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 263
    .end local v3           #notifyTarget:I
    .end local v4           #oldId:J
    :cond_4
    return-void

    .line 230
    .end local v2           #notify:Ljava/lang/String;
    :cond_5
    const-string v10, "secure"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 231
    const-string v6, "sys.settings_secure_version"

    .line 232
    const/4 v0, 0x1

    goto :goto_0

    .line 233
    :cond_6
    if-eqz v1, :cond_0

    .line 234
    const-string v6, "sys.settings_global_version"

    .line 235
    const/4 v0, 0x1

    goto :goto_0

    .restart local v2       #notify:Ljava/lang/String;
    :cond_7
    move/from16 v3, p2

    .line 252
    goto :goto_1

    .line 257
    .restart local v3       #notifyTarget:I
    .restart local v4       #oldId:J
    :catchall_0
    move-exception v10

    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v10
.end method

.method private startAsyncCachePopulation(I)V
    .locals 1
    .parameter "userHandle"

    .prologue
    .line 421
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;

    invoke-direct {v0, p0, p1}, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;-><init>(Lcom/android/providers/settings/SettingsProvider;I)V

    invoke-virtual {v0}, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;->start()V

    .line 422
    return-void
.end method


# virtual methods
.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 12
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 720
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    .line 722
    .local v2, callingUser:I
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    invoke-direct {v0, p1}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;)V

    .line 723
    .local v0, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    const-string v8, "favorites"

    iget-object v9, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 724
    const/4 v8, 0x0

    .line 749
    :goto_0
    return v8

    .line 726
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/providers/settings/SettingsProvider;->checkWritePermissions(Lcom/android/providers/settings/SettingsProvider$SqlArguments;)V

    .line 727
    iget-object v8, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {p0, v2, v8}, Lcom/android/providers/settings/SettingsProvider;->cacheForTable(ILjava/lang/String;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    move-result-object v1

    .line 729
    .local v1, cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    sget-object v8, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    invoke-virtual {v8, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 730
    .local v6, mutationCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 731
    const-string v8, "global"

    iget-object v9, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x0

    :goto_1
    invoke-direct {p0, v8}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v4

    .line 733
    .local v4, dbH:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {v4}, Lcom/android/providers/settings/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 734
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 736
    :try_start_0
    array-length v7, p2

    .line 737
    .local v7, numValues:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_2
    if-ge v5, v7, :cond_3

    .line 738
    iget-object v8, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    const/4 v9, 0x0

    aget-object v10, p2, v5

    invoke-virtual {v3, v8, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gez v8, :cond_2

    const/4 v8, 0x0

    .line 744
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 745
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    goto :goto_0

    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v4           #dbH:Lcom/android/providers/settings/DatabaseHelper;
    .end local v5           #i:I
    .end local v7           #numValues:I
    :cond_1
    move v8, v2

    .line 731
    goto :goto_1

    .line 739
    .restart local v3       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v4       #dbH:Lcom/android/providers/settings/DatabaseHelper;
    .restart local v5       #i:I
    .restart local v7       #numValues:I
    :cond_2
    :try_start_1
    aget-object v8, p2, v5

    invoke-static {v1, v8}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->populate(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Landroid/content/ContentValues;)V

    .line 737
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 742
    :cond_3
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 744
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 745
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 748
    invoke-direct {p0, p1, v2}, Lcom/android/providers/settings/SettingsProvider;->sendNotify(Landroid/net/Uri;I)V

    .line 749
    array-length v8, p2

    goto :goto_0

    .line 744
    .end local v5           #i:I
    .end local v7           #numValues:I
    :catchall_0
    move-exception v8

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 745
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    throw v8
.end method

.method public cacheForTable(ILjava/lang/String;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    .locals 1
    .parameter "callingUser"
    .parameter "tableName"

    .prologue
    .line 517
    const-string v0, "system"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    invoke-direct {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider;->getOrConstructCache(ILandroid/util/SparseArray;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    move-result-object v0

    .line 526
    :goto_0
    return-object v0

    .line 520
    :cond_0
    const-string v0, "secure"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 521
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    invoke-direct {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider;->getOrConstructCache(ILandroid/util/SparseArray;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    move-result-object v0

    goto :goto_0

    .line 523
    :cond_1
    const-string v0, "global"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 524
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sGlobalCache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    goto :goto_0

    .line 526
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 12
    .parameter "method"
    .parameter "request"
    .parameter "args"

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 549
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v8

    .line 550
    .local v8, callingUser:I
    if-eqz p3, :cond_0

    .line 551
    const-string v0, "_user"

    invoke-virtual {p3, v0, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 552
    .local v2, reqUser:I
    if-eq v2, v8, :cond_0

    .line 553
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    const/4 v4, 0x1

    const-string v5, "get/set setting for user"

    invoke-static/range {v0 .. v6}, Landroid/app/ActivityManager;->handleIncomingUser(IIIZZLjava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 567
    .end local v2           #reqUser:I
    :cond_0
    const-string v0, "GET_system"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 569
    invoke-direct {p0, v8}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v9

    .line 570
    .local v9, dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    .line 571
    .local v7, cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    const-string v0, "system"

    invoke-direct {p0, v9, v0, v7, p2}, Lcom/android/providers/settings/SettingsProvider;->lookupValue(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    .line 608
    .end local v7           #cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    .end local v9           #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    :goto_0
    return-object v6

    .line 573
    :cond_1
    const-string v0, "GET_secure"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 575
    invoke-direct {p0, v8}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v9

    .line 576
    .restart local v9       #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    .line 577
    .restart local v7       #cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    const-string v0, "secure"

    invoke-direct {p0, v9, v0, v7, p2}, Lcom/android/providers/settings/SettingsProvider;->lookupValue(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    goto :goto_0

    .line 579
    .end local v7           #cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    .end local v9           #dbHelper:Lcom/android/providers/settings/DatabaseHelper;
    :cond_2
    const-string v0, "GET_global"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 583
    invoke-direct {p0, v3}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v0

    const-string v1, "global"

    sget-object v3, Lcom/android/providers/settings/SettingsProvider;->sGlobalCache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    invoke-direct {p0, v0, v1, v3, p2}, Lcom/android/providers/settings/SettingsProvider;->lookupValue(Lcom/android/providers/settings/DatabaseHelper;Ljava/lang/String;Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    goto :goto_0

    .line 589
    :cond_3
    if-nez p3, :cond_4

    move-object v10, v6

    .line 592
    .local v10, newValue:Ljava/lang/String;
    :goto_1
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 593
    .local v11, values:Landroid/content/ContentValues;
    const-string v0, "name"

    invoke-virtual {v11, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    const-string v0, "value"

    invoke-virtual {v11, v0, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 595
    const-string v0, "PUT_system"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 597
    sget-object v0, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v11, v8}, Lcom/android/providers/settings/SettingsProvider;->insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;

    goto :goto_0

    .line 589
    .end local v10           #newValue:Ljava/lang/String;
    .end local v11           #values:Landroid/content/ContentValues;
    :cond_4
    const-string v0, "value"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    .line 598
    .restart local v10       #newValue:Ljava/lang/String;
    .restart local v11       #values:Landroid/content/ContentValues;
    :cond_5
    const-string v0, "PUT_secure"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 600
    sget-object v0, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v11, v8}, Lcom/android/providers/settings/SettingsProvider;->insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;

    goto :goto_0

    .line 601
    :cond_6
    const-string v0, "PUT_global"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 603
    sget-object v0, Landroid/provider/Settings$Global;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v11, v8}, Lcom/android/providers/settings/SettingsProvider;->insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;

    goto :goto_0

    .line 605
    :cond_7
    const-string v0, "SettingsProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "call() with invalid method: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 9
    .parameter "url"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 899
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v1

    .line 901
    .local v1, callingUser:I
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 902
    .local v0, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    const-string v6, "favorites"

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 903
    const/4 v2, 0x0

    .line 923
    :goto_0
    return v2

    .line 904
    :cond_0
    const-string v6, "old_favorites"

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 905
    const-string v6, "favorites"

    iput-object v6, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    .line 909
    :cond_1
    :goto_1
    invoke-direct {p0, v0}, Lcom/android/providers/settings/SettingsProvider;->checkWritePermissions(Lcom/android/providers/settings/SettingsProvider$SqlArguments;)V

    .line 911
    sget-object v6, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 912
    .local v5, mutationCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 913
    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v4

    .line 914
    .local v4, dbH:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {v4}, Lcom/android/providers/settings/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 915
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v6, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v8, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->args:[Ljava/lang/String;

    invoke-virtual {v3, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 916
    .local v2, count:I
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 917
    if-lez v2, :cond_2

    .line 918
    iget-object v6, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {p0, v1, v6}, Lcom/android/providers/settings/SettingsProvider;->invalidateCache(ILjava/lang/String;)V

    .line 919
    invoke-direct {p0, p1, v1}, Lcom/android/providers/settings/SettingsProvider;->sendNotify(Landroid/net/Uri;I)V

    .line 921
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->startAsyncCachePopulation(I)V

    goto :goto_0

    .line 906
    .end local v2           #count:I
    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v4           #dbH:Lcom/android/providers/settings/DatabaseHelper;
    .end local v5           #mutationCount:Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_3
    const-string v6, "global"

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 907
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "url"

    .prologue
    const/4 v1, 0x0

    .line 710
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    invoke-direct {v0, p1, v1, v1}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 711
    .local v0, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    iget-object v1, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->where:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 712
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "vnd.android.cursor.dir/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 714
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "vnd.android.cursor.item/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .parameter "url"
    .parameter "initialValues"

    .prologue
    .line 826
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/SettingsProvider;->insertForUser(Landroid/net/Uri;Landroid/content/ContentValues;I)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public invalidateCache(ILjava/lang/String;)V
    .locals 2
    .parameter "callingUser"
    .parameter "tableName"

    .prologue
    .line 534
    invoke-virtual {p0, p1, p2}, Lcom/android/providers/settings/SettingsProvider;->cacheForTable(ILjava/lang/String;)Lcom/android/providers/settings/SettingsProvider$SettingsCache;

    move-result-object v0

    .line 535
    .local v0, cache:Lcom/android/providers/settings/SettingsProvider$SettingsCache;
    if-nez v0, :cond_0

    .line 542
    :goto_0
    return-void

    .line 538
    :cond_0
    monitor-enter v0

    .line 539
    :try_start_0
    invoke-virtual {v0}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->evictAll()V

    .line 540
    const/4 v1, 0x0

    #setter for: Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z
    invoke-static {v0, v1}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->access$202(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Z)Z

    .line 541
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCreate()Z
    .locals 3

    .prologue
    .line 324
    new-instance v1, Landroid/app/backup/BackupManager;

    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/providers/settings/SettingsProvider;->mBackupManager:Landroid/app/backup/BackupManager;

    .line 325
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    iput-object v1, p0, Lcom/android/providers/settings/SettingsProvider;->mUserManager:Landroid/os/UserManager;

    .line 327
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->establishDbTracking(I)V

    .line 329
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 330
    .local v0, userFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.USER_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 331
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/android/providers/settings/SettingsProvider$1;

    invoke-direct {v2, p0}, Lcom/android/providers/settings/SettingsProvider$1;-><init>(Lcom/android/providers/settings/SettingsProvider;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 343
    const/4 v1, 0x1

    return v1
.end method

.method onUserRemoved(I)V
    .locals 2
    .parameter "userHandle"

    .prologue
    .line 347
    monitor-enter p0

    .line 350
    :try_start_0
    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/FileObserver;

    .line 351
    .local v0, observer:Landroid/os/FileObserver;
    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {v0}, Landroid/os/FileObserver;->stopWatching()V

    .line 353
    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sObserverInstances:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 356
    :cond_0
    iget-object v1, p0, Lcom/android/providers/settings/SettingsProvider;->mOpenHelpers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 357
    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sSystemCaches:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 358
    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sSecureCaches:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 359
    sget-object v1, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 360
    monitor-exit p0

    .line 361
    return-void

    .line 360
    .end local v0           #observer:Landroid/os/FileObserver;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public openAssetFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 9
    .parameter "uri"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 1008
    invoke-static {p1}, Landroid/media/RingtoneManager;->getDefaultType(Landroid/net/Uri;)I

    move-result v5

    .line 1010
    .local v5, ringtoneType:I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_4

    .line 1011
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1014
    .local v1, context:Landroid/content/Context;
    invoke-static {v1, v5}, Landroid/media/RingtoneManager;->getActualDefaultRingtoneUri(Landroid/content/Context;I)Landroid/net/Uri;

    move-result-object v6

    .line 1016
    .local v6, soundUri:Landroid/net/Uri;
    if-eqz v6, :cond_3

    .line 1018
    invoke-virtual {v6}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 1019
    .local v0, authority:Ljava/lang/String;
    const-string v7, "drm"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1020
    .local v4, isDrmAuthority:Z
    if-nez v4, :cond_0

    const-string v7, "media"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "com.tmobile.thememanager.packageresources"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1023
    :cond_0
    if-eqz v4, :cond_1

    .line 1028
    :try_start_0
    invoke-static {v1}, Landroid/provider/DrmStore;->enforceAccessDrmPermission(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1035
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-virtual {v7, v6, p2}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 1056
    .end local v0           #authority:Ljava/lang/String;
    .end local v1           #context:Landroid/content/Context;
    .end local v4           #isDrmAuthority:Z
    .end local v6           #soundUri:Landroid/net/Uri;
    :goto_0
    return-object v7

    .line 1029
    .restart local v0       #authority:Ljava/lang/String;
    .restart local v1       #context:Landroid/content/Context;
    .restart local v4       #isDrmAuthority:Z
    .restart local v6       #soundUri:Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 1030
    .local v2, e:Ljava/lang/SecurityException;
    new-instance v7, Ljava/io/FileNotFoundException;

    invoke-virtual {v2}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1036
    .end local v2           #e:Ljava/lang/SecurityException;
    :catch_1
    move-exception v7

    .line 1042
    :cond_2
    :try_start_2
    invoke-super {p0, v6, p2}, Landroid/content/ContentProvider;->openAssetFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v7

    goto :goto_0

    .line 1043
    :catch_2
    move-exception v3

    .line 1046
    .local v3, ex:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x1100001

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    goto :goto_0

    .line 1052
    .end local v0           #authority:Ljava/lang/String;
    .end local v3           #ex:Ljava/io/FileNotFoundException;
    .end local v4           #isDrmAuthority:Z
    :cond_3
    new-instance v7, Ljava/io/FileNotFoundException;

    invoke-direct {v7}, Ljava/io/FileNotFoundException;-><init>()V

    throw v7

    .line 1056
    .end local v1           #context:Landroid/content/Context;
    .end local v6           #soundUri:Landroid/net/Uri;
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/content/ContentProvider;->openAssetFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    goto :goto_0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 8
    .parameter "uri"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 966
    invoke-static {p1}, Landroid/media/RingtoneManager;->getDefaultType(Landroid/net/Uri;)I

    move-result v4

    .line 968
    .local v4, ringtoneType:I
    const/4 v6, -0x1

    if-eq v4, v6, :cond_2

    .line 969
    invoke-virtual {p0}, Lcom/android/providers/settings/SettingsProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 972
    .local v1, context:Landroid/content/Context;
    invoke-static {v1, v4}, Landroid/media/RingtoneManager;->getActualDefaultRingtoneUri(Landroid/content/Context;I)Landroid/net/Uri;

    move-result-object v5

    .line 974
    .local v5, soundUri:Landroid/net/Uri;
    if-eqz v5, :cond_2

    .line 976
    invoke-virtual {v5}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 977
    .local v0, authority:Ljava/lang/String;
    const-string v6, "drm"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 978
    .local v3, isDrmAuthority:Z
    if-nez v3, :cond_0

    const-string v6, "media"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "com.tmobile.thememanager.packageresources"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 981
    :cond_0
    if-eqz v3, :cond_1

    .line 986
    :try_start_0
    invoke-static {v1}, Landroid/provider/DrmStore;->enforceAccessDrmPermission(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 992
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v5, p2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v6

    .line 997
    .end local v0           #authority:Ljava/lang/String;
    .end local v1           #context:Landroid/content/Context;
    .end local v3           #isDrmAuthority:Z
    .end local v5           #soundUri:Landroid/net/Uri;
    :goto_0
    return-object v6

    .line 987
    .restart local v0       #authority:Ljava/lang/String;
    .restart local v1       #context:Landroid/content/Context;
    .restart local v3       #isDrmAuthority:Z
    .restart local v5       #soundUri:Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 988
    .local v2, e:Ljava/lang/SecurityException;
    new-instance v6, Ljava/io/FileNotFoundException;

    invoke-virtual {v2}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 997
    .end local v0           #authority:Ljava/lang/String;
    .end local v1           #context:Landroid/content/Context;
    .end local v2           #e:Ljava/lang/SecurityException;
    .end local v3           #isDrmAuthority:Z
    .end local v5           #soundUri:Landroid/net/Uri;
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/content/ContentProvider;->openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v6

    goto :goto_0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7
    .parameter "url"
    .parameter "select"
    .parameter "where"
    .parameter "whereArgs"
    .parameter "sort"

    .prologue
    .line 658
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/providers/settings/SettingsProvider;->queryForUser(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 9
    .parameter "url"
    .parameter "initialValues"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 933
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v1

    .line 935
    .local v1, callingUser:I
    new-instance v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;

    invoke-direct {v0, p1, p3, p4}, Lcom/android/providers/settings/SettingsProvider$SqlArguments;-><init>(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    .line 936
    .local v0, args:Lcom/android/providers/settings/SettingsProvider$SqlArguments;
    const-string v6, "favorites"

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 937
    const/4 v2, 0x0

    .line 955
    :goto_0
    return v2

    .line 938
    :cond_0
    const-string v6, "global"

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 939
    const/4 v1, 0x0

    .line 941
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/providers/settings/SettingsProvider;->checkWritePermissions(Lcom/android/providers/settings/SettingsProvider$SqlArguments;)V

    .line 943
    sget-object v6, Lcom/android/providers/settings/SettingsProvider;->sKnownMutationsInFlight:Landroid/util/SparseArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 944
    .local v5, mutationCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 945
    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->getOrEstablishDatabase(I)Lcom/android/providers/settings/DatabaseHelper;

    move-result-object v4

    .line 946
    .local v4, dbH:Lcom/android/providers/settings/DatabaseHelper;
    invoke-virtual {v4}, Lcom/android/providers/settings/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 947
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    iget-object v6, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    iget-object v7, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->where:Ljava/lang/String;

    iget-object v8, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->args:[Ljava/lang/String;

    invoke-virtual {v3, v6, p2, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 948
    .local v2, count:I
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 949
    if-lez v2, :cond_2

    .line 950
    iget-object v6, v0, Lcom/android/providers/settings/SettingsProvider$SqlArguments;->table:Ljava/lang/String;

    invoke-virtual {p0, v1, v6}, Lcom/android/providers/settings/SettingsProvider;->invalidateCache(ILjava/lang/String;)V

    .line 951
    invoke-direct {p0, p1, v1}, Lcom/android/providers/settings/SettingsProvider;->sendNotify(Landroid/net/Uri;I)V

    .line 953
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/providers/settings/SettingsProvider;->startAsyncCachePopulation(I)V

    goto :goto_0
.end method
