.class public Lcom/android/location/fused/FusedLocationProvider;
.super Lcom/android/location/provider/LocationProviderBase;
.source "FusedLocationProvider.java"

# interfaces
.implements Lcom/android/location/fused/FusionEngine$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;
    }
.end annotation


# static fields
.field private static PROPERTIES:Lcom/android/location/provider/ProviderPropertiesUnbundled;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mEngine:Lcom/android/location/fused/FusionEngine;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v0, 0x0

    const/4 v4, 0x1

    move v1, v0

    move v2, v0

    move v3, v0

    move v5, v4

    move v6, v4

    move v7, v4

    move v8, v4

    .line 39
    invoke-static/range {v0 .. v8}, Lcom/android/location/provider/ProviderPropertiesUnbundled;->create(ZZZZZZZII)Lcom/android/location/provider/ProviderPropertiesUnbundled;

    move-result-object v0

    sput-object v0, Lcom/android/location/fused/FusedLocationProvider;->PROPERTIES:Lcom/android/location/provider/ProviderPropertiesUnbundled;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 60
    const-string v0, "FusedLocationProvider"

    sget-object v1, Lcom/android/location/fused/FusedLocationProvider;->PROPERTIES:Lcom/android/location/provider/ProviderPropertiesUnbundled;

    invoke-direct {p0, v0, v1}, Lcom/android/location/provider/LocationProviderBase;-><init>(Ljava/lang/String;Lcom/android/location/provider/ProviderPropertiesUnbundled;)V

    .line 68
    new-instance v0, Lcom/android/location/fused/FusedLocationProvider$1;

    invoke-direct {v0, p0}, Lcom/android/location/fused/FusedLocationProvider$1;-><init>(Lcom/android/location/fused/FusedLocationProvider;)V

    iput-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mHandler:Landroid/os/Handler;

    .line 61
    iput-object p1, p0, Lcom/android/location/fused/FusedLocationProvider;->mContext:Landroid/content/Context;

    .line 62
    new-instance v0, Lcom/android/location/fused/FusionEngine;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/android/location/fused/FusionEngine;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;

    .line 63
    return-void
.end method

.method static synthetic access$000(Lcom/android/location/fused/FusedLocationProvider;)Lcom/android/location/fused/FusionEngine;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;

    return-object v0
.end method


# virtual methods
.method public onDisable()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 96
    return-void
.end method

.method public onDump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/location/fused/FusionEngine;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public onEnable()V
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 91
    return-void
.end method

.method public onGetStatus(Landroid/os/Bundle;)I
    .locals 1
    .parameter "extras"

    .prologue
    .line 111
    const/4 v0, 0x2

    return v0
.end method

.method public onGetStatusUpdateTime()J
    .locals 2

    .prologue
    .line 116
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public onSetRequest(Lcom/android/location/provider/ProviderRequestUnbundled;Landroid/os/WorkSource;)V
    .locals 3
    .parameter "request"
    .parameter "source"

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/location/fused/FusedLocationProvider;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    new-instance v2, Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;

    invoke-direct {v2, p1, p2}, Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;-><init>(Lcom/android/location/provider/ProviderRequestUnbundled;Landroid/os/WorkSource;)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 101
    return-void
.end method
