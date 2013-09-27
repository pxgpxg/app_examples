.class public Lcom/cyanogenmod/settings/device/hwa/DatabaseTools;
.super Ljava/lang/Object;
.source "DatabaseTools.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static scanPackages(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/Context;)V
    .locals 24
    .parameter "database"
    .parameter "context"

    .prologue
    .line 19
    new-instance v12, Ljava/io/File;

    const-string v2, "/data/local/hwui.deny"

    invoke-direct {v12, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .local v12, denyFolder:Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 21
    invoke-virtual {v12}, Ljava/io/File;->mkdirs()Z

    .line 23
    :cond_0
    invoke-virtual {v12}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v13

    .line 24
    .local v13, files:[Ljava/io/File;
    array-length v2, v13

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v20, v0

    .line 25
    .local v20, packageBlacklist:[Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, i:I
    :goto_0
    array-length v2, v13

    if-ge v15, v2, :cond_1

    .line 26
    aget-object v2, v13, v15

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v20, v15

    .line 25
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 28
    :cond_1
    const-string v3, "packages"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v5, "package_name"

    aput-object v5, v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 31
    .local v10, cursor:Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    new-array v11, v2, [Ljava/lang/String;

    .line 32
    .local v11, databasePackages:[Ljava/lang/String;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 34
    :cond_2
    invoke-interface {v10}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    const-string v3, "package_name"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v11, v2

    .line 37
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 39
    :cond_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 40
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v22

    .line 41
    .local v22, pm:Landroid/content/pm/PackageManager;
    const/16 v2, 0x80

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v19

    .line 43
    .local v19, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 44
    .local v17, installedPackages:[Ljava/lang/String;
    const/4 v15, 0x0

    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v2

    if-ge v15, v2, :cond_7

    .line 45
    move-object/from16 v0, v19

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/content/pm/ApplicationInfo;

    .line 46
    .local v16, info:Landroid/content/pm/ApplicationInfo;
    const/4 v14, 0x1

    .line 47
    .local v14, hwaEnabled:Z
    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 48
    .local v21, packageName:Ljava/lang/String;
    move-object/from16 v0, v16

    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v2, v17, v15

    .line 49
    invoke-static/range {v20 .. v20}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 50
    const/4 v14, 0x0

    .line 53
    :goto_2
    const/16 v18, 0x0

    .line 54
    .local v18, isSystem:Z
    move-object/from16 v0, v16

    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const-string v3, "/system/app"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 55
    const/16 v18, 0x1

    .line 57
    :cond_4
    new-instance v23, Landroid/content/ContentValues;

    invoke-direct/range {v23 .. v23}, Landroid/content/ContentValues;-><init>()V

    .line 58
    .local v23, values:Landroid/content/ContentValues;
    const-string v3, "application_label"

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    const-string v2, "package_name"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    const-string v2, "hwa_enabled"

    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v2, "system_app"

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 65
    const-string v2, "packages"

    const-string v3, "package_name IS ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v21, v4, v5

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 44
    :goto_3
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1

    .line 52
    .end local v18           #isSystem:Z
    .end local v23           #values:Landroid/content/ContentValues;
    :cond_5
    const/4 v14, 0x1

    goto :goto_2

    .line 69
    .restart local v18       #isSystem:Z
    .restart local v23       #values:Landroid/content/ContentValues;
    :cond_6
    const-string v2, "packages"

    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_3

    .line 71
    .end local v14           #hwaEnabled:Z
    .end local v16           #info:Landroid/content/pm/ApplicationInfo;
    .end local v18           #isSystem:Z
    .end local v21           #packageName:Ljava/lang/String;
    .end local v23           #values:Landroid/content/ContentValues;
    :cond_7
    const/4 v15, 0x0

    :goto_4
    array-length v2, v11

    if-ge v15, v2, :cond_9

    .line 72
    invoke-static/range {v17 .. v17}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    aget-object v3, v11, v15

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 73
    const-string v2, "packages"

    const-string v3, "package_name IS ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aget-object v6, v11, v15

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 71
    :cond_8
    add-int/lit8 v15, v15, 0x1

    goto :goto_4

    .line 78
    :cond_9
    return-void
.end method
