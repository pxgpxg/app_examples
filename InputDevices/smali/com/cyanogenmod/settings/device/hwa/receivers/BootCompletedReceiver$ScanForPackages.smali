.class Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;
.super Landroid/os/AsyncTask;
.source "BootCompletedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScanForPackages"
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
.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)V
    .locals 0
    .parameter

    .prologue
    .line 45
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3
    .parameter "params"

    .prologue
    const/4 v2, 0x0

    .line 49
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v0}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->SCAN_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 50
    return-object v2
.end method
