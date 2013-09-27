.class public Lcom/android/provision/DefaultActivity;
.super Landroid/app/Activity;
.source "DefaultActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {p0}, Lcom/android/provision/DefaultActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "device_provisioned"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 40
    invoke-virtual {p0}, Lcom/android/provision/DefaultActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "user_setup_complete"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 43
    invoke-virtual {p0}, Lcom/android/provision/DefaultActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 44
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/android/provision/DefaultActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 49
    invoke-virtual {p0}, Lcom/android/provision/DefaultActivity;->finish()V

    .line 50
    return-void
.end method
