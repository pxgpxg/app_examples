.class public Lcom/android/location/fused/FusionEngine;
.super Ljava/lang/Object;
.source "FusionEngine.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/location/fused/FusionEngine$1;,
        Lcom/android/location/fused/FusionEngine$ProviderStats;,
        Lcom/android/location/fused/FusionEngine$Callback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/android/location/fused/FusionEngine$Callback;

.field private final mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private mFusedLocation:Landroid/location/Location;

.field private mGpsLocation:Landroid/location/Location;

.field private final mLocationManager:Landroid/location/LocationManager;

.field private final mLooper:Landroid/os/Looper;

.field private mNetworkLocation:Landroid/location/Location;

.field private mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

.field private final mStats:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/location/fused/FusionEngine$ProviderStats;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 4
    .parameter "context"
    .parameter "looper"

    .prologue
    const/4 v3, 0x0

    const v2, 0x7f7fffff

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    .line 66
    iput-object p1, p0, Lcom/android/location/fused/FusionEngine;->mContext:Landroid/content/Context;

    .line 67
    const-string v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    .line 68
    new-instance v0, Landroid/location/Location;

    const-string v1, ""

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    .line 69
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    invoke-virtual {v0, v2}, Landroid/location/Location;->setAccuracy(F)V

    .line 70
    new-instance v0, Landroid/location/Location;

    const-string v1, ""

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    .line 71
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    invoke-virtual {v0, v2}, Landroid/location/Location;->setAccuracy(F)V

    .line 72
    iput-object p2, p0, Lcom/android/location/fused/FusionEngine;->mLooper:Landroid/os/Looper;

    .line 74
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v1, "gps"

    new-instance v2, Lcom/android/location/fused/FusionEngine$ProviderStats;

    invoke-direct {v2, v3}, Lcom/android/location/fused/FusionEngine$ProviderStats;-><init>(Lcom/android/location/fused/FusionEngine$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/location/fused/FusionEngine$ProviderStats;

    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    const-string v2, "gps"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->available:Z

    .line 76
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v1, "network"

    new-instance v2, Lcom/android/location/fused/FusionEngine$ProviderStats;

    invoke-direct {v2, v3}, Lcom/android/location/fused/FusionEngine$ProviderStats;-><init>(Lcom/android/location/fused/FusionEngine$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/location/fused/FusionEngine$ProviderStats;

    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    const-string v2, "network"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->available:Z

    .line 79
    return-void
.end method

.method private disableProvider(Ljava/lang/String;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 146
    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/location/fused/FusionEngine$ProviderStats;

    .line 148
    .local v0, stats:Lcom/android/location/fused/FusionEngine$ProviderStats;
    iget-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->requested:Z

    if-eqz v1, :cond_0

    .line 149
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->requested:Z

    .line 150
    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {v1, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 152
    :cond_0
    return-void
.end method

.method private enableProvider(Ljava/lang/String;J)V
    .locals 8
    .parameter "name"
    .parameter "minTime"

    .prologue
    const/4 v4, 0x0

    .line 132
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/location/fused/FusionEngine$ProviderStats;

    .line 134
    .local v7, stats:Lcom/android/location/fused/FusionEngine$ProviderStats;
    iget-boolean v0, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->requested:Z

    if-nez v0, :cond_1

    .line 135
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->requestTime:J

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->requested:Z

    .line 137
    iput-wide p2, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->minTime:J

    .line 138
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    iget-object v6, p0, Lcom/android/location/fused/FusionEngine;->mLooper:Landroid/os/Looper;

    move-object v1, p1

    move-wide v2, p2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iget-wide v0, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->minTime:J

    cmp-long v0, v0, p2

    if-eqz v0, :cond_0

    .line 140
    iput-wide p2, v7, Lcom/android/location/fused/FusionEngine$ProviderStats;->minTime:J

    .line 141
    iget-object v0, p0, Lcom/android/location/fused/FusionEngine;->mLocationManager:Landroid/location/LocationManager;

    iget-object v6, p0, Lcom/android/location/fused/FusionEngine;->mLooper:Landroid/os/Looper;

    move-object v1, p1

    move-wide v2, p2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V

    goto :goto_0
.end method

.method private static isBetterThan(Landroid/location/Location;Landroid/location/Location;)Z
    .locals 8
    .parameter "locationA"
    .parameter "locationB"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 201
    if-nez p0, :cond_1

    move v0, v1

    .line 223
    :cond_0
    :goto_0
    return v0

    .line 204
    :cond_1
    if-eqz p1, :cond_0

    .line 210
    invoke-virtual {p0}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v4

    const-wide/32 v6, -0x70595200

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 217
    invoke-virtual {p0}, Landroid/location/Location;->hasAccuracy()Z

    move-result v2

    if-nez v2, :cond_2

    move v0, v1

    .line 218
    goto :goto_0

    .line 220
    :cond_2
    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 223
    invoke-virtual {p0}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v3

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method private updateFusedLocation()V
    .locals 5

    .prologue
    .line 228
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    iget-object v4, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    invoke-static {v3, v4}, Lcom/android/location/fused/FusionEngine;->isBetterThan(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 229
    new-instance v3, Landroid/location/Location;

    iget-object v4, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    invoke-direct {v3, v4}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    iput-object v3, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    .line 233
    :goto_0
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    const-string v4, "fused"

    invoke-virtual {v3, v4}, Landroid/location/Location;->setProvider(Ljava/lang/String;)V

    .line 234
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    if-eqz v3, :cond_1

    .line 236
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    invoke-virtual {v3}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 237
    .local v1, srcExtras:Landroid/os/Bundle;
    if-eqz v1, :cond_1

    .line 238
    const-string v3, "noGPSLocation"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    .line 240
    .local v2, srcParcelable:Landroid/os/Parcelable;
    instance-of v3, v2, Landroid/location/Location;

    if-eqz v3, :cond_1

    .line 241
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    invoke-virtual {v3}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 242
    .local v0, dstExtras:Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 243
    new-instance v0, Landroid/os/Bundle;

    .end local v0           #dstExtras:Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 244
    .restart local v0       #dstExtras:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    invoke-virtual {v3, v0}, Landroid/location/Location;->setExtras(Landroid/os/Bundle;)V

    .line 246
    :cond_0
    const-string v3, "noGPSLocation"

    check-cast v2, Landroid/location/Location;

    .end local v2           #srcParcelable:Landroid/os/Parcelable;
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 252
    .end local v0           #dstExtras:Landroid/os/Bundle;
    .end local v1           #srcExtras:Landroid/os/Bundle;
    :cond_1
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mCallback:Lcom/android/location/fused/FusionEngine$Callback;

    if-eqz v3, :cond_3

    .line 253
    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mCallback:Lcom/android/location/fused/FusionEngine$Callback;

    iget-object v4, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    invoke-interface {v3, v4}, Lcom/android/location/fused/FusionEngine$Callback;->reportLocation(Landroid/location/Location;)V

    .line 257
    :goto_1
    return-void

    .line 231
    :cond_2
    new-instance v3, Landroid/location/Location;

    iget-object v4, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    invoke-direct {v3, v4}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    iput-object v3, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    goto :goto_0

    .line 255
    :cond_3
    const-string v3, "FusedLocation"

    const-string v4, "Location updates received while fusion engine not started"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private updateRequirements()V
    .locals 10

    .prologue
    const-wide v8, 0x7fffffffffffffffL

    .line 155
    iget-boolean v6, p0, Lcom/android/location/fused/FusionEngine;->mEnabled:Z

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    if-nez v6, :cond_1

    .line 156
    :cond_0
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    .line 157
    const-string v6, "network"

    invoke-direct {p0, v6}, Lcom/android/location/fused/FusionEngine;->disableProvider(Ljava/lang/String;)V

    .line 158
    const-string v6, "gps"

    invoke-direct {p0, v6}, Lcom/android/location/fused/FusionEngine;->disableProvider(Ljava/lang/String;)V

    .line 195
    :goto_0
    return-void

    .line 162
    :cond_1
    const-wide v3, 0x7fffffffffffffffL

    .line 163
    .local v3, networkInterval:J
    const-wide v0, 0x7fffffffffffffffL

    .line 164
    .local v0, gpsInterval:J
    iget-object v6, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    invoke-virtual {v6}, Lcom/android/location/provider/ProviderRequestUnbundled;->getLocationRequests()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/location/provider/LocationRequestUnbundled;

    .line 165
    .local v5, request:Lcom/android/location/provider/LocationRequestUnbundled;
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getQuality()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    goto :goto_1

    .line 168
    :sswitch_0
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v6

    cmp-long v6, v6, v0

    if-gez v6, :cond_3

    .line 169
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v0

    .line 171
    :cond_3
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v6

    cmp-long v6, v6, v3

    if-gez v6, :cond_2

    .line 172
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v3

    goto :goto_1

    .line 178
    :sswitch_1
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v6

    cmp-long v6, v6, v3

    if-gez v6, :cond_2

    .line 179
    invoke-virtual {v5}, Lcom/android/location/provider/LocationRequestUnbundled;->getInterval()J

    move-result-wide v3

    goto :goto_1

    .line 185
    .end local v5           #request:Lcom/android/location/provider/LocationRequestUnbundled;
    :cond_4
    cmp-long v6, v0, v8

    if-gez v6, :cond_5

    .line 186
    const-string v6, "gps"

    invoke-direct {p0, v6, v0, v1}, Lcom/android/location/fused/FusionEngine;->enableProvider(Ljava/lang/String;J)V

    .line 190
    :goto_2
    cmp-long v6, v3, v8

    if-gez v6, :cond_6

    .line 191
    const-string v6, "network"

    invoke-direct {p0, v6, v3, v4}, Lcom/android/location/fused/FusionEngine;->enableProvider(Ljava/lang/String;J)V

    goto :goto_0

    .line 188
    :cond_5
    const-string v6, "gps"

    invoke-direct {p0, v6}, Lcom/android/location/fused/FusionEngine;->disableProvider(Ljava/lang/String;)V

    goto :goto_2

    .line 193
    :cond_6
    const-string v6, "network"

    invoke-direct {p0, v6}, Lcom/android/location/fused/FusionEngine;->disableProvider(Ljava/lang/String;)V

    goto :goto_0

    .line 165
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0x66 -> :sswitch_1
        0x68 -> :sswitch_1
        0xc9 -> :sswitch_1
        0xcb -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public deinit()V
    .locals 3

    .prologue
    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    .line 94
    invoke-virtual {p0}, Lcom/android/location/fused/FusionEngine;->disable()V

    .line 95
    const-string v0, "FusedLocation"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "engine stopped ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    return-void
.end method

.method public disable()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/location/fused/FusionEngine;->mEnabled:Z

    .line 107
    invoke-direct {p0}, Lcom/android/location/fused/FusionEngine;->updateRequirements()V

    .line 108
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/16 v4, 0xa

    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .local v0, s:Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mEnabled="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/location/fused/FusionEngine;->mEnabled:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 296
    const-string v1, "fused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mFusedLocation:Landroid/location/Location;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 297
    const-string v1, "gps %s\n"

    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v3, "gps"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 299
    const-string v1, "net %s\n"

    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    const-string v3, "network"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 301
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 302
    return-void
.end method

.method public init(Lcom/android/location/fused/FusionEngine$Callback;)V
    .locals 3
    .parameter "callback"

    .prologue
    .line 82
    const-string v0, "FusedLocation"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "engine started ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusionEngine;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iput-object p1, p0, Lcom/android/location/fused/FusionEngine;->mCallback:Lcom/android/location/fused/FusionEngine$Callback;

    .line 84
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 2
    .parameter "location"

    .prologue
    .line 262
    const-string v0, "gps"

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 263
    iput-object p1, p0, Lcom/android/location/fused/FusionEngine;->mGpsLocation:Landroid/location/Location;

    .line 264
    invoke-direct {p0}, Lcom/android/location/fused/FusionEngine;->updateFusedLocation()V

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 265
    :cond_1
    const-string v0, "network"

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    iput-object p1, p0, Lcom/android/location/fused/FusionEngine;->mNetworkLocation:Landroid/location/Location;

    .line 267
    invoke-direct {p0}, Lcom/android/location/fused/FusionEngine;->updateFusedLocation()V

    goto :goto_0
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 2
    .parameter "provider"

    .prologue
    .line 287
    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/location/fused/FusionEngine$ProviderStats;

    .line 288
    .local v0, stats:Lcom/android/location/fused/FusionEngine$ProviderStats;
    if-nez v0, :cond_0

    .line 291
    :goto_0
    return-void

    .line 290
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->available:Z

    goto :goto_0
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 2
    .parameter "provider"

    .prologue
    .line 278
    iget-object v1, p0, Lcom/android/location/fused/FusionEngine;->mStats:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/location/fused/FusionEngine$ProviderStats;

    .line 279
    .local v0, stats:Lcom/android/location/fused/FusionEngine$ProviderStats;
    if-nez v0, :cond_0

    .line 282
    :goto_0
    return-void

    .line 281
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/location/fused/FusionEngine$ProviderStats;->available:Z

    goto :goto_0
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .parameter "provider"
    .parameter "status"
    .parameter "extras"

    .prologue
    .line 273
    return-void
.end method

.method public setRequest(Lcom/android/location/provider/ProviderRequestUnbundled;Landroid/os/WorkSource;)V
    .locals 1
    .parameter "request"
    .parameter "source"

    .prologue
    .line 112
    iput-object p1, p0, Lcom/android/location/fused/FusionEngine;->mRequest:Lcom/android/location/provider/ProviderRequestUnbundled;

    .line 113
    invoke-virtual {p1}, Lcom/android/location/provider/ProviderRequestUnbundled;->getReportLocation()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/location/fused/FusionEngine;->mEnabled:Z

    .line 114
    invoke-direct {p0}, Lcom/android/location/fused/FusionEngine;->updateRequirements()V

    .line 115
    return-void
.end method
