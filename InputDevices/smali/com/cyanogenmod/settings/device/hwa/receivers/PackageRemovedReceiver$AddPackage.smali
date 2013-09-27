.class Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;
.super Landroid/os/AsyncTask;
.source "PackageRemovedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddPackage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;)V
    .locals 0
    .parameter

    .prologue
    .line 25
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .parameter "params"

    .prologue
    const/4 v3, 0x0

    .line 29
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v0}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;->access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;)Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v2}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageRemovedReceiver;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 31
    return-object v3
.end method
