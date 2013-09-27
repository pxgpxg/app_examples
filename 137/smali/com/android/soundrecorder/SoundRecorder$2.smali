.class Lcom/android/soundrecorder/SoundRecorder$2;
.super Landroid/content/BroadcastReceiver;
.source "SoundRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/soundrecorder/SoundRecorder;->registerExternalStorageListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/soundrecorder/SoundRecorder;


# direct methods
.method constructor <init>(Lcom/android/soundrecorder/SoundRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 498
    iput-object p1, p0, Lcom/android/soundrecorder/SoundRecorder$2;->this$0:Lcom/android/soundrecorder/SoundRecorder;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 501
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 502
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 503
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder$2;->this$0:Lcom/android/soundrecorder/SoundRecorder;

    iget-object v1, v1, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->delete()V

    .line 508
    :cond_0
    :goto_0
    return-void

    .line 504
    :cond_1
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 505
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder$2;->this$0:Lcom/android/soundrecorder/SoundRecorder;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 506
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder$2;->this$0:Lcom/android/soundrecorder/SoundRecorder;

    #calls: Lcom/android/soundrecorder/SoundRecorder;->updateUi()V
    invoke-static {v1}, Lcom/android/soundrecorder/SoundRecorder;->access$100(Lcom/android/soundrecorder/SoundRecorder;)V

    goto :goto_0
.end method
