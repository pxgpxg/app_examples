.class Lcom/android/certinstaller/CertInstaller$3;
.super Ljava/lang/Object;
.source "CertInstaller.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/certinstaller/CertInstaller;->createPkcs12PasswordDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/certinstaller/CertInstaller;


# direct methods
.method constructor <init>(Lcom/android/certinstaller/CertInstaller;)V
    .locals 0
    .parameter

    .prologue
    .line 339
    iput-object p1, p0, Lcom/android/certinstaller/CertInstaller$3;->this$0:Lcom/android/certinstaller/CertInstaller;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 341
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller$3;->this$0:Lcom/android/certinstaller/CertInstaller;

    #getter for: Lcom/android/certinstaller/CertInstaller;->mView:Lcom/android/certinstaller/ViewHelper;
    invoke-static {v1}, Lcom/android/certinstaller/CertInstaller;->access$700(Lcom/android/certinstaller/CertInstaller;)Lcom/android/certinstaller/ViewHelper;

    move-result-object v1

    const v2, 0x7f080003

    invoke-virtual {v1, v2}, Lcom/android/certinstaller/ViewHelper;->getText(I)Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, password:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller$3;->this$0:Lcom/android/certinstaller/CertInstaller;

    new-instance v2, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;

    invoke-direct {v2, v0}, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;-><init>(Ljava/lang/String;)V

    #setter for: Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;
    invoke-static {v1, v2}, Lcom/android/certinstaller/CertInstaller;->access$502(Lcom/android/certinstaller/CertInstaller;Lcom/android/certinstaller/CertInstaller$MyAction;)Lcom/android/certinstaller/CertInstaller$MyAction;

    .line 343
    iget-object v1, p0, Lcom/android/certinstaller/CertInstaller$3;->this$0:Lcom/android/certinstaller/CertInstaller;

    #getter for: Lcom/android/certinstaller/CertInstaller;->mNextAction:Lcom/android/certinstaller/CertInstaller$MyAction;
    invoke-static {v1}, Lcom/android/certinstaller/CertInstaller;->access$500(Lcom/android/certinstaller/CertInstaller;)Lcom/android/certinstaller/CertInstaller$MyAction;

    move-result-object v1

    iget-object v2, p0, Lcom/android/certinstaller/CertInstaller$3;->this$0:Lcom/android/certinstaller/CertInstaller;

    invoke-interface {v1, v2}, Lcom/android/certinstaller/CertInstaller$MyAction;->run(Lcom/android/certinstaller/CertInstaller;)V

    .line 344
    return-void
.end method
