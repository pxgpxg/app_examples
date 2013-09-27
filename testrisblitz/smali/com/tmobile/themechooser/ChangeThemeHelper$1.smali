.class Lcom/tmobile/themechooser/ChangeThemeHelper$1;
.super Landroid/content/BroadcastReceiver;
.source "ChangeThemeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themechooser/ChangeThemeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;


# direct methods
.method constructor <init>(Lcom/tmobile/themechooser/ChangeThemeHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 122
    iput-object p1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$1;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 127
    const-string v1, "activity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 128
    .local v0, am:Landroid/app/ActivityManager;
    const-string v1, "com.cyanogenmod.trebuchet"

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 129
    const-string v1, "com.android.launcher"

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$1;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    #getter for: Lcom/tmobile/themechooser/ChangeThemeHelper;->mHandler:Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;
    invoke-static {v1}, Lcom/tmobile/themechooser/ChangeThemeHelper;->access$100(Lcom/tmobile/themechooser/ChangeThemeHelper;)Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;

    move-result-object v1

    const-string v2, "Theme change \'complete\', closing!"

    invoke-virtual {v1, v2}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->scheduleFinish(Ljava/lang/String;)V

    .line 131
    return-void
.end method
