.class Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;
.super Landroid/os/Handler;
.source "ChangeThemeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themechooser/ChangeThemeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;


# direct methods
.method private constructor <init>(Lcom/tmobile/themechooser/ChangeThemeHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 134
    iput-object p1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/tmobile/themechooser/ChangeThemeHelper;Lcom/tmobile/themechooser/ChangeThemeHelper$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;-><init>(Lcom/tmobile/themechooser/ChangeThemeHelper;)V

    return-void
.end method

.method private handleThemeChangeSwitch(Ljava/lang/String;)V
    .locals 2
    .parameter "message"

    .prologue
    .line 193
    const-string v0, "ThemeChooser"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    #getter for: Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;
    invoke-static {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper;->access$300(Lcom/tmobile/themechooser/ChangeThemeHelper;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    #getter for: Lcom/tmobile/themechooser/ChangeThemeHelper;->mDialogId:I
    invoke-static {v1}, Lcom/tmobile/themechooser/ChangeThemeHelper;->access$200(Lcom/tmobile/themechooser/ChangeThemeHelper;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    .line 205
    iget-object v0, p0, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->this$0:Lcom/tmobile/themechooser/ChangeThemeHelper;

    #getter for: Lcom/tmobile/themechooser/ChangeThemeHelper;->mContext:Landroid/app/Activity;
    invoke-static {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper;->access$300(Lcom/tmobile/themechooser/ChangeThemeHelper;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 206
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v2, 0x1

    .line 144
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 159
    :goto_0
    return-void

    .line 150
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 151
    .local v0, message:Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->removeMessages(I)V

    .line 152
    invoke-virtual {p0, v2, v0}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v1, v2, v3}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 156
    .end local v0           #message:Ljava/lang/String;
    :pswitch_1
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->handleThemeChangeSwitch(Ljava/lang/String;)V

    goto :goto_0

    .line 144
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public scheduleFinish(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    const/4 v1, 0x0

    .line 174
    invoke-virtual {p0, v1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->removeMessages(I)V

    .line 175
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->removeMessages(I)V

    .line 176
    invoke-virtual {p0, v1, p1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 177
    return-void
.end method

.method public scheduleTimeout()V
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 185
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 186
    const-string v0, "Timed out waiting for theme change event."

    invoke-virtual {p0, v1, v0}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v1, 0x2710

    invoke-virtual {p0, v0, v1, v2}, Lcom/tmobile/themechooser/ChangeThemeHelper$ChangeHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 189
    :cond_0
    return-void
.end method
