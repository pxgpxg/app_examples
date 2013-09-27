.class Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;
.super Landroid/os/AsyncTask;
.source "PackageAddedReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddPackage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)V
    .locals 0
    .parameter

    .prologue
    .line 36
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;-><init>(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 17
    .parameter "params"

    .prologue
    .line 40
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 41
    .local v16, values:Landroid/content/ContentValues;
    new-instance v8, Ljava/io/File;

    const-string v1, "/data/local/hwui.deny"

    invoke-direct {v8, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .local v8, denyFolder:Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 43
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 45
    :cond_0
    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v10

    .line 46
    .local v10, files:[Ljava/io/File;
    array-length v1, v10

    new-array v15, v1, [Ljava/lang/String;

    .line 47
    .local v15, packageBlacklist:[Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    array-length v1, v10

    if-ge v12, v1, :cond_1

    .line 48
    aget-object v1, v10, v12

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v15, v12

    .line 47
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 50
    :cond_1
    const/4 v11, 0x1

    .line 51
    .local v11, hwaEnabled:Z
    invoke-static {v15}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v2}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 52
    const/4 v11, 0x0

    .line 53
    :cond_2
    const/4 v13, 0x0

    .line 55
    .local v13, info:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/pm/PackageManager;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v2}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v13

    .line 61
    const/4 v14, 0x0

    .line 62
    .local v14, isSystem:Z
    iget-object v1, v13, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const-string v2, "/system/app"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 63
    const/4 v14, 0x1

    .line 65
    :cond_3
    const-string v2, "application_label"

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$200(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v13}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v1, "package_name"

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v2}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v1, "hwa_enabled"

    invoke-static {v11}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v1, "system_app"

    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$300(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 74
    .local v7, cursor:Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-gtz v1, :cond_4

    .line 76
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v1}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$300(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/cyanogenmod/settings/device/hwa/PackageListProvider;->PACKAGE_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 79
    :cond_4
    const/4 v1, 0x0

    .end local v7           #cursor:Landroid/database/Cursor;
    .end local v14           #isSystem:Z
    :goto_1
    return-object v1

    .line 57
    :catch_0
    move-exception v9

    .line 58
    .local v9, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "PackageAddedReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver$AddPackage;->this$0:Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->mPackageName:Ljava/lang/String;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;->access$100(Lcom/cyanogenmod/settings/device/hwa/receivers/PackageAddedReceiver;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found!!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const/4 v1, 0x0

    goto :goto_1
.end method
