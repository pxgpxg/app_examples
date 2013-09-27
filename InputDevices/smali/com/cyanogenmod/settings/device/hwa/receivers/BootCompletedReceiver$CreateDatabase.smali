.class Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;
.super Landroid/os/AsyncTask;
.source "BootCompletedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CreateDatabase"
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
    .line 54
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .parameter "params"

    .prologue
    .line 58
    new-instance v0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->access$300(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 59
    const/4 v0, 0x0

    return-object v0
.end method
