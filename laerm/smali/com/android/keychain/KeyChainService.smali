.class public Lcom/android/keychain/KeyChainService;
.super Landroid/app/IntentService;
.source "KeyChainService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/keychain/KeyChainService$DatabaseHelper;
    }
.end annotation


# instance fields
.field public mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

.field private final mIKeyChainService:Landroid/security/IKeyChainService$Stub;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    const-class v0, Lcom/android/keychain/KeyChainService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 82
    new-instance v0, Lcom/android/keychain/KeyChainService$1;

    invoke-direct {v0, p0}, Lcom/android/keychain/KeyChainService$1;-><init>(Lcom/android/keychain/KeyChainService;)V

    iput-object v0, p0, Lcom/android/keychain/KeyChainService;->mIKeyChainService:Landroid/security/IKeyChainService$Stub;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/android/keychain/KeyChainService;->hasGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/android/keychain/KeyChainService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService;->broadcastStorageChange()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/android/keychain/KeyChainService;->removeAllGrants(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/keychain/KeyChainService;->setGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;Z)V

    return-void
.end method

.method private broadcastStorageChange()V
    .locals 2

    .prologue
    .line 317
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.security.STORAGE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 318
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/android/keychain/KeyChainService;->sendBroadcast(Landroid/content/Intent;)V

    .line 319
    return-void
.end method

.method private hasGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z
    .locals 7
    .parameter "db"
    .parameter "uid"
    .parameter "alias"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 226
    const-string v4, "SELECT COUNT(*) FROM grants WHERE uid=? AND alias=?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object p3, v5, v2

    invoke-static {p1, v4, v5}, Landroid/database/DatabaseUtils;->longForQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    .line 228
    .local v0, numMatches:J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_0

    :goto_0
    return v2

    :cond_0
    move v2, v3

    goto :goto_0
.end method

.method private purgeOldGrants()V
    .locals 14

    .prologue
    const/4 v12, 0x1

    const/4 v13, 0x0

    .line 289
    invoke-virtual {p0}, Lcom/android/keychain/KeyChainService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    .line 290
    .local v10, packageManager:Landroid/content/pm/PackageManager;
    iget-object v1, p0, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 291
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 292
    .local v8, cursor:Landroid/database/Cursor;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 294
    :try_start_0
    const-string v1, "grants"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "uid"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "uid"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 296
    :cond_0
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 297
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 298
    .local v11, uid:I
    invoke-virtual {v10, v11}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    move v9, v12

    .line 299
    .local v9, packageExists:Z
    :goto_1
    if-nez v9, :cond_0

    .line 302
    const-string v1, "KeyChain"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deleting grants for UID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " because its package is no longer installed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    const-string v1, "grants"

    const-string v2, "uid=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 309
    .end local v9           #packageExists:Z
    .end local v11           #uid:I
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_1

    .line 310
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 312
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1

    .restart local v11       #uid:I
    :cond_2
    move v9, v13

    .line 298
    goto :goto_1

    .line 307
    .end local v11           #uid:I
    :cond_3
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 309
    if-eqz v8, :cond_4

    .line 310
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 312
    :cond_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 314
    return-void
.end method

.method private removeAllGrants(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter "db"

    .prologue
    const/4 v1, 0x0

    .line 247
    const-string v0, "grants"

    invoke-virtual {p1, v0, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 248
    return-void
.end method

.method private setGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;Z)V
    .locals 6
    .parameter "db"
    .parameter "uid"
    .parameter "alias"
    .parameter "value"

    .prologue
    .line 233
    if-eqz p4, :cond_1

    .line 234
    invoke-direct {p0, p1, p2, p3}, Lcom/android/keychain/KeyChainService;->hasGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 235
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 236
    .local v0, values:Landroid/content/ContentValues;
    const-string v1, "alias"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    const-string v1, "uid"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 238
    const-string v1, "grants"

    const-string v2, "alias"

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 244
    .end local v0           #values:Landroid/content/ContentValues;
    :cond_0
    :goto_0
    return-void

    .line 241
    :cond_1
    const-string v1, "grants"

    const-string v2, "uid=? AND alias=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p3, v3, v4

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter

    .prologue
    .line 275
    const-class v0, Landroid/security/IKeyChainService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/android/keychain/KeyChainService;->mIKeyChainService:Landroid/security/IKeyChainService$Stub;

    .line 278
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 71
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 72
    new-instance v0, Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-direct {v0, p0, p0}, Lcom/android/keychain/KeyChainService$DatabaseHelper;-><init>(Lcom/android/keychain/KeyChainService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    .line 73
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 77
    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    .line 78
    iget-object v0, p0, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v0}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->close()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    .line 80
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 283
    const-string v0, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 284
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService;->purgeOldGrants()V

    .line 286
    :cond_0
    return-void
.end method
