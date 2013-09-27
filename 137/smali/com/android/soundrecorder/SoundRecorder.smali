.class public Lcom/android/soundrecorder/SoundRecorder;
.super Landroid/app/Activity;
.source "SoundRecorder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/soundrecorder/Recorder$OnStateChangedListener;


# instance fields
.field mAcceptButton:Landroid/widget/Button;

.field mDiscardButton:Landroid/widget/Button;

.field mErrorUiMessage:Ljava/lang/String;

.field mExitButtons:Landroid/widget/LinearLayout;

.field final mHandler:Landroid/os/Handler;

.field mMaxFileSize:J

.field mPlayButton:Landroid/widget/ImageButton;

.field mRecordButton:Landroid/widget/ImageButton;

.field mRecorder:Lcom/android/soundrecorder/Recorder;

.field mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

.field mRequestedType:Ljava/lang/String;

.field private mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

.field mSampleInterrupted:Z

.field mStateLED:Landroid/widget/ImageView;

.field mStateMessage1:Landroid/widget/TextView;

.field mStateMessage2:Landroid/widget/TextView;

.field mStateProgressBar:Landroid/widget/ProgressBar;

.field mStopButton:Landroid/widget/ImageButton;

.field mTimerFormat:Ljava/lang/String;

.field mTimerView:Landroid/widget/TextView;

.field mUpdateTimer:Ljava/lang/Runnable;

.field mVUMeter:Lcom/android/soundrecorder/VUMeter;

.field mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 194
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 211
    const-string v0, "audio/*"

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    .line 213
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 214
    iput-object v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    .line 218
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    .line 222
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mHandler:Landroid/os/Handler;

    .line 223
    new-instance v0, Lcom/android/soundrecorder/SoundRecorder$1;

    invoke-direct {v0, p0}, Lcom/android/soundrecorder/SoundRecorder$1;-><init>(Lcom/android/soundrecorder/SoundRecorder;)V

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mUpdateTimer:Ljava/lang/Runnable;

    .line 241
    iput-object v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/android/soundrecorder/SoundRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateTimerView()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/soundrecorder/SoundRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    return-void
.end method

.method private addToMediaDB(Ljava/io/File;)Landroid/net/Uri;
    .locals 22
    .parameter "file"

    .prologue
    .line 597
    invoke-virtual/range {p0 .. p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 598
    .local v12, res:Landroid/content/res/Resources;
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 599
    .local v7, cv:Landroid/content/ContentValues;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 600
    .local v5, current:J
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    .line 601
    .local v10, modDate:J
    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 602
    .local v8, date:Ljava/util/Date;
    new-instance v9, Ljava/text/SimpleDateFormat;

    const v18, 0x7f04000f

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 604
    .local v9, formatter:Ljava/text/SimpleDateFormat;
    invoke-virtual {v9, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v17

    .line 605
    .local v17, title:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x3e8

    mul-long v15, v18, v20

    .line 609
    .local v15, sampleLengthMillis:J
    const-string v18, "is_music"

    const-string v19, "0"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    const-string v18, "title"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    const-string v18, "_data"

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 613
    const-string v18, "date_added"

    const-wide/16 v19, 0x3e8

    div-long v19, v5, v19

    move-wide/from16 v0, v19

    long-to-int v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 614
    const-string v18, "date_modified"

    const-wide/16 v19, 0x3e8

    div-long v19, v10, v19

    move-wide/from16 v0, v19

    long-to-int v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 615
    const-string v18, "duration"

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 616
    const-string v18, "mime_type"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    const-string v18, "artist"

    const v19, 0x7f040010

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    const-string v18, "album"

    const v19, 0x7f040011

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    const-string v18, "SoundRecorder"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Inserting audio record: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 622
    invoke-virtual/range {p0 .. p0}, Lcom/android/soundrecorder/SoundRecorder;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    .line 623
    .local v13, resolver:Landroid/content/ContentResolver;
    sget-object v4, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 624
    .local v4, base:Landroid/net/Uri;
    const-string v18, "SoundRecorder"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ContentURI: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    invoke-virtual {v13, v4, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v14

    .line 626
    .local v14, result:Landroid/net/Uri;
    if-nez v14, :cond_0

    .line 627
    new-instance v18, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v19, 0x7f04

    invoke-virtual/range {v18 .. v19}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v18

    const v19, 0x7f040015

    invoke-virtual/range {v18 .. v19}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v18

    const v19, 0x7f04000d

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v18

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 633
    const/4 v14, 0x0

    .line 644
    .end local v14           #result:Landroid/net/Uri;
    :goto_0
    return-object v14

    .line 635
    .restart local v14       #result:Landroid/net/Uri;
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/soundrecorder/SoundRecorder;->getPlaylistId(Landroid/content/res/Resources;)I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1

    .line 636
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/android/soundrecorder/SoundRecorder;->createPlaylist(Landroid/content/res/Resources;Landroid/content/ContentResolver;)Landroid/net/Uri;

    .line 638
    :cond_1
    invoke-virtual {v14}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 639
    .local v3, audioId:I
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/soundrecorder/SoundRecorder;->getPlaylistId(Landroid/content/res/Resources;)I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v13, v3, v1, v2}, Lcom/android/soundrecorder/SoundRecorder;->addToPlaylist(Landroid/content/ContentResolver;IJ)V

    .line 643
    new-instance v18, Landroid/content/Intent;

    const-string v19, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/soundrecorder/SoundRecorder;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private addToPlaylist(Landroid/content/ContentResolver;IJ)V
    .locals 10
    .parameter "resolver"
    .parameter "audioId"
    .parameter "playlistId"

    .prologue
    const/4 v9, 0x0

    const/4 v3, 0x0

    .line 538
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "count(*)"

    aput-object v0, v2, v9

    .line 541
    .local v2, cols:[Ljava/lang/String;
    const-string v0, "external"

    invoke-static {v0, p3, p4}, Landroid/provider/MediaStore$Audio$Playlists$Members;->getContentUri(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object v1

    .local v1, uri:Landroid/net/Uri;
    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    .line 542
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 543
    .local v7, cur:Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 544
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 545
    .local v6, base:I
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 546
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 547
    .local v8, values:Landroid/content/ContentValues;
    const-string v0, "play_order"

    add-int v3, v6, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 548
    const-string v0, "audio_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 549
    invoke-virtual {p1, v1, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 550
    return-void
.end method

.method private createPlaylist(Landroid/content/res/Resources;Landroid/content/ContentResolver;)Landroid/net/Uri;
    .locals 5
    .parameter "res"
    .parameter "resolver"

    .prologue
    .line 579
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 580
    .local v0, cv:Landroid/content/ContentValues;
    const-string v2, "name"

    const v3, 0x7f040012

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    const-string v2, "external"

    invoke-static {v2}, Landroid/provider/MediaStore$Audio$Playlists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p2, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 582
    .local v1, uri:Landroid/net/Uri;
    if-nez v1, :cond_0

    .line 583
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v3, 0x7f04

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f040015

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f04000d

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 590
    :cond_0
    return-object v1
.end method

.method private getPlaylistId(Landroid/content/res/Resources;)I
    .locals 10
    .parameter "res"

    .prologue
    const/4 v3, 0x1

    const/4 v9, 0x0

    .line 556
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Audio$Playlists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 557
    .local v1, uri:Landroid/net/Uri;
    new-array v2, v3, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    .line 558
    .local v2, ids:[Ljava/lang/String;
    const-string v8, "name=?"

    .line 559
    .local v8, where:Ljava/lang/String;
    new-array v4, v3, [Ljava/lang/String;

    const v0, 0x7f040012

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v9

    .line 560
    .local v4, args:[Ljava/lang/String;
    const-string v3, "name=?"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/soundrecorder/SoundRecorder;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 561
    .local v6, cursor:Landroid/database/Cursor;
    if-nez v6, :cond_0

    .line 562
    const-string v0, "SoundRecorder"

    const-string v3, "query returns null"

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    :cond_0
    const/4 v7, -0x1

    .line 565
    .local v7, id:I
    if-eqz v6, :cond_1

    .line 566
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 567
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 568
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 571
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 572
    return v7
.end method

.method private initResourceRefs()V
    .locals 2

    .prologue
    .line 326
    const v0, 0x7f06000b

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    .line 327
    const v0, 0x7f06000c

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    .line 328
    const v0, 0x7f06000d

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    .line 330
    const v0, 0x7f060003

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    .line 331
    const v0, 0x7f060005

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    .line 332
    const v0, 0x7f060004

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    .line 333
    const v0, 0x7f060006

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    .line 334
    const v0, 0x7f060001

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mTimerView:Landroid/widget/TextView;

    .line 336
    const v0, 0x7f060007

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mExitButtons:Landroid/widget/LinearLayout;

    .line 337
    const v0, 0x7f060009

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mAcceptButton:Landroid/widget/Button;

    .line 338
    const v0, 0x7f060008

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mDiscardButton:Landroid/widget/Button;

    .line 339
    const v0, 0x7f06000a

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/soundrecorder/VUMeter;

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    .line 341
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 343
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 344
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mAcceptButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mDiscardButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 347
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f04000e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mTimerFormat:Ljava/lang/String;

    .line 349
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0, v1}, Lcom/android/soundrecorder/VUMeter;->setRecorder(Lcom/android/soundrecorder/Recorder;)V

    .line 350
    return-void
.end method

.method private query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v7, 0x0

    .line 523
    :try_start_0
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 524
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 529
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 527
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 528
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v6

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 529
    goto :goto_0
.end method

.method private registerExternalStorageListener()V
    .locals 2

    .prologue
    .line 497
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    if-nez v1, :cond_0

    .line 498
    new-instance v1, Lcom/android/soundrecorder/SoundRecorder$2;

    invoke-direct {v1, p0}, Lcom/android/soundrecorder/SoundRecorder$2;-><init>(Lcom/android/soundrecorder/SoundRecorder;)V

    iput-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    .line 510
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 511
    .local v0, iFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 512
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 513
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 514
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/soundrecorder/SoundRecorder;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 516
    .end local v0           #iFilter:Landroid/content/IntentFilter;
    :cond_0
    return-void
.end method

.method private saveSample()V
    .locals 4

    .prologue
    .line 466
    iget-object v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v2}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v2

    if-nez v2, :cond_1

    .line 478
    :cond_0
    :goto_0
    return-void

    .line 468
    :cond_1
    const/4 v1, 0x0

    .line 470
    .local v1, uri:Landroid/net/Uri;
    :try_start_0
    iget-object v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v2}, Lcom/android/soundrecorder/Recorder;->sampleFile()Ljava/io/File;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/soundrecorder/SoundRecorder;->addToMediaDB(Ljava/io/File;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 474
    if-eqz v1, :cond_0

    .line 477
    const/4 v2, -0x1

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v3, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/android/soundrecorder/SoundRecorder;->setResult(ILandroid/content/Intent;)V

    goto :goto_0

    .line 471
    :catch_0
    move-exception v0

    .line 472
    .local v0, ex:Ljava/lang/UnsupportedOperationException;
    goto :goto_0
.end method

.method private stopAudioPlayback()V
    .locals 3

    .prologue
    .line 359
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.music.musicservicecommand"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 360
    .local v0, i:Landroid/content/Intent;
    const-string v1, "command"

    const-string v2, "pause"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 362
    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->sendBroadcast(Landroid/content/Intent;)V

    .line 363
    return-void
.end method

.method private updateTimeRemaining()V
    .locals 12

    .prologue
    const-wide/16 v8, 0x3c

    const/4 v11, 0x0

    const/4 v7, 0x1

    .line 677
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v5}, Lcom/android/soundrecorder/RemainingTimeCalculator;->timeRemaining()J

    move-result-wide v2

    .line 679
    .local v2, t:J
    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-gtz v5, :cond_0

    .line 680
    iput-boolean v7, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 682
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v5}, Lcom/android/soundrecorder/RemainingTimeCalculator;->currentLowerLimit()I

    move-result v0

    .line 683
    .local v0, limit:I
    packed-switch v0, :pswitch_data_0

    .line 693
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    .line 697
    :goto_0
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v5}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 710
    .end local v0           #limit:I
    :goto_1
    return-void

    .line 685
    .restart local v0       #limit:I
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f040006

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    goto :goto_0

    .line 689
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f040007

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    goto :goto_0

    .line 701
    .end local v0           #limit:I
    :cond_0
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 702
    .local v1, res:Landroid/content/res/Resources;
    const-string v4, ""

    .line 704
    .local v4, timeStr:Ljava/lang/String;
    cmp-long v5, v2, v8

    if-gez v5, :cond_2

    .line 705
    const v5, 0x7f04000a

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 709
    :cond_1
    :goto_2
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 706
    :cond_2
    const-wide/16 v5, 0x21c

    cmp-long v5, v2, v5

    if-gez v5, :cond_1

    .line 707
    const v5, 0x7f040009

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    div-long v7, v2, v8

    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 683
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateTimerView()V
    .locals 15

    .prologue
    const-wide/16 v13, 0x3c

    const/4 v6, 0x0

    const/4 v12, 0x2

    const/4 v7, 0x1

    .line 652
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 653
    .local v1, res:Landroid/content/res/Resources;
    iget-object v8, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v8}, Lcom/android/soundrecorder/Recorder;->state()I

    move-result v2

    .line 655
    .local v2, state:I
    if-eq v2, v7, :cond_0

    if-ne v2, v12, :cond_3

    :cond_0
    move v0, v7

    .line 657
    .local v0, ongoing:Z
    :goto_0
    if-eqz v0, :cond_4

    iget-object v8, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v8}, Lcom/android/soundrecorder/Recorder;->progress()I

    move-result v8

    int-to-long v3, v8

    .line 658
    .local v3, time:J
    :goto_1
    iget-object v8, p0, Lcom/android/soundrecorder/SoundRecorder;->mTimerFormat:Ljava/lang/String;

    new-array v9, v12, [Ljava/lang/Object;

    div-long v10, v3, v13

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v6

    rem-long v10, v3, v13

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 659
    .local v5, timeStr:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/soundrecorder/SoundRecorder;->mTimerView:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 661
    if-ne v2, v12, :cond_5

    .line 662
    iget-object v6, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    const-wide/16 v7, 0x64

    mul-long/2addr v7, v3

    iget-object v9, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v9}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v9

    int-to-long v9, v9

    div-long/2addr v7, v9

    long-to-int v7, v7

    invoke-virtual {v6, v7}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 667
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    .line 668
    iget-object v6, p0, Lcom/android/soundrecorder/SoundRecorder;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/android/soundrecorder/SoundRecorder;->mUpdateTimer:Ljava/lang/Runnable;

    const-wide/16 v8, 0x3e8

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 669
    :cond_2
    return-void

    .end local v0           #ongoing:Z
    .end local v3           #time:J
    .end local v5           #timeStr:Ljava/lang/String;
    :cond_3
    move v0, v6

    .line 655
    goto :goto_0

    .line 657
    .restart local v0       #ongoing:Z
    :cond_4
    iget-object v8, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v8}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v8

    int-to-long v3, v8

    goto :goto_1

    .line 663
    .restart local v3       #time:J
    .restart local v5       #timeStr:Ljava/lang/String;
    :cond_5
    if-ne v2, v7, :cond_1

    .line 664
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateTimeRemaining()V

    goto :goto_2
.end method

.method private updateUi()V
    .locals 6

    .prologue
    const v5, 0x7f040001

    const/4 v2, 0x1

    const/4 v4, 0x4

    const/4 v3, 0x0

    .line 716
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 718
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->state()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 816
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateTimerView()V

    .line 817
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    invoke-virtual {v0}, Lcom/android/soundrecorder/VUMeter;->invalidate()V

    .line 818
    return-void

    .line 720
    :pswitch_0
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v1

    if-nez v1, :cond_2

    .line 721
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 722
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 723
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 724
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 725
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 726
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 727
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->requestFocus()Z

    .line 729
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 730
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 731
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 733
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mExitButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 734
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    invoke-virtual {v1, v3}, Lcom/android/soundrecorder/VUMeter;->setVisibility(I)V

    .line 736
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 738
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/soundrecorder/SoundRecorder;->setTitle(Ljava/lang/CharSequence;)V

    .line 759
    :goto_1
    iget-boolean v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    if-eqz v1, :cond_1

    .line 760
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 761
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    const v2, 0x7f040005

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 762
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 765
    :cond_1
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 766
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 767
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 740
    :cond_2
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 741
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 742
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 743
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 744
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 745
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 747
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 748
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 749
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 751
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mExitButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 752
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    invoke-virtual {v1, v4}, Lcom/android/soundrecorder/VUMeter;->setVisibility(I)V

    .line 754
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 756
    const v1, 0x7f040002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/soundrecorder/SoundRecorder;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 772
    :pswitch_1
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 773
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 774
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 775
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 776
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 777
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 779
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 780
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 781
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    const v2, 0x7f020004

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 782
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 783
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    const v2, 0x7f040004

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 785
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mExitButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 786
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    invoke-virtual {v1, v3}, Lcom/android/soundrecorder/VUMeter;->setVisibility(I)V

    .line 788
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 790
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 795
    :pswitch_2
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 796
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecordButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 797
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 798
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mPlayButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 799
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 800
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStopButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 802
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage1:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 803
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateLED:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 804
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateMessage2:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 806
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mExitButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 807
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mVUMeter:Lcom/android/soundrecorder/VUMeter;

    invoke-virtual {v1, v4}, Lcom/android/soundrecorder/VUMeter;->setVisibility(I)V

    .line 809
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mStateProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 811
    const v1, 0x7f040003

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 718
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "button"

    .prologue
    const/16 v3, 0x170c

    const/4 v2, 0x1

    .line 369
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 419
    :cond_0
    :goto_0
    return-void

    .line 372
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 415
    :pswitch_1
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->delete()V

    .line 416
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->finish()V

    goto :goto_0

    .line 374
    :pswitch_2
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v0}, Lcom/android/soundrecorder/RemainingTimeCalculator;->reset()V

    .line 375
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 376
    iput-boolean v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 377
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f040008

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    .line 378
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    goto :goto_0

    .line 379
    :cond_2
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v0}, Lcom/android/soundrecorder/RemainingTimeCalculator;->diskSpaceAvailable()Z

    move-result v0

    if-nez v0, :cond_3

    .line 380
    iput-boolean v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 381
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f040006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    .line 382
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    goto :goto_0

    .line 384
    :cond_3
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->stopAudioPlayback()V

    .line 386
    const-string v0, "audio/amr"

    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 387
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v0, v3}, Lcom/android/soundrecorder/RemainingTimeCalculator;->setBitRate(I)V

    .line 388
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    const/4 v1, 0x3

    const-string v2, ".amr"

    invoke-virtual {v0, v1, v2, p0}, Lcom/android/soundrecorder/Recorder;->startRecording(ILjava/lang/String;Landroid/content/Context;)V

    .line 397
    :goto_1
    iget-wide v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 398
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->sampleFile()Ljava/io/File;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/soundrecorder/RemainingTimeCalculator;->setFileSizeLimit(Ljava/io/File;J)V

    goto :goto_0

    .line 389
    :cond_4
    const-string v0, "audio/3gpp"

    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 390
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-virtual {v0, v3}, Lcom/android/soundrecorder/RemainingTimeCalculator;->setBitRate(I)V

    .line 391
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    const-string v1, ".3gpp"

    invoke-virtual {v0, v2, v1, p0}, Lcom/android/soundrecorder/Recorder;->startRecording(ILjava/lang/String;Landroid/content/Context;)V

    goto :goto_1

    .line 394
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid output file type requested"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 404
    :pswitch_3
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->startPlayback()V

    goto/16 :goto_0

    .line 407
    :pswitch_4
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->stop()V

    goto/16 :goto_0

    .line 410
    :pswitch_5
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 411
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->saveSample()V

    .line 412
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->finish()V

    goto/16 :goto_0

    .line 372
    :pswitch_data_0
    .packed-switch 0x7f060008
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 298
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 300
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->setContentView(I)V

    .line 301
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->initResourceRefs()V

    .line 302
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    .line 303
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "icycle"

    .prologue
    const-wide/16 v8, -0x1

    const/4 v7, 0x0

    .line 245
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 247
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 248
    .local v1, i:Landroid/content/Intent;
    if-eqz v1, :cond_2

    .line 249
    invoke-virtual {v1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v4

    .line 250
    .local v4, s:Ljava/lang/String;
    const-string v5, "audio/amr"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "audio/3gpp"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "audio/*"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "*/*"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 252
    :cond_0
    iput-object v4, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    .line 260
    :cond_1
    const-string v0, "android.provider.MediaStore.extra.MAX_BYTES"

    .line 262
    .local v0, EXTRA_MAX_BYTES:Ljava/lang/String;
    const-string v5, "android.provider.MediaStore.extra.MAX_BYTES"

    invoke-virtual {v1, v5, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    .line 265
    .end local v0           #EXTRA_MAX_BYTES:Ljava/lang/String;
    .end local v4           #s:Ljava/lang/String;
    :cond_2
    const-string v5, "audio/*"

    iget-object v6, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "*/*"

    iget-object v6, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 266
    :cond_3
    const-string v5, "audio/3gpp"

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRequestedType:Ljava/lang/String;

    .line 269
    :cond_4
    const/high16 v5, 0x7f03

    invoke-virtual {p0, v5}, Lcom/android/soundrecorder/SoundRecorder;->setContentView(I)V

    .line 271
    new-instance v5, Lcom/android/soundrecorder/Recorder;

    invoke-direct {v5}, Lcom/android/soundrecorder/Recorder;-><init>()V

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    .line 272
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v5, p0}, Lcom/android/soundrecorder/Recorder;->setOnStateChangedListener(Lcom/android/soundrecorder/Recorder$OnStateChangedListener;)V

    .line 273
    new-instance v5, Lcom/android/soundrecorder/RemainingTimeCalculator;

    invoke-direct {v5}, Lcom/android/soundrecorder/RemainingTimeCalculator;-><init>()V

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRemainingTimeCalculator:Lcom/android/soundrecorder/RemainingTimeCalculator;

    .line 275
    const-string v5, "power"

    invoke-virtual {p0, v5}, Lcom/android/soundrecorder/SoundRecorder;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    .line 277
    .local v2, pm:Landroid/os/PowerManager;
    const/4 v5, 0x6

    const-string v6, "SoundRecorder"

    invoke-virtual {v2, v5, v6}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v5

    iput-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 280
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->initResourceRefs()V

    .line 282
    invoke-virtual {p0, v7}, Lcom/android/soundrecorder/SoundRecorder;->setResult(I)V

    .line 283
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->registerExternalStorageListener()V

    .line 284
    if-eqz p1, :cond_5

    .line 285
    const-string v5, "recorder_state"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 286
    .local v3, recorderState:Landroid/os/Bundle;
    if-eqz v3, :cond_5

    .line 287
    iget-object v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v5, v3}, Lcom/android/soundrecorder/Recorder;->restoreState(Landroid/os/Bundle;)V

    .line 288
    const-string v5, "sample_interrupted"

    invoke-virtual {v3, v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 289
    const-string v5, "max_file_size"

    invoke-virtual {v3, v5, v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    .line 293
    .end local v3           #recorderState:Landroid/os/Bundle;
    :cond_5
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    .line 294
    .end local v2           #pm:Landroid/os/PowerManager;
    :goto_0
    return-void

    .line 253
    .restart local v4       #s:Ljava/lang/String;
    :cond_6
    if-eqz v4, :cond_1

    .line 255
    invoke-virtual {p0, v7}, Lcom/android/soundrecorder/SoundRecorder;->setResult(I)V

    .line 256
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->finish()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 485
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/soundrecorder/SoundRecorder;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 487
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSDCardMountEventReceiver:Landroid/content/BroadcastReceiver;

    .line 489
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 490
    return-void
.end method

.method public onError(I)V
    .locals 4
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 840
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 843
    packed-switch p1, :pswitch_data_0

    move-object v0, v1

    .line 854
    :goto_0
    if-eqz v0, :cond_0

    .line 855
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v3, 0x7f04

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f04000d

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 862
    :cond_0
    return-void

    .line 845
    :pswitch_0
    const v2, 0x7f040013

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 851
    :pswitch_1
    const v2, 0x7f040014

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 843
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 426
    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 427
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->state()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 441
    :goto_0
    const/4 v0, 0x1

    .line 443
    :goto_1
    return v0

    .line 429
    :pswitch_0
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 430
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->saveSample()V

    .line 431
    :cond_0
    invoke-virtual {p0}, Lcom/android/soundrecorder/SoundRecorder;->finish()V

    goto :goto_0

    .line 434
    :pswitch_1
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 435
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->saveSample()V

    goto :goto_0

    .line 438
    :pswitch_2
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->clear()V

    goto :goto_0

    .line 443
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1

    .line 427
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 455
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->state()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 456
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 458
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 459
    return-void

    .line 455
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .parameter "outState"

    .prologue
    .line 307
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 309
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1}, Lcom/android/soundrecorder/Recorder;->sampleLength()I

    move-result v1

    if-nez v1, :cond_0

    .line 319
    :goto_0
    return-void

    .line 312
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 314
    .local v0, recorderState:Landroid/os/Bundle;
    iget-object v1, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v1, v0}, Lcom/android/soundrecorder/Recorder;->saveState(Landroid/os/Bundle;)V

    .line 315
    const-string v1, "sample_interrupted"

    iget-boolean v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 316
    const-string v1, "max_file_size"

    iget-wide v2, p0, Lcom/android/soundrecorder/SoundRecorder;->mMaxFileSize:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 318
    const-string v1, "recorder_state"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public onStateChanged(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 824
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 825
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mSampleInterrupted:Z

    .line 826
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mErrorUiMessage:Ljava/lang/String;

    .line 827
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 833
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/soundrecorder/SoundRecorder;->updateUi()V

    .line 834
    return-void

    .line 829
    :cond_2
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 830
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 449
    iget-object v0, p0, Lcom/android/soundrecorder/SoundRecorder;->mRecorder:Lcom/android/soundrecorder/Recorder;

    invoke-virtual {v0}, Lcom/android/soundrecorder/Recorder;->stop()V

    .line 450
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 451
    return-void
.end method
