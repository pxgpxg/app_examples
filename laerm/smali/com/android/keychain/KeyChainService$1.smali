.class Lcom/android/keychain/KeyChainService$1;
.super Landroid/security/IKeyChainService$Stub;
.source "KeyChainService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/keychain/KeyChainService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final mKeyStore:Landroid/security/KeyStore;

.field private final mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

.field final synthetic this$0:Lcom/android/keychain/KeyChainService;


# direct methods
.method constructor <init>(Lcom/android/keychain/KeyChainService;)V
    .locals 1
    .parameter

    .prologue
    .line 82
    iput-object p1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    invoke-direct {p0}, Landroid/security/IKeyChainService$Stub;-><init>()V

    .line 83
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    iput-object v0, p0, Lcom/android/keychain/KeyChainService$1;->mKeyStore:Landroid/security/KeyStore;

    .line 84
    new-instance v0, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    invoke-direct {v0}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;-><init>()V

    iput-object v0, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    return-void
.end method

.method private checkArgs(Ljava/lang/String;)V
    .locals 4
    .parameter "alias"

    .prologue
    .line 111
    if-nez p1, :cond_0

    .line 112
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "alias == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :cond_0
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->isKeyStoreUnlocked()Z

    move-result v1

    if-nez v1, :cond_1

    .line 115
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "keystore is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/keychain/KeyChainService$1;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v3}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object v3

    invoke-virtual {v3}, Landroid/security/KeyStore$State;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 119
    :cond_1
    invoke-static {}, Lcom/android/keychain/KeyChainService$1;->getCallingUid()I

    move-result v0

    .line 120
    .local v0, callingUid:I
    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v2, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v2, v2, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v2}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    #calls: Lcom/android/keychain/KeyChainService;->hasGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z
    invoke-static {v1, v2, v0, p1}, Lcom/android/keychain/KeyChainService;->access$000(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 121
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " doesn\'t have permission to access the requested alias"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_2
    return-void
.end method

.method private checkCaller(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "expectedPackage"

    .prologue
    .line 209
    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    invoke-virtual {v1}, Lcom/android/keychain/KeyChainService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-static {}, Lcom/android/keychain/KeyChainService$1;->getCallingUid()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getNameForUid(I)Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, actualPackage:Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .end local v0           #actualPackage:Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0       #actualPackage:Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkCertInstallerOrSystemCaller()V
    .locals 2

    .prologue
    .line 193
    const-string v1, "com.android.certinstaller"

    invoke-direct {p0, v1}, Lcom/android/keychain/KeyChainService$1;->checkCaller(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, actual:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 198
    :goto_0
    return-void

    .line 197
    :cond_0
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkSystemCaller()V

    goto :goto_0
.end method

.method private checkSystemCaller()V
    .locals 2

    .prologue
    .line 200
    const-string v1, "android.uid.system:1000"

    invoke-direct {p0, v1}, Lcom/android/keychain/KeyChainService$1;->checkCaller(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, actual:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 202
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_0
    return-void
.end method

.method private deleteCertificateEntry(Ljava/lang/String;)Z
    .locals 5
    .parameter "alias"

    .prologue
    const/4 v1, 0x0

    .line 181
    :try_start_0
    iget-object v2, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    invoke-virtual {v2, p1}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->deleteCertificateEntry(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 182
    const/4 v1, 0x1

    .line 188
    :goto_0
    return v1

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, e:Ljava/io/IOException;
    const-string v2, "KeyChain"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Problem removing CA certificate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 186
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 187
    .local v0, e:Ljava/security/cert/CertificateException;
    const-string v2, "KeyChain"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Problem removing CA certificate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private isKeyStoreUnlocked()Z
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/android/keychain/KeyChainService$1;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v0}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object v0

    sget-object v1, Landroid/security/KeyStore$State;->UNLOCKED:Landroid/security/KeyStore$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parseCertificate([B)Ljava/security/cert/X509Certificate;
    .locals 2
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 145
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 146
    .local v0, cf:Ljava/security/cert/CertificateFactory;
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    return-object v1
.end method


# virtual methods
.method public deleteCaCertificate(Ljava/lang/String;)Z
    .locals 3
    .parameter "alias"

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkSystemCaller()V

    .line 171
    const/4 v0, 0x1

    .line 172
    .local v0, ok:Z
    iget-object v2, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    monitor-enter v2

    .line 173
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/keychain/KeyChainService$1;->deleteCertificateEntry(Ljava/lang/String;)Z

    move-result v0

    .line 174
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    #calls: Lcom/android/keychain/KeyChainService;->broadcastStorageChange()V
    invoke-static {v1}, Lcom/android/keychain/KeyChainService;->access$100(Lcom/android/keychain/KeyChainService;)V

    .line 176
    return v0

    .line 174
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getCertificate(Ljava/lang/String;)[B
    .locals 3
    .parameter "alias"

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lcom/android/keychain/KeyChainService$1;->checkArgs(Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lcom/android/keychain/KeyChainService$1;->mKeyStore:Landroid/security/KeyStore;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "USRCERT_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/security/KeyStore;->get(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public hasGrant(ILjava/lang/String;)Z
    .locals 2
    .parameter "uid"
    .parameter "alias"

    .prologue
    .line 214
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkSystemCaller()V

    .line 215
    iget-object v0, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v1, v1, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    #calls: Lcom/android/keychain/KeyChainService;->hasGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z
    invoke-static {v0, v1, p1, p2}, Lcom/android/keychain/KeyChainService;->access$000(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public installCaCertificate([B)V
    .locals 4
    .parameter "caCertificate"

    .prologue
    .line 131
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkCertInstallerOrSystemCaller()V

    .line 133
    :try_start_0
    iget-object v2, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    monitor-enter v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 134
    :try_start_1
    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    invoke-direct {p0, p1}, Lcom/android/keychain/KeyChainService$1;->parseCertificate([B)Ljava/security/cert/X509Certificate;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->installCertificate(Ljava/security/cert/X509Certificate;)V

    .line 135
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    #calls: Lcom/android/keychain/KeyChainService;->broadcastStorageChange()V
    invoke-static {v1}, Lcom/android/keychain/KeyChainService;->access$100(Lcom/android/keychain/KeyChainService;)V

    .line 142
    return-void

    .line 135
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_1

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 138
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 139
    .local v0, e:Ljava/security/cert/CertificateException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public requestPrivateKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "alias"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/android/keychain/KeyChainService$1;->checkArgs(Ljava/lang/String;)V

    .line 91
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "USRPKEY_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, keystoreAlias:Ljava/lang/String;
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 93
    .local v2, uid:I
    iget-object v3, p0, Lcom/android/keychain/KeyChainService$1;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v3, v0, v2}, Landroid/security/KeyStore;->grant(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 94
    const/4 v3, 0x0

    .line 102
    :goto_0
    return-object v3

    .line 97
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .local v1, sb:Ljava/lang/StringBuilder;
    const/16 v3, 0x3e8

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    const/16 v3, 0x5f

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public reset()Z
    .locals 5

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkSystemCaller()V

    .line 152
    iget-object v3, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v4, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v4, v4, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v4}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    #calls: Lcom/android/keychain/KeyChainService;->removeAllGrants(Landroid/database/sqlite/SQLiteDatabase;)V
    invoke-static {v3, v4}, Lcom/android/keychain/KeyChainService;->access$200(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 153
    const/4 v2, 0x1

    .line 154
    .local v2, ok:Z
    iget-object v4, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    monitor-enter v4

    .line 156
    :try_start_0
    iget-object v3, p0, Lcom/android/keychain/KeyChainService$1;->mTrustedCertificateStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    invoke-virtual {v3}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->aliases()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 157
    .local v0, alias:Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->isUser(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 158
    invoke-direct {p0, v0}, Lcom/android/keychain/KeyChainService$1;->deleteCertificateEntry(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 159
    const/4 v2, 0x0

    goto :goto_0

    .line 163
    .end local v0           #alias:Ljava/lang/String;
    :cond_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    iget-object v3, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    #calls: Lcom/android/keychain/KeyChainService;->broadcastStorageChange()V
    invoke-static {v3}, Lcom/android/keychain/KeyChainService;->access$100(Lcom/android/keychain/KeyChainService;)V

    .line 165
    return v2

    .line 163
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public setGrant(ILjava/lang/String;Z)V
    .locals 2
    .parameter "uid"
    .parameter "alias"
    .parameter "value"

    .prologue
    .line 219
    invoke-direct {p0}, Lcom/android/keychain/KeyChainService$1;->checkSystemCaller()V

    .line 220
    iget-object v0, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v1, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    iget-object v1, v1, Lcom/android/keychain/KeyChainService;->mDatabaseHelper:Lcom/android/keychain/KeyChainService$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/keychain/KeyChainService$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    #calls: Lcom/android/keychain/KeyChainService;->setGrantInternal(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;Z)V
    invoke-static {v0, v1, p1, p2, p3}, Lcom/android/keychain/KeyChainService;->access$300(Lcom/android/keychain/KeyChainService;Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;Z)V

    .line 221
    iget-object v0, p0, Lcom/android/keychain/KeyChainService$1;->this$0:Lcom/android/keychain/KeyChainService;

    #calls: Lcom/android/keychain/KeyChainService;->broadcastStorageChange()V
    invoke-static {v0}, Lcom/android/keychain/KeyChainService;->access$100(Lcom/android/keychain/KeyChainService;)V

    .line 222
    return-void
.end method
