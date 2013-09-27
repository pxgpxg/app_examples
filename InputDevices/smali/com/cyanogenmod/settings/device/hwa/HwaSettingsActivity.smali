.class public Lcom/cyanogenmod/settings/device/hwa/HwaSettingsActivity;
.super Landroid/app/Activity;
.source "HwaSettingsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 10
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 11
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/settings/device/hwa/HwaSettingsActivity;->setContentView(I)V

    .line 12
    return-void
.end method
