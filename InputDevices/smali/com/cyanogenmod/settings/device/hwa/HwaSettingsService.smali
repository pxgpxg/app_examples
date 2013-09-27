.class public Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;
.super Landroid/app/IntentService;
.source "HwaSettingsService.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$1;,
        Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;
    }
.end annotation


# instance fields
.field private mActivityManager:Landroid/app/ActivityManager;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 35
    const-string v0, "HwaSettingsService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;

    .line 37
    const-string v0, "HwaSettingsService"

    const-string v1, "HwaSettingsService stared"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/app/ActivityManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mActivityManager:Landroid/app/ActivityManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 7
    .parameter "msg"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 140
    iget v0, p1, Landroid/os/Message;->arg1:I

    packed-switch v0, :pswitch_data_0

    .line 169
    :goto_0
    return v6

    .line 142
    :pswitch_0
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    const v3, 0x7f040004

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 148
    :pswitch_1
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    const v3, 0x7f040005

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 155
    :pswitch_2
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    const v3, 0x7f040002

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 162
    :pswitch_3
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    const v3, 0x7f040003

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 140
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 5
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 42
    const-string v1, "HwaSettingsService"

    const-string v2, "New intent"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContentResolver:Landroid/content/ContentResolver;

    .line 44
    iput-object p0, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    .line 45
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mContext:Landroid/content/Context;

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;->mActivityManager:Landroid/app/ActivityManager;

    .line 47
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    .line 48
    .local v0, objects:[Ljava/lang/Object;
    const-string v1, "package_name"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    .line 49
    const-string v1, "hwa_enabled"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v0, v3

    .line 51
    new-instance v1, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;-><init>(Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService;Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$1;)V

    new-array v2, v3, [[Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsService$ChangeHwaSettings;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 52
    return-void
.end method
