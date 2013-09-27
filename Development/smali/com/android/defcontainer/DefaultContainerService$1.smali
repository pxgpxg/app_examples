.class Lcom/android/defcontainer/DefaultContainerService$1;
.super Lcom/android/internal/app/IMediaContainerService$Stub;
.source "DefaultContainerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/defcontainer/DefaultContainerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/defcontainer/DefaultContainerService;


# direct methods
.method constructor <init>(Lcom/android/defcontainer/DefaultContainerService;)V
    .locals 0
    .parameter

    .prologue
    .line 88
    iput-object p1, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    invoke-direct {p0}, Lcom/android/internal/app/IMediaContainerService$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public calculateDirectorySize(Ljava/lang/String;)J
    .locals 3
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 230
    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 232
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 233
    .local v0, directory:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 234
    invoke-static {p1}, Lcom/android/defcontainer/MeasurementUtils;->measureDirectory(Ljava/lang/String;)J

    move-result-wide v1

    .line 236
    :goto_0
    return-wide v1

    :cond_0
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public calculateInstalledSize(Ljava/lang/String;Z)J
    .locals 6
    .parameter "packagePath"
    .parameter "isForwardLocked"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 312
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 314
    .local v1, packageFile:Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    #calls: Lcom/android/defcontainer/DefaultContainerService;->calculateContainerSize(Ljava/io/File;Z)I
    invoke-static {v2, v1, p2}, Lcom/android/defcontainer/DefaultContainerService;->access$500(Lcom/android/defcontainer/DefaultContainerService;Ljava/io/File;Z)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    mul-int/lit16 v2, v2, 0x400

    mul-int/lit16 v2, v2, 0x400

    int-to-long v2, v2

    .line 320
    :goto_0
    return-wide v2

    .line 315
    :catch_0
    move-exception v0

    .line 320
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x2

    mul-long/2addr v2, v4

    goto :goto_0
.end method

.method public checkExternalFreeStorage(Landroid/net/Uri;Z)Z
    .locals 3
    .parameter "packageUri"
    .parameter "isForwardLocked"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 211
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 213
    .local v0, apkFile:Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    #calls: Lcom/android/defcontainer/DefaultContainerService;->isUnderExternalThreshold(Ljava/io/File;Z)Z
    invoke-static {v2, v0, p2}, Lcom/android/defcontainer/DefaultContainerService;->access$400(Lcom/android/defcontainer/DefaultContainerService;Ljava/io/File;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 215
    :goto_0
    return v2

    .line 214
    :catch_0
    move-exception v1

    .line 215
    .local v1, e:Ljava/io/IOException;
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public checkInternalFreeStorage(Landroid/net/Uri;ZJ)Z
    .locals 3
    .parameter "packageUri"
    .parameter "isForwardLocked"
    .parameter "threshold"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 200
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 202
    .local v0, apkFile:Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    #calls: Lcom/android/defcontainer/DefaultContainerService;->isUnderInternalThreshold(Ljava/io/File;ZJ)Z
    invoke-static {v2, v0, p2, p3, p4}, Lcom/android/defcontainer/DefaultContainerService;->access$300(Lcom/android/defcontainer/DefaultContainerService;Ljava/io/File;ZJ)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 204
    :goto_0
    return v2

    .line 203
    :catch_0
    move-exception v1

    .line 204
    .local v1, e:Ljava/io/IOException;
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public clearDirectory(Ljava/lang/String;)V
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 290
    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 292
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 293
    .local v0, directory:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 294
    iget-object v1, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    invoke-virtual {v1, v0}, Lcom/android/defcontainer/DefaultContainerService;->eraseFiles(Ljava/io/File;)V

    .line 296
    :cond_0
    return-void
.end method

.method public copyResource(Landroid/net/Uri;Landroid/content/pm/ContainerEncryptionParams;Landroid/os/ParcelFileDescriptor;)I
    .locals 6
    .parameter "packageURI"
    .parameter "encryptionParams"
    .parameter "outStream"

    .prologue
    const/4 v2, -0x3

    .line 126
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 147
    :cond_0
    :goto_0
    return v2

    .line 130
    :cond_1
    new-instance v0, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    invoke-direct {v0, p3}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 134
    .local v0, autoOut:Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    :try_start_0
    iget-object v3, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    #calls: Lcom/android/defcontainer/DefaultContainerService;->copyFile(Landroid/net/Uri;Ljava/io/OutputStream;Landroid/content/pm/ContainerEncryptionParams;)V
    invoke-static {v3, p1, v0, p2}, Lcom/android/defcontainer/DefaultContainerService;->access$100(Lcom/android/defcontainer/DefaultContainerService;Landroid/net/Uri;Ljava/io/OutputStream;Landroid/content/pm/ContainerEncryptionParams;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/DigestException; {:try_start_0 .. :try_end_0} :catch_2

    .line 135
    const/4 v2, 0x1

    goto :goto_0

    .line 136
    :catch_0
    move-exception v1

    .line 137
    .local v1, e:Ljava/io/FileNotFoundException;
    const-string v3, "DefContainer"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not copy URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " FNF: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 140
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 141
    .local v1, e:Ljava/io/IOException;
    const-string v2, "DefContainer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not copy URI "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " IO: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    const/4 v2, -0x4

    goto :goto_0

    .line 144
    .end local v1           #e:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 145
    .local v1, e:Ljava/security/DigestException;
    const-string v2, "DefContainer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not copy URI "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Security: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/security/DigestException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    const/4 v2, -0x2

    goto/16 :goto_0
.end method

.method public copyResourceToContainer(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 8
    .parameter "packageURI"
    .parameter "cid"
    .parameter "key"
    .parameter "resFileName"
    .parameter "publicResFileName"
    .parameter "isExternal"
    .parameter "isForwardLocked"

    .prologue
    .line 105
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 106
    :cond_0
    const/4 v0, 0x0

    .line 109
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    move v7, p7

    #calls: Lcom/android/defcontainer/DefaultContainerService;->copyResourceInner(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;
    invoke-static/range {v0 .. v7}, Lcom/android/defcontainer/DefaultContainerService;->access$000(Lcom/android/defcontainer/DefaultContainerService;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public deleteFile(Ljava/lang/String;)V
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 301
    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 303
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 304
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 305
    iget-object v1, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    invoke-virtual {v1, v0}, Lcom/android/defcontainer/DefaultContainerService;->eraseFiles(Ljava/io/File;)V

    .line 307
    :cond_0
    return-void
.end method

.method public getFileSystemStats(Ljava/lang/String;)[J
    .locals 10
    .parameter "path"

    .prologue
    .line 276
    const/16 v6, 0xa

    invoke-static {v6}, Landroid/os/Process;->setThreadPriority(I)V

    .line 279
    :try_start_0
    sget-object v6, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    invoke-interface {v6, p1}, Llibcore/io/Os;->statfs(Ljava/lang/String;)Llibcore/io/StructStatFs;

    move-result-object v3

    .line 280
    .local v3, stat:Llibcore/io/StructStatFs;
    iget-wide v6, v3, Llibcore/io/StructStatFs;->f_blocks:J

    iget-wide v8, v3, Llibcore/io/StructStatFs;->f_bsize:J

    mul-long v4, v6, v8

    .line 281
    .local v4, totalSize:J
    iget-wide v6, v3, Llibcore/io/StructStatFs;->f_bavail:J

    iget-wide v8, v3, Llibcore/io/StructStatFs;->f_bsize:J

    mul-long v0, v6, v8

    .line 282
    .local v0, availSize:J
    const/4 v6, 0x2

    new-array v6, v6, [J

    const/4 v7, 0x0

    aput-wide v4, v6, v7

    const/4 v7, 0x1

    aput-wide v0, v6, v7
    :try_end_0
    .catch Llibcore/io/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v6

    .line 283
    .end local v0           #availSize:J
    .end local v3           #stat:Llibcore/io/StructStatFs;
    .end local v4           #totalSize:J
    :catch_0
    move-exception v2

    .line 284
    .local v2, e:Llibcore/io/ErrnoException;
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public getMinimalPackageInfo(Ljava/lang/String;IJ)Landroid/content/pm/PackageInfoLite;
    .locals 10
    .parameter "packagePath"
    .parameter "flags"
    .parameter "threshold"

    .prologue
    const/4 v3, -0x2

    .line 161
    new-instance v9, Landroid/content/pm/PackageInfoLite;

    invoke-direct {v9}, Landroid/content/pm/PackageInfoLite;-><init>()V

    .line 163
    .local v9, ret:Landroid/content/pm/PackageInfoLite;
    if-nez p1, :cond_0

    .line 164
    const-string v0, "DefContainer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid package file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iput v3, v9, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    .line 194
    :goto_0
    return-object v9

    .line 169
    :cond_0
    new-instance v7, Landroid/util/DisplayMetrics;

    invoke-direct {v7}, Landroid/util/DisplayMetrics;-><init>()V

    .line 170
    .local v7, metrics:Landroid/util/DisplayMetrics;
    invoke-virtual {v7}, Landroid/util/DisplayMetrics;->setToDefaults()V

    .line 172
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/content/pm/PackageParser;->parsePackageLite(Ljava/lang/String;I)Landroid/content/pm/PackageParser$PackageLite;

    move-result-object v8

    .line 173
    .local v8, pkg:Landroid/content/pm/PackageParser$PackageLite;
    if-nez v8, :cond_2

    .line 174
    const-string v0, "DefContainer"

    const-string v1, "Failed to parse package"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 177
    .local v6, apkFile:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 178
    const/4 v0, -0x6

    iput v0, v9, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_0

    .line 180
    :cond_1
    iput v3, v9, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_0

    .line 186
    .end local v6           #apkFile:Ljava/io/File;
    :cond_2
    iget-object v0, v8, Landroid/content/pm/PackageParser$PackageLite;->packageName:Ljava/lang/String;

    iput-object v0, v9, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    .line 187
    iget v0, v8, Landroid/content/pm/PackageParser$PackageLite;->versionCode:I

    iput v0, v9, Landroid/content/pm/PackageInfoLite;->versionCode:I

    .line 188
    iget v0, v8, Landroid/content/pm/PackageParser$PackageLite;->installLocation:I

    iput v0, v9, Landroid/content/pm/PackageInfoLite;->installLocation:I

    .line 189
    iget-object v0, v8, Landroid/content/pm/PackageParser$PackageLite;->verifiers:[Landroid/content/pm/VerifierInfo;

    iput-object v0, v9, Landroid/content/pm/PackageInfoLite;->verifiers:[Landroid/content/pm/VerifierInfo;

    .line 191
    iget-object v0, p0, Lcom/android/defcontainer/DefaultContainerService$1;->this$0:Lcom/android/defcontainer/DefaultContainerService;

    iget v1, v8, Landroid/content/pm/PackageParser$PackageLite;->installLocation:I

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    #calls: Lcom/android/defcontainer/DefaultContainerService;->recommendAppInstallLocation(ILjava/lang/String;IJ)I
    invoke-static/range {v0 .. v5}, Lcom/android/defcontainer/DefaultContainerService;->access$200(Lcom/android/defcontainer/DefaultContainerService;ILjava/lang/String;IJ)I

    move-result v0

    iput v0, v9, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_0
.end method

.method public getObbInfo(Ljava/lang/String;)Landroid/content/res/ObbInfo;
    .locals 4
    .parameter "filename"

    .prologue
    .line 221
    :try_start_0
    invoke-static {p1}, Landroid/content/res/ObbScanner;->getObbInfo(Ljava/lang/String;)Landroid/content/res/ObbInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 224
    :goto_0
    return-object v1

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, e:Ljava/io/IOException;
    const-string v1, "DefContainer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t get OBB info for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public listDirectory(Ljava/lang/String;)[B
    .locals 12
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 246
    const/16 v7, 0xa

    invoke-static {v7}, Landroid/os/Process;->setThreadPriority(I)V

    .line 248
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 249
    .local v1, directory:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 250
    .local v3, files:[Ljava/io/File;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v6

    .line 252
    .local v6, out:Landroid/os/Parcel;
    if-nez v3, :cond_1

    .line 253
    invoke-virtual {v6, v9}, Landroid/os/Parcel;->writeInt(I)V

    .line 271
    :cond_0
    invoke-virtual {v6}, Landroid/os/Parcel;->marshall()[B

    move-result-object v7

    return-object v7

    .line 256
    :cond_1
    array-length v7, v3

    invoke-virtual {v6, v7}, Landroid/os/Parcel;->writeInt(I)V

    .line 257
    move-object v0, v3

    .local v0, arr$:[Ljava/io/File;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v2, v0, v4

    .line 258
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 260
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_2

    move v7, v8

    :goto_1
    invoke-virtual {v6, v7}, Landroid/os/Parcel;->writeInt(I)V

    .line 261
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 262
    invoke-virtual {v6, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 263
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {v6, v10, v11}, Landroid/os/Parcel;->writeLong(J)V

    .line 257
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    move v7, v9

    .line 260
    goto :goto_1

    .line 266
    :cond_3
    invoke-virtual {v6, v9}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_2
.end method
