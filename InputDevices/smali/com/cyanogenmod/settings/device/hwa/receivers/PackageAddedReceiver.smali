.class public Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PackageAddedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$1;,
        Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;
    }
.end annotation


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 36
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/pm/PackageManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mContentResolver:Landroid/content/ContentResolver;

    .line 31
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;

    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 33
    new-instance v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 34
    return-void
.end method
