.class public Lcom/android/providers/drm/DrmPushReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DrmPushReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 37
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 39
    invoke-virtual {p2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, rightMimeType:Ljava/lang/String;
    const-string v4, "application/vnd.oma.drm.rights+xml"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "application/vnd.oma.drm.rights+wbxml"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 43
    :cond_0
    const-string v4, "data"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    move-object v1, v4

    check-cast v1, [B

    .line 44
    .local v1, rightData:[B
    if-nez v1, :cond_1

    .line 45
    const-string v4, "DrmPushReceiver"

    const-string v5, "The rights data is invalid."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .end local v1           #rightData:[B
    .end local v3           #rightMimeType:Ljava/lang/String;
    :goto_0
    return-void

    .line 48
    .restart local v1       #rightData:[B
    .restart local v3       #rightMimeType:Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 50
    .local v2, rightDataStream:Ljava/io/ByteArrayInputStream;
    :try_start_0
    invoke-static {}, Landroid/drm/mobile1/DrmRightsManager;->getInstance()Landroid/drm/mobile1/DrmRightsManager;

    move-result-object v4

    array-length v5, v1

    invoke-virtual {v4, v2, v5, v3}, Landroid/drm/mobile1/DrmRightsManager;->installRights(Ljava/io/InputStream;ILjava/lang/String;)Landroid/drm/mobile1/DrmRights;
    :try_end_0
    .catch Landroid/drm/mobile1/DrmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 61
    const-string v4, "DrmPushReceiver"

    const-string v5, "Install drm rights successfully."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, e:Landroid/drm/mobile1/DrmException;
    const-string v4, "DrmPushReceiver"

    const-string v5, "Install drm rights failed."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 56
    .end local v0           #e:Landroid/drm/mobile1/DrmException;
    :catch_1
    move-exception v0

    .line 57
    .local v0, e:Ljava/io/IOException;
    const-string v4, "DrmPushReceiver"

    const-string v5, "IOException occurs when install drm rights."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 64
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #rightData:[B
    .end local v2           #rightDataStream:Ljava/io/ByteArrayInputStream;
    :cond_2
    const-string v4, "DrmPushReceiver"

    const-string v5, "This is not drm rights push mimetype."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .end local v3           #rightMimeType:Ljava/lang/String;
    :cond_3
    const-string v4, "DrmPushReceiver"

    const-string v5, "This is not wap push received action."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
