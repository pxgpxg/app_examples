.class public Lcom/android/certinstaller/CertInstallerMain;
.super Lcom/android/certinstaller/CertFile;
.source "CertInstallerMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/android/certinstaller/CertFile;-><init>()V

    return-void
.end method

.method private installByType(Ljava/lang/String;[B)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 127
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/certinstaller/CertInstaller;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 128
    const-string v1, "application/x-pkcs12"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    const-string v1, "PKCS12"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 136
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/android/certinstaller/CertInstallerMain;->startActivityForResult(Landroid/content/Intent;I)V

    .line 137
    return-void

    .line 130
    :cond_0
    const-string v1, "application/x-x509-ca-cert"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "application/x-x509-user-cert"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 132
    :cond_1
    const-string v1, "CERT"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    goto :goto_0

    .line 134
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/android/certinstaller/CertFile;->onCreate(Landroid/os/Bundle;)V

    .line 43
    if-eqz p1, :cond_0

    .line 56
    :goto_0
    return-void

    .line 47
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/certinstaller/CertInstallerMain$1;

    invoke-direct {v1, p0}, Lcom/android/certinstaller/CertInstallerMain$1;-><init>(Lcom/android/certinstaller/CertInstallerMain;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method protected onError(I)V
    .locals 0
    .parameter "errorId"

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->finish()V

    .line 148
    return-void
.end method

.method protected onInstallationDone(Z)V
    .locals 0
    .parameter "success"

    .prologue
    .line 141
    invoke-super {p0, p1}, Lcom/android/certinstaller/CertFile;->onInstallationDone(Z)V

    .line 142
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->finish()V

    .line 143
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 60
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 61
    if-nez v2, :cond_2

    move-object v0, v1

    .line 63
    :goto_0
    const-string v3, "android.credentials.INSTALL"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 64
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 68
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/os/Bundle;->size()I

    move-result v1

    if-ne v1, v5, :cond_6

    const-string v1, "name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->isSdCardPresent()Z

    move-result v0

    if-nez v0, :cond_3

    .line 72
    const v0, 0x7f06001c

    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 123
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->finish()V

    .line 124
    :goto_2
    return-void

    .line 61
    :cond_2
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 75
    :cond_3
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->getAllCertFiles()Ljava/util/List;

    move-result-object v0

    .line 76
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 77
    const v0, 0x7f06001b

    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 79
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v5, :cond_5

    .line 80
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertInstallerMain;->installFromFile(Ljava/io/File;)V

    goto :goto_2

    .line 83
    :cond_5
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/certinstaller/CertFileList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    invoke-virtual {v0, v2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 85
    invoke-virtual {p0, v0, v5}, Lcom/android/certinstaller/CertInstallerMain;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    .line 90
    :cond_6
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/certinstaller/CertInstaller;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 91
    invoke-virtual {v0, v2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 92
    invoke-virtual {p0, v0, v5}, Lcom/android/certinstaller/CertInstallerMain;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    .line 95
    :cond_7
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 96
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 97
    invoke-virtual {v2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v2

    .line 98
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    .line 102
    :try_start_0
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstallerMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 103
    :try_start_1
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 104
    const/16 v4, 0x400

    new-array v4, v4, [B

    .line 106
    :goto_3
    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-lez v5, :cond_8

    .line 107
    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 111
    :catch_0
    move-exception v3

    .line 114
    :goto_4
    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 116
    :goto_5
    if-nez v1, :cond_9

    .line 117
    const-string v0, "CertInstaller"

    const-string v1, "Unable to read stream for for certificate"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 109
    :cond_8
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 110
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    .line 114
    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_5

    :catchall_0
    move-exception v0

    :goto_6
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    throw v0

    .line 119
    :cond_9
    invoke-direct {p0, v2, v1}, Lcom/android/certinstaller/CertInstallerMain;->installByType(Ljava/lang/String;[B)V

    goto/16 :goto_1

    .line 114
    :catchall_1
    move-exception v1

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_6

    .line 111
    :catch_1
    move-exception v0

    move-object v0, v1

    goto :goto_4
.end method
