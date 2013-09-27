.class Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;
.super Ljava/lang/Object;
.source "CertInstaller.java"

# interfaces
.implements Lcom/android/certinstaller/CertInstaller$MyAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/certinstaller/CertInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Pkcs12ExtractAction"
.end annotation


# instance fields
.field private transient hasRun:Z

.field private final mPassword:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "password"

    .prologue
    .line 449
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 450
    iput-object p1, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->mPassword:Ljava/lang/String;

    .line 451
    return-void
.end method


# virtual methods
.method public run(Lcom/android/certinstaller/CertInstaller;)V
    .locals 1
    .parameter "host"

    .prologue
    .line 454
    iget-boolean v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->hasRun:Z

    if-eqz v0, :cond_0

    .line 459
    :goto_0
    return-void

    .line 457
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->hasRun:Z

    .line 458
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->mPassword:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/android/certinstaller/CertInstaller;->extractPkcs12InBackground(Ljava/lang/String;)V

    goto :goto_0
.end method
