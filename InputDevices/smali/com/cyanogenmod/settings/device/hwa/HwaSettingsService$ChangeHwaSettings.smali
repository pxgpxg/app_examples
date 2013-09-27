.class Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;
.super Landroid/os/AsyncTask;
.source "HwaSettingsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeHwaSettings"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<[",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)V
    .locals 0
    .parameter

    .prologue
    .line 54
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;-><init>(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)V

    return-void
.end method

.method private disableHwa(Ljava/lang/String;)Z
    .locals 8
    .parameter "packageName"

    .prologue
    const/4 v7, 0x0

    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, disabled:Z
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/local/hwui.deny/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 114
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 121
    :goto_0
    if-eqz v0, :cond_1

    .line 122
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 123
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "hwa_enabled"

    const-string v5, "false"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v4}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$300(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    invoke-static {v5, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5, v3, v7, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 134
    :goto_1
    return v0

    .line 115
    .end local v3           #values:Landroid/content/ContentValues;
    :catch_0
    move-exception v1

    .line 116
    .local v1, e:Ljava/io/IOException;
    const-string v4, "HwaSettingsService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Creation of /data/local/hwui.deny/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed : IOException"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 120
    .end local v1           #e:Ljava/io/IOException;
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 128
    :cond_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 129
    .restart local v3       #values:Landroid/content/ContentValues;
    const-string v4, "hwa_enabled"

    const-string v5, "true"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v4}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$300(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    invoke-static {v5, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5, v3, v7, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1
.end method

.method private enableHwa(Ljava/lang/String;)Z
    .locals 6
    .parameter "packageName"

    .prologue
    const/4 v5, 0x0

    .line 87
    const/4 v0, 0x0

    .line 88
    .local v0, enabled:Z
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/local/hwui.deny/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 90
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    .line 93
    :goto_0
    if-eqz v0, :cond_1

    .line 94
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 95
    .local v2, values:Landroid/content/ContentValues;
    const-string v3, "hwa_enabled"

    const-string v4, "true"

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$300(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 106
    :goto_1
    return v0

    .line 92
    .end local v2           #values:Landroid/content/ContentValues;
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 100
    :cond_1
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 101
    .restart local v2       #values:Landroid/content/ContentValues;
    const-string v3, "hwa_enabled"

    const-string v4, "false"

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$300(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    check-cast p1, [[Ljava/lang/Object;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->doInBackground([[Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([[Ljava/lang/Object;)Ljava/lang/Void;
    .locals 9
    .parameter "params"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 58
    aget-object v5, p1, v7

    aget-object v4, v5, v7

    check-cast v4, Ljava/lang/String;

    .line 59
    .local v4, packageName:Ljava/lang/String;
    aget-object v5, p1, v7

    aget-object v2, v5, v8

    check-cast v2, Ljava/lang/Boolean;

    .line 60
    .local v2, hwaEnabled:Ljava/lang/Boolean;
    const-string v5, "HwaSettingsService"

    const-string v6, "Executing ChangeHwaSettings"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 62
    .local v3, msg:Landroid/os/Message;
    iput-object v4, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 63
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 64
    invoke-direct {p0, v4}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->enableHwa(Ljava/lang/String;)Z

    move-result v1

    .line 65
    .local v1, enabled:Z
    if-eqz v1, :cond_0

    .line 66
    iput v7, v3, Landroid/os/Message;->arg1:I

    .line 67
    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$100(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 82
    .end local v1           #enabled:Z
    :goto_0
    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mActivityManager:Landroid/app/ActivityManager;
    invoke-static {v5}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$200(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/app/ActivityManager;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/app/ActivityManager;->killBackgroundProcesses(Ljava/lang/String;)V

    .line 83
    const/4 v5, 0x0

    return-object v5

    .line 69
    .restart local v1       #enabled:Z
    :cond_0
    iput v8, v3, Landroid/os/Message;->arg1:I

    .line 70
    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$100(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 73
    .end local v1           #enabled:Z
    :cond_1
    invoke-direct {p0, v4}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->disableHwa(Ljava/lang/String;)Z

    move-result v0

    .line 74
    .local v0, disabled:Z
    if-eqz v0, :cond_2

    .line 75
    const/4 v5, 0x2

    iput v5, v3, Landroid/os/Message;->arg1:I

    .line 76
    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$100(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 78
    :cond_2
    const/4 v5, 0x3

    iput v5, v3, Landroid/os/Message;->arg1:I

    .line 79
    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->this$0:Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->access$100(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
