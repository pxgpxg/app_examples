.class public Lcom/android/certinstaller/CertInstaller;
.super Landroid/app/Activity;
.source "CertInstaller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/certinstaller/CertInstaller$OnExtractionDoneAction;,
        Lcom/android/certinstaller/CertInstaller$InstallOthersAction;,
        Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;,
        Lcom/android/certinstaller/CertInstaller$MyAction;,
        Lcom/android/certinstaller/CertInstaller$MyMap;,
        Lcom/android/certinstaller/CertInstaller$InstallCaCertsToKeyChainTask;
    }
.end annotation


# instance fields
.field private mCredentials:Lcom/android/certinstaller/CredentialHelper;

.field private final mKeyStore:Landroid/security/KeyStore;

.field private mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

.field private mState:I

.field private final mView:Lcom/android/certinstaller/ViewHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 67
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    iput-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mKeyStore:Landroid/security/KeyStore;

    .line 68
    new-instance v0, Lcom/android/certinstaller/ViewHelper;

    invoke-direct {v0}, Lcom/android/certinstaller/ViewHelper;-><init>()V

    iput-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    .line 469
    return-void
.end method

.method static synthetic access$200(Lcom/android/certinstaller/CertInstaller;)Lcom/android/certinstaller/CredentialHelper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/certinstaller/CertInstaller;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    iget v0, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    return v0
.end method

.method static synthetic access$500(Lcom/android/certinstaller/CertInstaller;)Lcom/android/certinstaller/CertInstaller$MyAction;
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/certinstaller/CertInstaller;Lcom/android/certinstaller/CertInstaller$MyAction;)Lcom/android/certinstaller/CertInstaller$MyAction;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    iput-object p1, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/certinstaller/CertInstaller;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/certinstaller/CertInstaller;)Lcom/android/certinstaller/ViewHelper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    return-object v0
.end method

.method private createCredentialHelper(Landroid/content/Intent;)Lcom/android/certinstaller/CredentialHelper;
    .locals 3
    .parameter "intent"

    .prologue
    .line 76
    :try_start_0
    new-instance v1, Lcom/android/certinstaller/CredentialHelper;

    invoke-direct {v1, p1}, Lcom/android/certinstaller/CredentialHelper;-><init>(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    return-object v1

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, t:Ljava/lang/Throwable;
    const-string v1, "CertInstaller"

    const-string v2, "createCredentialHelper"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    const v1, 0x7f060016

    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    .line 80
    new-instance v1, Lcom/android/certinstaller/CredentialHelper;

    invoke-direct {v1}, Lcom/android/certinstaller/CredentialHelper;-><init>()V

    goto :goto_0
.end method

.method private createNameCredentialDialog()Landroid/app/Dialog;
    .locals 6

    .prologue
    .line 361
    const/high16 v3, 0x7f02

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 362
    .local v2, view:Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    invoke-virtual {v3, v2}, Lcom/android/certinstaller/ViewHelper;->setView(Landroid/view/View;)V

    .line 363
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    invoke-virtual {v3}, Lcom/android/certinstaller/ViewHelper;->getHasEmptyError()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 364
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const v4, 0x7f060010

    invoke-virtual {v3, v4}, Lcom/android/certinstaller/ViewHelper;->showError(I)V

    .line 365
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/android/certinstaller/ViewHelper;->setHasEmptyError(Z)V

    .line 367
    :cond_0
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const v4, 0x7f080002

    iget-object v5, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v5, p0}, Lcom/android/certinstaller/CredentialHelper;->getDescription(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/certinstaller/ViewHelper;->setText(ILjava/lang/String;)V

    .line 368
    const v3, 0x7f080001

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 369
    .local v1, nameInput:Landroid/widget/EditText;
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->getDefaultName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 370
    invoke-virtual {v1}, Landroid/widget/EditText;->selectAll()V

    .line 371
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f060005

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x104000a

    new-instance v5, Lcom/android/certinstaller/CertInstaller$6;

    invoke-direct {v5, p0}, Lcom/android/certinstaller/CertInstaller$6;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/high16 v4, 0x104

    new-instance v5, Lcom/android/certinstaller/CertInstaller$5;

    invoke-direct {v5, p0}, Lcom/android/certinstaller/CertInstaller$5;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 403
    .local v0, d:Landroid/app/Dialog;
    new-instance v3, Lcom/android/certinstaller/CertInstaller$7;

    invoke-direct {v3, p0}, Lcom/android/certinstaller/CertInstaller$7;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 408
    return-object v0
.end method

.method private createPkcs12PasswordDialog()Landroid/app/Dialog;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 325
    const v3, 0x7f020001

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 326
    .local v2, view:Landroid/view/View;
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    invoke-virtual {v3, v2}, Lcom/android/certinstaller/ViewHelper;->setView(Landroid/view/View;)V

    .line 327
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    invoke-virtual {v3}, Lcom/android/certinstaller/ViewHelper;->getHasEmptyError()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 328
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const v4, 0x7f06000f

    invoke-virtual {v3, v4}, Lcom/android/certinstaller/ViewHelper;->showError(I)V

    .line 329
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    invoke-virtual {v3, v5}, Lcom/android/certinstaller/ViewHelper;->setHasEmptyError(Z)V

    .line 332
    :cond_0
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v3}, Lcom/android/certinstaller/CredentialHelper;->getName()Ljava/lang/String;

    move-result-object v1

    .line 333
    .local v1, title:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const v3, 0x7f060002

    invoke-virtual {p0, v3}, Lcom/android/certinstaller/CertInstaller;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 336
    :goto_0
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x104000a

    new-instance v5, Lcom/android/certinstaller/CertInstaller$3;

    invoke-direct {v5, p0}, Lcom/android/certinstaller/CertInstaller$3;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/high16 v4, 0x104

    new-instance v5, Lcom/android/certinstaller/CertInstaller$2;

    invoke-direct {v5, p0}, Lcom/android/certinstaller/CertInstaller$2;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 352
    .local v0, d:Landroid/app/Dialog;
    new-instance v3, Lcom/android/certinstaller/CertInstaller$4;

    invoke-direct {v3, p0}, Lcom/android/certinstaller/CertInstaller$4;-><init>(Lcom/android/certinstaller/CertInstaller;)V

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 357
    return-object v0

    .line 333
    .end local v0           #d:Landroid/app/Dialog;
    :cond_1
    const v3, 0x7f060004

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    invoke-virtual {p0, v3, v4}, Lcom/android/certinstaller/CertInstaller;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getDefaultName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 412
    iget-object v2, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v2}, Lcom/android/certinstaller/CredentialHelper;->getName()Ljava/lang/String;

    move-result-object v1

    .line 413
    .local v1, name:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 414
    const/4 v2, 0x0

    .line 419
    :goto_0
    return-object v2

    .line 417
    :cond_0
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 418
    .local v0, index:I
    if-lez v0, :cond_1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_1
    move-object v2, v1

    .line 419
    goto :goto_0
.end method

.method private getPkeyMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .prologue
    .line 282
    iget-object v2, p0, Lcom/android/certinstaller/CertInstaller;->mKeyStore:Landroid/security/KeyStore;

    const-string v3, "PKEY_MAP"

    invoke-virtual {v2, v3}, Landroid/security/KeyStore;->get(Ljava/lang/String;)[B

    move-result-object v0

    .line 283
    .local v0, bytes:[B
    if-eqz v0, :cond_0

    .line 284
    invoke-static {v0}, Lcom/android/certinstaller/Util;->fromBytes([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 286
    .local v1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    if-eqz v1, :cond_0

    .line 288
    .end local v1           #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/android/certinstaller/CertInstaller$MyMap;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/certinstaller/CertInstaller$MyMap;-><init>(Lcom/android/certinstaller/CertInstaller$1;)V

    goto :goto_0
.end method

.method private nameCredential()V
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v0}, Lcom/android/certinstaller/CredentialHelper;->hasAnyForSystemInstall()Z

    move-result v0

    if-nez v0, :cond_0

    .line 253
    const v0, 0x7f060015

    invoke-direct {p0, v0}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    .line 257
    :goto_0
    return-void

    .line 255
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertInstaller;->showDialog(I)V

    goto :goto_0
.end method

.method private needsKeyStoreAccess()Z
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v0}, Lcom/android/certinstaller/CredentialHelper;->hasKeyPair()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v0}, Lcom/android/certinstaller/CredentialHelper;->hasUserCertificate()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v0}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object v0

    sget-object v1, Landroid/security/KeyStore$State;->UNLOCKED:Landroid/security/KeyStore$State;

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private saveKeyPair()V
    .locals 6

    .prologue
    .line 260
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    const-string v4, "PKEY"

    invoke-virtual {v3, v4}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v2

    .line 261
    .local v2, privatekey:[B
    iget-object v3, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    const-string v4, "KEY"

    invoke-virtual {v3, v4}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v3

    invoke-static {v3}, Lcom/android/certinstaller/Util;->toMd5([B)Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, key:Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->getPkeyMap()Ljava/util/Map;

    move-result-object v1

    .line 263
    .local v1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertInstaller;->savePkeyMap(Ljava/util/Map;)V

    .line 265
    const-string v3, "CertInstaller"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "save privatekey: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " --> #keys:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    return-void
.end method

.method private savePkeyMap(Ljava/util/Map;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    .prologue
    .line 269
    .local p1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 270
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mKeyStore:Landroid/security/KeyStore;

    const-string v2, "PKEY_MAP"

    invoke-virtual {v1, v2}, Landroid/security/KeyStore;->delete(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    const-string v1, "CertInstaller"

    const-string v2, "savePkeyMap(): failed to delete pkey map"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    invoke-static {p1}, Lcom/android/certinstaller/Util;->toBytes(Ljava/lang/Object;)[B

    move-result-object v0

    .line 276
    .local v0, bytes:[B
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mKeyStore:Landroid/security/KeyStore;

    const-string v2, "PKEY_MAP"

    invoke-virtual {v1, v2, v0}, Landroid/security/KeyStore;->put(Ljava/lang/String;[B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 277
    const-string v1, "CertInstaller"

    const-string v2, "savePkeyMap(): failed to write pkey map"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private sendUnlockKeyStoreIntent()V
    .locals 1

    .prologue
    .line 248
    invoke-static {}, Landroid/security/Credentials;->getInstance()Landroid/security/Credentials;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/security/Credentials;->unlock(Landroid/content/Context;)V

    .line 249
    return-void
.end method

.method private toastErrorAndFinish(I)V
    .locals 1
    .parameter "msgId"

    .prologue
    .line 424
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 425
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->finish()V

    .line 426
    return-void
.end method


# virtual methods
.method extractPkcs12InBackground(Ljava/lang/String;)V
    .locals 2
    .parameter "password"

    .prologue
    .line 293
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertInstaller;->showDialog(I)V

    .line 295
    new-instance v0, Lcom/android/certinstaller/CertInstaller$1;

    invoke-direct {v0, p0, p1}, Lcom/android/certinstaller/CertInstaller$1;-><init>(Lcom/android/certinstaller/CertInstaller;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/certinstaller/CertInstaller$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 309
    return-void
.end method

.method installOthers()V
    .locals 7

    .prologue
    .line 223
    iget-object v4, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v4}, Lcom/android/certinstaller/CredentialHelper;->hasKeyPair()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 224
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->saveKeyPair()V

    .line 225
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->finish()V

    .line 245
    :goto_0
    return-void

    .line 227
    :cond_0
    iget-object v4, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v4}, Lcom/android/certinstaller/CredentialHelper;->getUserCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 228
    .local v0, cert:Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_1

    .line 230
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-interface {v4}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v4

    invoke-static {v4}, Lcom/android/certinstaller/Util;->toMd5([B)Ljava/lang/String;

    move-result-object v1

    .line 231
    .local v1, key:Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->getPkeyMap()Ljava/util/Map;

    move-result-object v2

    .line 232
    .local v2, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 233
    .local v3, privatekey:[B
    if-eqz v3, :cond_2

    .line 234
    const-string v4, "CertInstaller"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "found matched key: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    invoke-direct {p0, v2}, Lcom/android/certinstaller/CertInstaller;->savePkeyMap(Ljava/util/Map;)V

    .line 238
    iget-object v4, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v4, v3}, Lcom/android/certinstaller/CredentialHelper;->setPrivateKey([B)V

    .line 243
    .end local v1           #key:Ljava/lang/String;
    .end local v2           #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    .end local v3           #privatekey:[B
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->nameCredential()V

    goto :goto_0

    .line 240
    .restart local v1       #key:Ljava/lang/String;
    .restart local v2       #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[B>;"
    .restart local v3       #privatekey:[B
    :cond_2
    const-string v4, "CertInstaller"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "didn\'t find matched private key: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 176
    if-ne p1, v3, :cond_2

    .line 177
    if-ne p2, v4, :cond_1

    .line 178
    const-string v0, "CertInstaller"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "credential is added: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v2}, Lcom/android/certinstaller/CredentialHelper;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    const v0, 0x7f060017

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v2}, Lcom/android/certinstaller/CredentialHelper;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {p0, v0, v1}, Lcom/android/certinstaller/CertInstaller;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 182
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v0}, Lcom/android/certinstaller/CredentialHelper;->hasCaCerts()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    new-instance v0, Lcom/android/certinstaller/CertInstaller$InstallCaCertsToKeyChainTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/certinstaller/CertInstaller$InstallCaCertsToKeyChainTask;-><init>(Lcom/android/certinstaller/CertInstaller;Lcom/android/certinstaller/CertInstaller$1;)V

    new-array v1, v5, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/certinstaller/CertInstaller$InstallCaCertsToKeyChainTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 196
    :goto_0
    return-void

    .line 187
    :cond_0
    invoke-virtual {p0, v4}, Lcom/android/certinstaller/CertInstaller;->setResult(I)V

    .line 195
    :goto_1
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->finish()V

    goto :goto_0

    .line 189
    :cond_1
    const-string v0, "CertInstaller"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "credential not saved, err: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const v0, 0x7f060014

    invoke-direct {p0, v0}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    goto :goto_1

    .line 193
    :cond_2
    const-string v0, "CertInstaller"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown request code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedStates"

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 86
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 88
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    const v1, 0x7f06001d

    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    .line 90
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->finish()V

    .line 118
    :goto_0
    return-void

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertInstaller;->createCredentialHelper(Landroid/content/Intent;)Lcom/android/certinstaller/CredentialHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    .line 96
    if-nez p1, :cond_1

    move v1, v2

    :goto_1
    iput v1, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    .line 98
    iget v1, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    if-ne v1, v2, :cond_5

    .line 99
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v1}, Lcom/android/certinstaller/CredentialHelper;->containsAnyRawData()Z

    move-result v1

    if-nez v1, :cond_2

    .line 100
    const v1, 0x7f060015

    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertInstaller;->toastErrorAndFinish(I)V

    .line 101
    invoke-virtual {p0}, Lcom/android/certinstaller/CertInstaller;->finish()V

    goto :goto_0

    :cond_1
    move v1, v3

    .line 96
    goto :goto_1

    .line 102
    :cond_2
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v1}, Lcom/android/certinstaller/CredentialHelper;->hasPkcs12KeyStore()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 103
    invoke-virtual {p0, v3}, Lcom/android/certinstaller/CertInstaller;->showDialog(I)V

    goto :goto_0

    .line 105
    :cond_3
    new-instance v0, Lcom/android/certinstaller/CertInstaller$InstallOthersAction;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/certinstaller/CertInstaller$InstallOthersAction;-><init>(Lcom/android/certinstaller/CertInstaller$1;)V

    .line 106
    .local v0, action:Lcom/android/certinstaller/CertInstaller$MyAction;
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->needsKeyStoreAccess()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 107
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->sendUnlockKeyStoreIntent()V

    .line 108
    iput-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    goto :goto_0

    .line 110
    :cond_4
    invoke-interface {v0, p0}, Lcom/android/certinstaller/CertInstaller$MyAction;->run(Lcom/android/certinstaller/CertInstaller;)V

    goto :goto_0

    .line 114
    .end local v0           #action:Lcom/android/certinstaller/CertInstaller$MyAction;
    :cond_5
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v1, p1}, Lcom/android/certinstaller/CredentialHelper;->onRestoreStates(Landroid/os/Bundle;)V

    .line 115
    const-string v1, "na"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/android/certinstaller/CertInstaller$MyAction;

    iput-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 2
    .parameter "dialogId"

    .prologue
    .line 155
    packed-switch p1, :pswitch_data_0

    .line 170
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 157
    :pswitch_0
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->createPkcs12PasswordDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 160
    :pswitch_1
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->createNameCredentialDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 163
    :pswitch_2
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 164
    .local v0, dialog:Landroid/app/ProgressDialog;
    const v1, 0x7f060003

    invoke-virtual {p0, v1}, Lcom/android/certinstaller/CertInstaller;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 165
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 166
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    goto :goto_0

    .line 155
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method onExtractionDone(Z)V
    .locals 4
    .parameter "success"

    .prologue
    const/4 v3, 0x2

    .line 312
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    .line 313
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertInstaller;->removeDialog(I)V

    .line 314
    if-eqz p1, :cond_0

    .line 315
    invoke-virtual {p0, v3}, Lcom/android/certinstaller/CertInstaller;->removeDialog(I)V

    .line 316
    invoke-direct {p0}, Lcom/android/certinstaller/CertInstaller;->nameCredential()V

    .line 322
    :goto_0
    return-void

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const v1, 0x7f080003

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/certinstaller/ViewHelper;->setText(ILjava/lang/String;)V

    .line 319
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;

    const v1, 0x7f06000e

    invoke-virtual {v0, v1}, Lcom/android/certinstaller/ViewHelper;->showError(I)V

    .line 320
    invoke-virtual {p0, v3}, Lcom/android/certinstaller/CertInstaller;->showDialog(I)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 140
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 141
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    .line 142
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 122
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 124
    iget v0, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 125
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/certinstaller/CertInstaller;->mState:I

    .line 131
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    invoke-interface {v0, p0}, Lcom/android/certinstaller/CertInstaller$MyAction;->run(Lcom/android/certinstaller/CertInstaller;)V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outStates"

    .prologue
    .line 146
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 147
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mCredentials:Lcom/android/certinstaller/CredentialHelper;

    invoke-virtual {v0, p1}, Lcom/android/certinstaller/CredentialHelper;->onSaveStates(Landroid/os/Bundle;)V

    .line 148
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    if-eqz v0, :cond_0

    .line 149
    const-string v0, "na"

    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 151
    :cond_0
    return-void
.end method
