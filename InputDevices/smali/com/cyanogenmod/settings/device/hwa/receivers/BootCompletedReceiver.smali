.class public Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootCompletedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$1;,
        Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;,
        Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;
    }
.end annotation


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 54
    return-void
.end method

.method static synthetic access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 13
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 13
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    .line 22
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContext:Landroid/content/Context;

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mContentResolver:Landroid/content/ContentResolver;

    .line 24
    const-string v2, "preferences"

    invoke-virtual {p1, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mPreferences:Landroid/content/SharedPreferences;

    .line 26
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mPreferences:Landroid/content/SharedPreferences;

    const-string v3, "firstTime"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 27
    .local v1, firstTime:Z
    if-eqz v1, :cond_0

    .line 28
    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 29
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "firstTime"

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 30
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 32
    :try_start_0
    new-instance v2, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$1;)V

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$CreateDatabase;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 43
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 38
    :cond_0
    :try_start_1
    new-instance v2, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$1;)V

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/BootCompletedReceiver$ScanForPackages;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 39
    :catch_0
    move-exception v2

    goto :goto_0

    .line 33
    .restart local v0       #editor:Landroid/content/SharedPreferences$Editor;
    :catch_1
    move-exception v2

    goto :goto_0
.end method
