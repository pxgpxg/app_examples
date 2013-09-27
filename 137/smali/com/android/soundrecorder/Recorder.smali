.class public Lcom/android/soundrecorder/Recorder;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/soundrecorder/Recorder$OnStateChangedListener;
    }
.end annotation


# instance fields
.field mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

.field mPlayer:Landroid/media/MediaPlayer;

.field mRecorder:Landroid/media/MediaRecorder;

.field mSampleFile:Ljava/io/File;

.field mSampleLength:I

.field mSampleStart:J

.field mState:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput v3, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    .line 52
    iput-object v2, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    .line 54
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleStart:J

    .line 55
    iput v3, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    .line 56
    iput-object v2, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    .line 58
    iput-object v2, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 59
    iput-object v2, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    .line 62
    return-void
.end method

.method private setError(I)V
    .locals 1
    .parameter "error"

    .prologue
    .line 274
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    invoke-interface {v0, p1}, Lcom/android/soundrecorder/Recorder$OnStateChangedListener;->onError(I)V

    .line 276
    :cond_0
    return-void
.end method

.method private setState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 261
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    if-ne p1, v0, :cond_0

    .line 266
    :goto_0
    return-void

    .line 264
    :cond_0
    iput p1, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    .line 265
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    invoke-direct {p0, v0}, Lcom/android/soundrecorder/Recorder;->signalStateChanged(I)V

    goto :goto_0
.end method

.method private signalStateChanged(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 269
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    invoke-interface {v0, p1}, Lcom/android/soundrecorder/Recorder$OnStateChangedListener;->onStateChanged(I)V

    .line 271
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 139
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 141
    iput v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    .line 143
    invoke-direct {p0, v0}, Lcom/android/soundrecorder/Recorder;->signalStateChanged(I)V

    .line 144
    return-void
.end method

.method public delete()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 123
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 125
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 128
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    .line 129
    iput v1, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    .line 131
    invoke-direct {p0, v1}, Lcom/android/soundrecorder/Recorder;->signalStateChanged(I)V

    .line 132
    return-void
.end method

.method public getMaxAmplitude()I
    .locals 2

    .prologue
    .line 70
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 72
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->getMaxAmplitude()I

    move-result v0

    goto :goto_0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0
    .parameter "mp"

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 258
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    const/4 v0, 0x1

    .line 251
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 252
    invoke-direct {p0, v0}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    .line 253
    return v0
.end method

.method public progress()I
    .locals 4

    .prologue
    .line 106
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 107
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/soundrecorder/Recorder;->mSampleStart:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    .line 108
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public restoreState(Landroid/os/Bundle;)V
    .locals 5
    .parameter "recorderState"

    .prologue
    const/4 v4, -0x1

    .line 76
    const-string v3, "sample_path"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, samplePath:Ljava/lang/String;
    if-nez v2, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    const-string v3, "sample_length"

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 80
    .local v1, sampleLength:I
    if-eq v1, v4, :cond_0

    .line 83
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    iget-object v3, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_0

    .line 90
    :cond_2
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->delete()V

    .line 91
    iput-object v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    .line 92
    iput v1, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    .line 94
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/android/soundrecorder/Recorder;->signalStateChanged(I)V

    goto :goto_0
.end method

.method public sampleFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    return-object v0
.end method

.method public sampleLength()I
    .locals 1

    .prologue
    .line 112
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    return v0
.end method

.method public saveState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "recorderState"

    .prologue
    .line 65
    const-string v0, "sample_path"

    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string v0, "sample_length"

    iget v1, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 67
    return-void
.end method

.method public setOnStateChangedListener(Lcom/android/soundrecorder/Recorder$OnStateChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 98
    iput-object p1, p0, Lcom/android/soundrecorder/Recorder;->mOnStateChangedListener:Lcom/android/soundrecorder/Recorder$OnStateChangedListener;

    .line 99
    return-void
.end method

.method public startPlayback()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x2

    .line 212
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 214
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    .line 216
    :try_start_0
    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 217
    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 218
    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 219
    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 220
    iget-object v1, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 231
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/soundrecorder/Recorder;->mSampleStart:J

    .line 232
    invoke-direct {p0, v3}, Lcom/android/soundrecorder/Recorder;->setState(I)V

    .line 233
    :goto_0
    return-void

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, e:Ljava/lang/IllegalArgumentException;
    invoke-direct {p0, v3}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    .line 223
    iput-object v4, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 225
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 226
    .local v0, e:Ljava/io/IOException;
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    .line 227
    iput-object v4, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    goto :goto_0
.end method

.method public startRecording(ILjava/lang/String;Landroid/content/Context;)V
    .locals 10
    .parameter "outputfileformat"
    .parameter "extension"
    .parameter "context"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v3, 0x1

    .line 147
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 149
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    if-nez v5, :cond_1

    .line 150
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 151
    .local v4, sampleDir:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->canWrite()Z

    move-result v5

    if-nez v5, :cond_0

    .line 152
    new-instance v4, Ljava/io/File;

    .end local v4           #sampleDir:Ljava/io/File;
    const-string v5, "/sdcard/sdcard"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 155
    .restart local v4       #sampleDir:Ljava/io/File;
    :cond_0
    :try_start_0
    const-string v5, "recording"

    invoke-static {v5, p2, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v5

    iput-object v5, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v4           #sampleDir:Ljava/io/File;
    :cond_1
    new-instance v5, Landroid/media/MediaRecorder;

    invoke-direct {v5}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 163
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5, v3}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 164
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5, p1}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 165
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5, v3}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 166
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v6, p0, Lcom/android/soundrecorder/Recorder;->mSampleFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 170
    :try_start_1
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->prepare()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 180
    :try_start_2
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->start()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/soundrecorder/Recorder;->mSampleStart:J

    .line 196
    invoke-direct {p0, v3}, Lcom/android/soundrecorder/Recorder;->setState(I)V

    .line 197
    :goto_0
    return-void

    .line 156
    .restart local v4       #sampleDir:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 157
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v3}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    goto :goto_0

    .line 171
    .end local v1           #e:Ljava/io/IOException;
    .end local v4           #sampleDir:Ljava/io/File;
    :catch_1
    move-exception v2

    .line 172
    .local v2, exception:Ljava/io/IOException;
    invoke-direct {p0, v7}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    .line 173
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->reset()V

    .line 174
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->release()V

    .line 175
    iput-object v9, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    goto :goto_0

    .line 181
    .end local v2           #exception:Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 182
    .local v2, exception:Ljava/lang/RuntimeException;
    const-string v5, "audio"

    invoke-virtual {p3, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 183
    .local v0, audioMngr:Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v5

    if-eq v5, v7, :cond_2

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v5

    if-ne v5, v8, :cond_3

    .line 185
    .local v3, isInCall:Z
    :cond_2
    :goto_1
    if-eqz v3, :cond_4

    .line 186
    invoke-direct {p0, v8}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    .line 190
    :goto_2
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->reset()V

    .line 191
    iget-object v5, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->release()V

    .line 192
    iput-object v9, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    goto :goto_0

    .line 183
    .end local v3           #isInCall:Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 188
    .restart local v3       #isInCall:Z
    :cond_4
    invoke-direct {p0, v7}, Lcom/android/soundrecorder/Recorder;->setError(I)V

    goto :goto_2
.end method

.method public state()I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/android/soundrecorder/Recorder;->mState:I

    return v0
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stopRecording()V

    .line 247
    invoke-virtual {p0}, Lcom/android/soundrecorder/Recorder;->stopPlayback()V

    .line 248
    return-void
.end method

.method public stopPlayback()V
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 243
    :goto_0
    return-void

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 240
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 241
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/soundrecorder/Recorder;->mPlayer:Landroid/media/MediaPlayer;

    .line 242
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/soundrecorder/Recorder;->setState(I)V

    goto :goto_0
.end method

.method public stopRecording()V
    .locals 4

    .prologue
    .line 200
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-nez v0, :cond_0

    .line 209
    :goto_0
    return-void

    .line 203
    :cond_0
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V

    .line 204
    iget-object v0, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/soundrecorder/Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/soundrecorder/Recorder;->mSampleStart:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p0, Lcom/android/soundrecorder/Recorder;->mSampleLength:I

    .line 208
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/soundrecorder/Recorder;->setState(I)V

    goto :goto_0
.end method
