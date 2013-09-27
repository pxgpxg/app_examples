.class public Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;
.super Landroid/database/ContentObserver;
.source "PackageListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PackageObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "handler"

    .prologue
    .line 266
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    .line 267
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 268
    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 272
    const/4 v0, 0x0

    return v0
.end method

.method public onChange(Z)V
    .locals 2
    .parameter "selfChange"

    .prologue
    .line 277
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 278
    const-string v0, "PackageListFragment"

    const-string v1, "database changed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageObserver;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    #calls: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->restartLoading()V
    invoke-static {v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$300(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)V

    .line 280
    return-void
.end method
