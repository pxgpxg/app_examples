.class public Lcom/tmobile/themechooser/ChangeThemeHelper;
.super Ljava/lang/Object;
.source "ChangeThemeHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;
    }
.end annotation


# instance fields
.field private mApplyingName:Ljava/lang/String;

.field private final mContext:Landroid/app/Activity;

.field private mCurrentTheme:Landroid/content/res/CustomTheme;

.field private final mDialogId:I

.field private final mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

.field private final mThemeChangedReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 2
    .parameter "context"
    .parameter "dialogId"

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;-><init>(Lcom/tmobile/themechooser/ChangeThemeHelper;Lcom/tmobile/themechooser/ChangeThemeHelper$1;)V

    iput-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    .line 122
    new-instance v0, Lcom/tmobile/themechooser/ChangeThemeHelper$1;

    invoke-direct {v0, p0}, Lcom/tmobile/themechooser/ChangeThemeHelper$1;-><init>(Lcom/tmobile/themechooser/ChangeThemeHelper;)V

    iput-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mThemeChangedReceiver:Landroid/content/BroadcastReceiver;

    .line 60
    iput-object p1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    .line 61
    iput p2, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    .line 62
    return-void
.end method

.method static synthetic access$100(Lcom/tmobile/themechooser/ChangeThemeHelper;)Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/tmobile/themechooser/ChangeThemeHelper;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    return v0
.end method

.method static synthetic access$300(Lcom/tmobile/themechooser/ChangeThemeHelper;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    return-object v0
.end method

.method private static getThemeChooserResources(Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 2
    .parameter

    .prologue
    .line 242
    const-class v0, Lcom/tmobile/themechooser/R;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    .line 243
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 244
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 245
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 254
    :goto_0
    return-object v0

    .line 247
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 249
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 250
    :catch_0
    move-exception v0

    .line 251
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public beginChange(Ljava/lang/String;)V
    .locals 2
    .parameter "applyingName"

    .prologue
    .line 258
    iput-object p1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mApplyingName:Ljava/lang/String;

    .line 259
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    iget v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->showDialog(I)V

    .line 270
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    invoke-virtual {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->scheduleTimeout()V

    .line 271
    return-void
.end method

.method public dispatchOnConfigurationChanged(Landroid/content/res/Configuration;)Z
    .locals 4
    .parameter "newConfig"

    .prologue
    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, finishing:Z
    iget-object v1, p1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    .line 82
    .local v1, newTheme:Landroid/content/res/CustomTheme;
    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mCurrentTheme:Landroid/content/res/CustomTheme;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mCurrentTheme:Landroid/content/res/CustomTheme;

    invoke-virtual {v2, v1}, Landroid/content/res/CustomTheme;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 84
    :cond_0
    iget-object v2, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    const-string v3, "Theme config change, closing!"

    invoke-virtual {v2, v3}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->scheduleFinish(Ljava/lang/String;)V

    .line 85
    const/4 v0, 0x1

    .line 87
    :cond_1
    return v0
.end method

.method public dispatchOnCreate()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    iput-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mCurrentTheme:Landroid/content/res/CustomTheme;

    .line 66
    return-void
.end method

.method public dispatchOnCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 210
    iget v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    if-ne p1, v1, :cond_0

    .line 211
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 212
    .local v0, dialog:Landroid/app/ProgressDialog;
    iget-object v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    invoke-static {v1}, Lcom/tmobile/themechooser/ChangeThemeHelper;->getThemeChooserResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060008

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 214
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 215
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 218
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchOnPause()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    iget v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    .line 97
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    iget-object v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mThemeChangedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 98
    return-void
.end method

.method public dispatchOnPrepareDialog(ILandroid/app/Dialog;)V
    .locals 5
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 223
    iget v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I

    if-ne p1, v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mApplyingName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 225
    check-cast p2, Landroid/app/ProgressDialog;

    .end local p2
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    invoke-static {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper;->getThemeChooserResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060009

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mApplyingName:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 230
    :cond_0
    return-void
.end method

.method public dispatchOnResume()V
    .locals 4

    .prologue
    .line 112
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.tmobile.intent.action.THEME_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 114
    .local v1, filter:Landroid/content/IntentFilter;
    :try_start_0
    const-string v2, "vnd.tmobile.cursor.item/theme"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addDataType(Ljava/lang/String;)V

    .line 115
    const-string v2, "vnd.tmobile.cursor.item/style"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addDataType(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/IntentFilter$MalformedMimeTypeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    iget-object v2, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;

    iget-object v3, p0, Lcom/tmobile/themechooser/ChangeThemeHelper;->mThemeChangedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 120
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, e:Landroid/content/IntentFilter$MalformedMimeTypeException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
