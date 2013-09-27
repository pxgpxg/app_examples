.class Lcom/android/keychain/KeyChainActivity$3;
.super Ljava/lang/Object;
.source "KeyChainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/keychain/KeyChainActivity;->displayCertChooserDialog(Lcom/android/keychain/KeyChainActivity$CertificateAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/keychain/KeyChainActivity;

.field final synthetic val$adapter:Lcom/android/keychain/KeyChainActivity$CertificateAdapter;

.field final synthetic val$lv:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/android/keychain/KeyChainActivity;Landroid/widget/ListView;Lcom/android/keychain/KeyChainActivity$CertificateAdapter;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 204
    iput-object p1, p0, Lcom/android/keychain/KeyChainActivity$3;->this$0:Lcom/android/keychain/KeyChainActivity;

    iput-object p2, p0, Lcom/android/keychain/KeyChainActivity$3;->val$lv:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/android/keychain/KeyChainActivity$3;->val$adapter:Lcom/android/keychain/KeyChainActivity$CertificateAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 206
    iget-object v3, p0, Lcom/android/keychain/KeyChainActivity$3;->val$lv:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result v2

    .line 207
    .local v2, listViewPosition:I
    add-int/lit8 v0, v2, -0x1

    .line 208
    .local v0, adapterPosition:I
    if-ltz v0, :cond_0

    iget-object v3, p0, Lcom/android/keychain/KeyChainActivity$3;->val$adapter:Lcom/android/keychain/KeyChainActivity$CertificateAdapter;

    invoke-virtual {v3, v0}, Lcom/android/keychain/KeyChainActivity$CertificateAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, alias:Ljava/lang/String;
    :goto_0
    iget-object v3, p0, Lcom/android/keychain/KeyChainActivity$3;->this$0:Lcom/android/keychain/KeyChainActivity;

    #calls: Lcom/android/keychain/KeyChainActivity;->finish(Ljava/lang/String;)V
    invoke-static {v3, v1}, Lcom/android/keychain/KeyChainActivity;->access$500(Lcom/android/keychain/KeyChainActivity;Ljava/lang/String;)V

    .line 212
    return-void

    .line 208
    .end local v1           #alias:Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
