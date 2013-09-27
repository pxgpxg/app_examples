.class public Lcom/android/providers/settings/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field private static final mValidTables:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mContext:Landroid/content/Context;

.field private mUserHandle:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    .line 86
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "system"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 87
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "secure"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 88
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "global"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 89
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "bluetooth_devices"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 90
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "bookmarks"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 93
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "favorites"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 94
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "gservices"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    const-string v1, "old_favorites"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "context"
    .parameter "userHandle"

    .prologue
    .line 112
    invoke-static {p2}, Lcom/android/providers/settings/DatabaseHelper;->dbNameForUser(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x5f

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 113
    iput-object p1, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    .line 114
    iput p2, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    .line 115
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->setWriteAheadLoggingEnabled(Z)V

    .line 116
    return-void
.end method

.method private createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 132
    const-string v0, "CREATE TABLE global (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 137
    const-string v0, "CREATE INDEX globalIndex1 ON global (name);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method private createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 123
    const-string v0, "CREATE TABLE secure (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 128
    const-string v0, "CREATE INDEX secureIndex1 ON secure (name);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method static dbNameForUser(I)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 100
    if-nez p0, :cond_0

    .line 101
    const-string v0, "settings.db"

    .line 107
    :goto_0
    return-object v0

    .line 105
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Landroid/os/Environment;->getUserSystemDirectory(I)Ljava/io/File;

    move-result-object v1

    const-string v2, "settings.db"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2271
    const-string v0, "system"

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 2
    .parameter "db"
    .parameter "table"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 2276
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2277
    .local v0, value:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    .end local p4
    :cond_0
    return p4
.end method

.method private getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v8, 0x0

    .line 2282
    .line 2284
    const/4 v0, 0x1

    :try_start_0
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "value"

    aput-object v1, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    move-object v1, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 2286
    if-eqz v1, :cond_2

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2287
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    .line 2288
    if-nez v0, :cond_1

    .line 2291
    :goto_0
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 2293
    :cond_0
    :goto_1
    return-object p4

    :cond_1
    move-object p4, v0

    .line 2288
    goto :goto_0

    .line 2291
    :cond_2
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v1, v8

    :goto_2
    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method private hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1557
    .local p1, set:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1558
    .local v0, array:[Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method

.method public static isValidTable(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 119
    sget-object v0, Lcom/android/providers/settings/DatabaseHelper;->mValidTables:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 12
    .parameter

    .prologue
    const/4 v11, 0x1

    .line 1740
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 1742
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 1744
    :try_start_0
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f03

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    .line 1745
    const-string v0, "bookmarks"

    invoke-static {v5, v0}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 1747
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v6

    .line 1751
    :cond_0
    :goto_0
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v1

    if-le v1, v6, :cond_2

    :cond_1
    if-eq v0, v11, :cond_2

    .line 1753
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 1757
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1758
    const-string v1, "bookmark"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1818
    :cond_2
    :goto_1
    return-void

    .line 1762
    :cond_3
    const/4 v0, 0x0

    const-string v1, "package"

    invoke-interface {v5, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1763
    const/4 v0, 0x0

    const-string v2, "class"

    invoke-interface {v5, v0, v2}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1764
    const/4 v0, 0x0

    const-string v7, "shortcut"

    invoke-interface {v5, v0, v7}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1765
    const/4 v7, 0x0

    const-string v8, "category"

    invoke-interface {v5, v7, v8}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1767
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 1768
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1769
    const-string v0, "SettingsProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to get shortcut for: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "/"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 1813
    :catch_0
    move-exception v0

    .line 1814
    const-string v1, "SettingsProvider"

    const-string v2, "Got execption parsing bookmarks."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1775
    :cond_4
    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    .line 1777
    :try_start_1
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1779
    const/4 v7, 0x0

    :try_start_2
    invoke-virtual {v4, v0, v7}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v1

    move-object v2, v1

    .line 1792
    :goto_2
    :try_start_3
    new-instance v1, Landroid/content/Intent;

    const-string v7, "android.intent.action.MAIN"

    const/4 v9, 0x0

    invoke-direct {v1, v7, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1793
    const-string v7, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1794
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1795
    invoke-virtual {v2, v4}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1805
    :goto_3
    const/high16 v2, 0x1000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1806
    const-string v2, "intent"

    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1807
    const-string v1, "title"

    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1808
    const-string v0, "shortcut"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1809
    const-string v0, "bookmarks"

    const-string v1, "shortcut = ?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v2, v7

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1811
    const-string v0, "bookmarks"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    .line 1815
    :catch_1
    move-exception v0

    .line 1816
    const-string v1, "SettingsProvider"

    const-string v2, "Got execption parsing bookmarks."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 1780
    :catch_2
    move-exception v7

    .line 1781
    const/4 v0, 0x1

    :try_start_4
    new-array v0, v0, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v1, v0, v9

    invoke-virtual {v4, v0}, Landroid/content/pm/PackageManager;->canonicalToCurrentPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 1783
    new-instance v0, Landroid/content/ComponentName;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    invoke-direct {v0, v9, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 1785
    const/4 v9, 0x0

    :try_start_5
    invoke-virtual {v4, v0, v9}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    move-result-object v1

    move-object v2, v1

    .line 1789
    goto :goto_2

    .line 1786
    :catch_3
    move-exception v0

    .line 1787
    :try_start_6
    const-string v0, "SettingsProvider"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to add bookmark: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, "/"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 1796
    :cond_5
    if-eqz v7, :cond_6

    .line 1797
    const-string v0, "android.intent.action.MAIN"

    invoke-static {v0, v7}, Landroid/content/Intent;->makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 1798
    const-string v0, ""

    goto/16 :goto_3

    .line 1800
    :cond_6
    const-string v1, "SettingsProvider"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to add bookmark for shortcut "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": missing package/class or category attributes"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_0
.end method

.method private loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2256
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2258
    return-void

    .line 2256
    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method

.method private loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 1994
    const-string v0, "window_animation_scale"

    const/high16 v1, 0x7f07

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 1996
    const-string v0, "transition_animation_scale"

    const v1, 0x7f070001

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 1998
    return-void
.end method

.method private loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 2
    .parameter

    .prologue
    .line 2001
    const-string v0, "haptic_feedback_enabled"

    const v1, 0x7f040006

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2003
    return-void
.end method

.method private loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"
    .parameter "base"

    .prologue
    .line 2266
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3, p4, p4}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2268
    return-void
.end method

.method private loadGlobalSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 7
    .parameter

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 2103
    const/4 v1, 0x0

    .line 2105
    :try_start_0
    const-string v3, "INSERT OR IGNORE INTO global(name,value) VALUES(?,?);"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 2109
    const-string v3, "airplane_mode_on"

    const v4, 0x7f040001

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2112
    const-string v3, "airplane_mode_radios"

    const/high16 v4, 0x7f06

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2115
    const-string v3, "airplane_mode_toggleable_radios"

    const v4, 0x7f060001

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2118
    const-string v3, "assisted_gps_enabled"

    const v4, 0x7f04000b

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2121
    const-string v3, "auto_time"

    const v4, 0x7f040002

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2124
    const-string v3, "auto_time_zone"

    const v4, 0x7f040003

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2127
    const-string v4, "stay_on_while_plugged_in"

    const-string v3, "1"

    const-string v5, "ro.kernel.qemu"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f040021

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_0
    move v3, v0

    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v4, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2132
    const-string v3, "wifi_sleep_policy"

    const v4, 0x7f050003

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2135
    const-string v3, "mode_ringer"

    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2139
    const-string v3, "package_verifier_enable"

    const v4, 0x7f04000a

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2142
    const-string v3, "wifi_on"

    const v4, 0x7f04000e

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2145
    const-string v3, "wifi_networks_available_notification_on"

    const v4, 0x7f04000f

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2148
    const-string v3, "bluetooth_on"

    const v4, 0x7f040007

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2152
    const-string v3, "cdma_cell_broadcast_sms"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2156
    const-string v4, "data_roaming"

    const-string v3, "true"

    const-string v5, "ro.com.android.dataroaming"

    const-string v6, "false"

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    move v3, v0

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v1, v4, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2161
    const-string v3, "device_provisioned"

    const v4, 0x7f040017

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2164
    iget-object v3, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050008

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    .line 2166
    if-lez v3, :cond_1

    .line 2167
    const-string v4, "download_manager_max_bytes_over_mobile"

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v4, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2171
    :cond_1
    iget-object v3, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    .line 2173
    if-lez v3, :cond_2

    .line 2174
    const-string v4, "download_manager_recommended_max_bytes_over_mobile"

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v4, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2179
    :cond_2
    const-string v3, "mobile_data"

    const-string v4, "true"

    const-string v5, "ro.com.android.mobiledata"

    const-string v6, "true"

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    :goto_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v3, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2184
    const-string v0, "netstats_enabled"

    const v2, 0x7f04000c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2187
    const-string v0, "install_non_market_apps"

    const v2, 0x7f040009

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2190
    const-string v0, "network_preference"

    const v2, 0x7f050002

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2193
    const-string v0, "usb_mass_storage_enabled"

    const v2, 0x7f04000d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2196
    const-string v0, "wifi_max_dhcp_retry_count"

    const v2, 0x7f05000c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2199
    const-string v0, "wifi_display_on"

    const v2, 0x7f040008

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2202
    const-string v0, "lock_sound"

    const v2, 0x7f060009

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2204
    const-string v0, "unlock_sound"

    const v2, 0x7f06000a

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2206
    const-string v0, "power_sounds_enabled"

    const v2, 0x7f050004

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2208
    const-string v0, "low_battery_sound"

    const v2, 0x7f060004

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2210
    const-string v0, "dock_sounds_enabled"

    const v2, 0x7f050005

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2212
    const-string v0, "desk_dock_sound"

    const v2, 0x7f060005

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2214
    const-string v0, "desk_undock_sound"

    const v2, 0x7f060006

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2216
    const-string v0, "car_dock_sound"

    const v2, 0x7f060007

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2218
    const-string v0, "car_undock_sound"

    const v2, 0x7f060008

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2220
    const-string v0, "wireless_charging_started_sound"

    const v2, 0x7f06000b

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2223
    const-string v0, "set_install_location"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2224
    const-string v0, "default_install_location"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2228
    const-string v0, "emergency_tone"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2231
    const-string v0, "call_auto_retry"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2235
    const-string v0, "ro.telephony.default_network"

    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2237
    const-string v2, "preferred_network_mode"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2241
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 2243
    :cond_3
    return-void

    :cond_4
    move v3, v2

    .line 2127
    goto/16 :goto_0

    :cond_5
    move v3, v2

    .line 2156
    goto/16 :goto_1

    :cond_6
    move v0, v2

    .line 2179
    goto/16 :goto_2

    .line 2241
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7
    throw v0
.end method

.method private loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2261
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2263
    return-void
.end method

.method private loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 2
    .parameter

    .prologue
    .line 2095
    const-string v0, "backup_enabled"

    const v1, 0x7f040010

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2098
    const-string v0, "backup_transport"

    const v1, 0x7f060003

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2100
    return-void
.end method

.method private loadSecureSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .parameter

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 2006
    const/4 v1, 0x0

    .line 2008
    :try_start_0
    const-string v3, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 2011
    const-string v3, "location_providers_allowed"

    const v4, 0x7f060002

    invoke-direct {p0, v1, v3, v4}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2014
    const-string v3, "ro.com.android.wifi-watchlist"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2015
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2016
    const-string v4, "wifi_watchdog_watch_list"

    invoke-direct {p0, v1, v4, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2024
    :cond_0
    const-string v3, "mock_location"

    const-string v4, "1"

    const-string v5, "ro.allow.mock.location"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    move v0, v2

    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v3, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2027
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 2029
    const-string v0, "mount_play_not_snd"

    const v3, 0x7f040012

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2032
    const-string v0, "mount_ums_autostart"

    const v3, 0x7f040013

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2035
    const-string v0, "mount_ums_prompt"

    const v3, 0x7f040014

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2038
    const-string v0, "mount_ums_notify_enabled"

    const v3, 0x7f040015

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2041
    const-string v0, "accessibility_script_injection"

    const v3, 0x7f04001a

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2044
    const-string v0, "accessibility_web_content_key_bindings"

    const v3, 0x7f06000c

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2047
    const-string v0, "long_press_timeout"

    const v3, 0x7f05000a

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2050
    const-string v0, "touch_exploration_enabled"

    const v3, 0x7f04001c

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2053
    const-string v0, "speak_password"

    const v3, 0x7f04001b

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2056
    const-string v0, "accessibility_script_injection_url"

    const v3, 0x7f06000d

    invoke-direct {p0, v1, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2059
    const-string v0, "ro.lockscreen.disable.default"

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-ne v0, v2, :cond_3

    .line 2060
    const-string v0, "lockscreen.disabled"

    const-string v2, "1"

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2066
    :goto_0
    const-string v0, "screensaver_enabled"

    const v2, 0x1110045

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2068
    const-string v0, "screensaver_activate_on_dock"

    const v2, 0x1110046

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2070
    const-string v0, "screensaver_activate_on_sleep"

    const v2, 0x1110047

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2072
    const-string v0, "screensaver_components"

    const v2, 0x104002c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2074
    const-string v0, "screensaver_default_component"

    const v2, 0x104002c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2077
    const-string v0, "accessibility_display_magnification_enabled"

    const v2, 0x7f04001d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2080
    const-string v0, "accessibility_display_magnification_scale"

    const v2, 0x7f070002

    const/4 v3, 0x1

    invoke-direct {p0, v1, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 2083
    const-string v0, "accessibility_display_magnification_auto_update"

    const v2, 0x7f04001e

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 2087
    const-string v0, "user_setup_complete"

    const v2, 0x7f040022

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2090
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 2092
    :cond_2
    return-void

    .line 2062
    :cond_3
    :try_start_1
    const-string v0, "lockscreen.disabled"

    const v2, 0x7f040016

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2090
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_4
    throw v0
.end method

.method private loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .parameter "stmt"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2246
    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 2247
    const/4 v0, 0x2

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 2248
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 2249
    return-void
.end method

.method private loadSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 1923
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSystemSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1924
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSecureSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1926
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_0

    .line 1927
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadGlobalSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1929
    :cond_0
    return-void
.end method

.method private loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    .locals 1
    .parameter "stmt"
    .parameter "key"
    .parameter "resid"

    .prologue
    .line 2252
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2253
    return-void
.end method

.method private loadSystemSettings(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 1932
    const/4 v1, 0x0

    .line 1934
    :try_start_0
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1937
    const-string v0, "dim_screen"

    const/high16 v2, 0x7f04

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1939
    const-string v0, "screen_off_timeout"

    const/high16 v2, 0x7f05

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1943
    const-string v0, "dtmf_tone_type"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1946
    const-string v0, "hearing_aid"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1949
    const-string v0, "tty_mode"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1952
    const-string v0, "noise_suppression"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1954
    const-string v0, "screen_brightness"

    const v2, 0x7f050001

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1957
    const-string v0, "screen_brightness_mode"

    const v2, 0x7f040005

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1960
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 1962
    const-string v0, "accelerometer_rotation"

    const v2, 0x7f040004

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1965
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 1967
    const-string v0, "notification_light_pulse"

    const v2, 0x7f040011

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1970
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 1972
    const-string v0, "pointer_speed"

    const v2, 0x7f05000b

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1975
    const-string v0, "status_bar_battery"

    const v2, 0x7f05000d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1978
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1980
    :cond_0
    return-void

    .line 1978
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v0
.end method

.method private loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 2
    .parameter

    .prologue
    .line 1983
    const-string v0, "dtmf_tone"

    const v1, 0x7f04001f

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1985
    const-string v0, "sound_effects_enabled"

    const v1, 0x7f040020

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1987
    const-string v0, "haptic_feedback_enabled"

    const v1, 0x7f040006

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1989
    const-string v0, "lockscreen_sounds_enabled"

    const v1, 0x7f050006

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1991
    return-void
.end method

.method private loadVibrateSetting(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 1882
    if-eqz p2, :cond_0

    .line 1883
    const-string v0, "DELETE FROM system WHERE name=\'vibrate_on\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1886
    :cond_0
    const/4 v1, 0x0

    .line 1888
    :try_start_0
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1892
    const/4 v0, 0x0

    .line 1893
    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-static {v0, v2, v3}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v0

    .line 1896
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v0, v2, v3}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v2

    or-int/2addr v0, v2

    .line 1898
    const-string v2, "vibrate_on"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1900
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1902
    :cond_1
    return-void

    .line 1900
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v0
.end method

.method private loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .parameter "db"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1908
    const-string v5, "vibrate_on"

    invoke-direct {p0, p1, v5, v4}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v1

    .line 1910
    .local v1, vibrateSetting:I
    and-int/lit8 v5, v1, 0x3

    if-ne v5, v3, :cond_1

    move v2, v3

    .line 1912
    .local v2, vibrateWhenRinging:Z
    :goto_0
    const/4 v0, 0x0

    .line 1914
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v5, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1916
    const-string v5, "vibrate_when_ringing"

    if-eqz v2, :cond_2

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v0, v5, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1918
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1920
    :cond_0
    return-void

    .end local v0           #stmt:Landroid/database/sqlite/SQLiteStatement;
    .end local v2           #vibrateWhenRinging:Z
    :cond_1
    move v2, v4

    .line 1910
    goto :goto_0

    .restart local v0       #stmt:Landroid/database/sqlite/SQLiteStatement;
    .restart local v2       #vibrateWhenRinging:Z
    :cond_2
    move v3, v4

    .line 1916
    goto :goto_1

    .line 1918
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_3
    throw v3
.end method

.method private loadVolumeLevels(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    .line 1827
    const/4 v1, 0x0

    .line 1829
    :try_start_0
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1832
    const-string v0, "volume_music"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1834
    const-string v0, "volume_ring"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1836
    const-string v0, "volume_system"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1838
    const-string v0, "volume_voice"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1842
    const-string v0, "volume_alarm"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x4

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1844
    const-string v0, "volume_notification"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x5

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1848
    const-string v0, "volume_bluetooth_sco"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x6

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1858
    const/16 v0, 0xa6

    .line 1862
    iget-object v2, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1110033

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1864
    const/16 v0, 0xae

    .line 1866
    :cond_0
    const-string v2, "mode_ringer_streams_affected"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1869
    const-string v0, "mute_streams_affected"

    const/16 v2, 0x2e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1875
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1878
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1879
    return-void

    .line 1875
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v0
.end method

.method private movePrefixedSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1601
    .line 1604
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1606
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " (name,value) SELECT name,value FROM "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " WHERE substr(name,0,?)=?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 1609
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DELETE FROM "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " WHERE substr(name,0,?)=?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1612
    array-length v3, p4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    aget-object v4, p4, v0

    .line 1613
    const/4 v5, 0x1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    int-to-long v6, v6

    invoke-virtual {v2, v5, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 1614
    const/4 v5, 0x2

    invoke-virtual {v2, v5, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1615
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1617
    const/4 v5, 0x1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    int-to-long v6, v6

    invoke-virtual {v1, v5, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 1618
    const/4 v5, 0x2

    invoke-virtual {v1, v5, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1619
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1612
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1621
    :cond_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1623
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1624
    if-eqz v2, :cond_1

    .line 1625
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1627
    :cond_1
    if-eqz v1, :cond_2

    .line 1628
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1631
    :cond_2
    return-void

    .line 1623
    :catchall_0
    move-exception v0

    move-object v2, v1

    :goto_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1624
    if-eqz v2, :cond_3

    .line 1625
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1627
    :cond_3
    if-eqz v1, :cond_4

    .line 1628
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_4
    throw v0

    .line 1623
    :catchall_1
    move-exception v0

    goto :goto_1
.end method

.method private moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1565
    .line 1568
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1570
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p5, :cond_0

    const-string v0, " OR IGNORE "

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " INTO "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " (name,value) SELECT name,value FROM "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " WHERE name=?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 1574
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DELETE FROM "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " WHERE name=?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1576
    array-length v3, p4

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v3, :cond_1

    aget-object v4, p4, v0

    .line 1577
    const/4 v5, 0x1

    invoke-virtual {v2, v5, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1578
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 1580
    const/4 v5, 0x1

    invoke-virtual {v1, v5, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 1581
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1576
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1570
    :cond_0
    :try_start_2
    const-string v0, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1583
    :cond_1
    :try_start_3
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1585
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1586
    if-eqz v2, :cond_2

    .line 1587
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1589
    :cond_2
    if-eqz v1, :cond_3

    .line 1590
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1593
    :cond_3
    return-void

    .line 1585
    :catchall_0
    move-exception v0

    move-object v2, v1

    :goto_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1586
    if-eqz v2, :cond_4

    .line 1587
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1589
    :cond_4
    if-eqz v1, :cond_5

    .line 1590
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_5
    throw v0

    .line 1585
    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method private upgradeAutoBrightness(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 1721
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1723
    :try_start_0
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f040005

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    .line 1726
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT OR REPLACE INTO system(name,value) values(\'screen_brightness_mode\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1728
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1730
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1732
    return-void

    .line 1723
    :cond_0
    :try_start_1
    const-string v0, "0"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1730
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method private upgradeLockPatternLocation(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 9
    .parameter

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 1634
    const-string v1, "system"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v0, "value"

    aput-object v0, v2, v8

    const-string v3, "name=\'lock_pattern\'"

    move-object v0, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1636
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 1637
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1638
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1639
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1642
    :try_start_0
    new-instance v2, Lcom/android/internal/widget/LockPatternUtils;

    iget-object v3, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 1643
    invoke-virtual {v2, v1}, Lcom/android/internal/widget/LockPatternUtils;->stringToPattern(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 1645
    invoke-virtual {v2, v1}, Lcom/android/internal/widget/LockPatternUtils;->saveLockPattern(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1650
    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1651
    const-string v0, "system"

    const-string v1, "name=\'lock_pattern\'"

    invoke-virtual {p1, v0, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1655
    :goto_1
    return-void

    .line 1653
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1646
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private upgradeScreenTimeoutFromNever(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8
    .parameter

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 1659
    const-string v1, "system"

    new-array v2, v4, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v6

    const-string v0, "value"

    aput-object v0, v2, v7

    const-string v3, "name=? AND value=?"

    new-array v4, v4, [Ljava/lang/String;

    const-string v0, "screen_off_timeout"

    aput-object v0, v4, v6

    const-string v0, "-1"

    aput-object v0, v4, v7

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1664
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    .line 1665
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1667
    :try_start_0
    const-string v0, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v5

    .line 1671
    const-string v0, "screen_off_timeout"

    const v1, 0x1b7740

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v5, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1674
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1679
    :cond_0
    :goto_0
    return-void

    .line 1674
    :catchall_0
    move-exception v0

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_1
    throw v0

    .line 1677
    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method private upgradeVibrateSettingFromNone(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter "db"

    .prologue
    const/4 v3, 0x0

    .line 1682
    const-string v2, "vibrate_on"

    invoke-direct {p0, p1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v1

    .line 1684
    .local v1, vibrateSetting:I
    and-int/lit8 v2, v1, 0x3

    if-nez v2, :cond_0

    .line 1685
    const/4 v2, 0x2

    invoke-static {v3, v3, v2}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v1

    .line 1689
    :cond_0
    const/4 v2, 0x1

    invoke-static {v1, v2, v1}, Landroid/media/AudioService;->getValueForVibrateSetting(III)I

    move-result v1

    .line 1692
    const/4 v0, 0x0

    .line 1694
    .local v0, stmt:Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    const-string v2, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 1696
    const-string v2, "vibrate_on"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1698
    if-eqz v0, :cond_1

    .line 1699
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1701
    :cond_1
    return-void

    .line 1698
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    .line 1699
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_2
    throw v2
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter

    .prologue
    .line 142
    const-string v0, "CREATE TABLE system (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 147
    const-string v0, "CREATE INDEX systemIndex1 ON system (name);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 149
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 152
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_0

    .line 153
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 156
    :cond_0
    const-string v0, "CREATE TABLE bluetooth_devices (_id INTEGER PRIMARY KEY,name TEXT,addr TEXT,channel INTEGER,type INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 164
    const-string v0, "CREATE TABLE bookmarks (_id INTEGER PRIMARY KEY,title TEXT,folder TEXT,intent TEXT,shortcut INTEGER,ordering INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 173
    const-string v0, "CREATE INDEX bookmarksIndex1 ON bookmarks (folder);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 174
    const-string v0, "CREATE INDEX bookmarksIndex2 ON bookmarks (shortcut);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 177
    const/4 v0, 0x0

    .line 179
    :try_start_0
    const-string v1, "package"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/pm/IPackageManager;->isOnlyCoreApps()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 183
    :goto_0
    if-nez v0, :cond_1

    .line 184
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 188
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVolumeLevels(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 191
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadSettings(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 192
    return-void

    .line 181
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 10
    .parameter
    .parameter
    .parameter

    .prologue
    .line 196
    const-string v0, "SettingsProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upgrading settings database from version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const/16 v0, 0x14

    if-ne p2, v0, :cond_9a

    .line 215
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateSetting(Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 217
    const/16 v0, 0x15

    .line 220
    :goto_0
    const/16 v1, 0x16

    if-ge v0, v1, :cond_0

    .line 221
    const/16 v0, 0x16

    .line 223
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeLockPatternLocation(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 226
    :cond_0
    const/16 v1, 0x17

    if-ge v0, v1, :cond_1

    .line 227
    const-string v0, "UPDATE favorites SET iconResource=0 WHERE iconType=0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 228
    const/16 v0, 0x17

    .line 231
    :cond_1
    const/16 v1, 0x17

    if-ne v0, v1, :cond_2

    .line 232
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 234
    :try_start_0
    const-string v0, "ALTER TABLE favorites ADD spanX INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 235
    const-string v0, "ALTER TABLE favorites ADD spanY INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 237
    const-string v0, "UPDATE favorites SET spanX=1, spanY=1 WHERE itemType<=0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 239
    const-string v0, "UPDATE favorites SET spanX=2, spanY=2 WHERE itemType=1000 or itemType=1002"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 242
    const-string v0, "UPDATE favorites SET spanX=4, spanY=1 WHERE itemType=1001"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 243
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 247
    const/16 v0, 0x18

    .line 250
    :cond_2
    const/16 v1, 0x18

    if-ne v0, v1, :cond_3

    .line 251
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 255
    :try_start_1
    const-string v0, "DELETE FROM system WHERE name=\'network_preference\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 256
    const-string v0, "INSERT INTO system (\'name\', \'value\') values (\'network_preference\', \'1\')"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 260
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 262
    const/16 v0, 0x19

    .line 265
    :cond_3
    const/16 v1, 0x19

    if-ne v0, v1, :cond_4

    .line 266
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 268
    :try_start_2
    const-string v0, "ALTER TABLE favorites ADD uri TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 269
    const-string v0, "ALTER TABLE favorites ADD displayMode INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 270
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 272
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 274
    const/16 v0, 0x1a

    .line 277
    :cond_4
    const/16 v1, 0x1a

    if-ne v0, v1, :cond_5

    .line 279
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 281
    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createSecureTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 282
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 284
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 286
    const/16 v0, 0x1b

    .line 289
    :cond_5
    const/16 v1, 0x1b

    if-ne v0, v1, :cond_6

    .line 290
    const/16 v0, 0x1f

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "adb_enabled"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "android_id"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "bluetooth_on"

    aput-object v1, v4, v0

    const/4 v0, 0x3

    const-string v1, "data_roaming"

    aput-object v1, v4, v0

    const/4 v0, 0x4

    const-string v1, "device_provisioned"

    aput-object v1, v4, v0

    const/4 v0, 0x5

    const-string v1, "http_proxy"

    aput-object v1, v4, v0

    const/4 v0, 0x6

    const-string v1, "install_non_market_apps"

    aput-object v1, v4, v0

    const/4 v0, 0x7

    const-string v1, "location_providers_allowed"

    aput-object v1, v4, v0

    const/16 v0, 0x8

    const-string v1, "logging_id"

    aput-object v1, v4, v0

    const/16 v0, 0x9

    const-string v1, "network_preference"

    aput-object v1, v4, v0

    const/16 v0, 0xa

    const-string v1, "parental_control_enabled"

    aput-object v1, v4, v0

    const/16 v0, 0xb

    const-string v1, "parental_control_last_update"

    aput-object v1, v4, v0

    const/16 v0, 0xc

    const-string v1, "parental_control_redirect_url"

    aput-object v1, v4, v0

    const/16 v0, 0xd

    const-string v1, "settings_classname"

    aput-object v1, v4, v0

    const/16 v0, 0xe

    const-string v1, "usb_mass_storage_enabled"

    aput-object v1, v4, v0

    const/16 v0, 0xf

    const-string v1, "use_google_mail"

    aput-object v1, v4, v0

    const/16 v0, 0x10

    const-string v1, "wifi_networks_available_notification_on"

    aput-object v1, v4, v0

    const/16 v0, 0x11

    const-string v1, "wifi_networks_available_repeat_delay"

    aput-object v1, v4, v0

    const/16 v0, 0x12

    const-string v1, "wifi_num_open_networks_kept"

    aput-object v1, v4, v0

    const/16 v0, 0x13

    const-string v1, "wifi_on"

    aput-object v1, v4, v0

    const/16 v0, 0x14

    const-string v1, "wifi_watchdog_acceptable_packet_loss_percentage"

    aput-object v1, v4, v0

    const/16 v0, 0x15

    const-string v1, "wifi_watchdog_ap_count"

    aput-object v1, v4, v0

    const/16 v0, 0x16

    const-string v1, "wifi_watchdog_background_check_delay_ms"

    aput-object v1, v4, v0

    const/16 v0, 0x17

    const-string v1, "wifi_watchdog_background_check_enabled"

    aput-object v1, v4, v0

    const/16 v0, 0x18

    const-string v1, "wifi_watchdog_background_check_timeout_ms"

    aput-object v1, v4, v0

    const/16 v0, 0x19

    const-string v1, "wifi_watchdog_initial_ignored_ping_count"

    aput-object v1, v4, v0

    const/16 v0, 0x1a

    const-string v1, "wifi_watchdog_max_ap_checks"

    aput-object v1, v4, v0

    const/16 v0, 0x1b

    const-string v1, "wifi_watchdog_on"

    aput-object v1, v4, v0

    const/16 v0, 0x1c

    const-string v1, "wifi_watchdog_ping_count"

    aput-object v1, v4, v0

    const/16 v0, 0x1d

    const-string v1, "wifi_watchdog_ping_delay_ms"

    aput-object v1, v4, v0

    const/16 v0, 0x1e

    const-string v1, "wifi_watchdog_ping_timeout_ms"

    aput-object v1, v4, v0

    .line 323
    const-string v2, "system"

    const-string v3, "secure"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 324
    const/16 v0, 0x1c

    .line 327
    :cond_6
    const/16 v1, 0x1c

    if-eq v0, v1, :cond_7

    const/16 v1, 0x1d

    if-ne v0, v1, :cond_8

    .line 334
    :cond_7
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 336
    :try_start_4
    const-string v0, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 338
    const/16 v0, 0x26

    .line 341
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 346
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 349
    const/16 v0, 0x1e

    .line 352
    :cond_8
    const/16 v1, 0x1e

    if-ne v0, v1, :cond_9

    .line 358
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 360
    :try_start_5
    const-string v0, "UPDATE bookmarks SET folder = \'@quicklaunch\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 361
    const-string v0, "UPDATE bookmarks SET title = \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 362
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 364
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 366
    const/16 v0, 0x1f

    .line 369
    :cond_9
    const/16 v1, 0x1f

    if-ne v0, v1, :cond_b

    .line 374
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 375
    const/4 v1, 0x0

    .line 377
    :try_start_6
    const-string v0, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 379
    const-string v0, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 381
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 383
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 384
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 386
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 387
    if-eqz v1, :cond_a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 389
    :cond_a
    const/16 v0, 0x20

    .line 392
    :cond_b
    const/16 v1, 0x20

    if-ne v0, v1, :cond_d

    .line 395
    const-string v0, "ro.com.android.wifi-watchlist"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 396
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 397
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 399
    :try_start_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT OR IGNORE INTO secure(name,value) values(\'wifi_watchdog_watch_list\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 402
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 404
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 407
    :cond_c
    const/16 v0, 0x21

    .line 410
    :cond_d
    const/16 v1, 0x21

    if-ne v0, v1, :cond_e

    .line 412
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 414
    :try_start_8
    const-string v0, "INSERT INTO system(name,value) values(\'zoom\',\'2\');"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 415
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_8

    .line 417
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 419
    const/16 v0, 0x22

    .line 422
    :cond_e
    const/16 v1, 0x22

    if-ne v0, v1, :cond_10

    .line 423
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 424
    const/4 v1, 0x0

    .line 426
    :try_start_9
    const-string v0, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 428
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadSecure35Settings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 429
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9

    .line 431
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 432
    if-eqz v1, :cond_f

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 434
    :cond_f
    const/16 v0, 0x23

    .line 440
    :cond_10
    const/16 v1, 0x23

    if-ne v0, v1, :cond_11

    .line 441
    const/16 v0, 0x24

    .line 444
    :cond_11
    const/16 v1, 0x24

    if-ne v0, v1, :cond_12

    .line 447
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 449
    :try_start_a
    const-string v0, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 451
    const/16 v0, 0xa6

    .line 455
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 458
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_a

    .line 460
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 462
    const/16 v0, 0x25

    .line 465
    :cond_12
    const/16 v1, 0x25

    if-ne v0, v1, :cond_14

    .line 466
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 467
    const/4 v1, 0x0

    .line 469
    :try_start_b
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 471
    const-string v0, "airplane_mode_toggleable_radios"

    const v2, 0x7f060001

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 473
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_b

    .line 475
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 476
    if-eqz v1, :cond_13

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 478
    :cond_13
    const/16 v0, 0x26

    .line 481
    :cond_14
    const/16 v1, 0x26

    if-ne v0, v1, :cond_15

    .line 482
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 484
    :try_start_c
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f04000b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_78

    const-string v0, "1"

    .line 486
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT OR IGNORE INTO secure(name,value) values(\'assisted_gps_enabled\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 488
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 490
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 493
    const/16 v0, 0x27

    .line 496
    :cond_15
    const/16 v1, 0x27

    if-ne v0, v1, :cond_16

    .line 497
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeAutoBrightness(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 498
    const/16 v0, 0x28

    .line 501
    :cond_16
    const/16 v1, 0x28

    if-ne v0, v1, :cond_18

    .line 505
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 506
    const/4 v1, 0x0

    .line 508
    :try_start_d
    const-string v0, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 510
    const-string v0, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 512
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 514
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 515
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_d

    .line 517
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 518
    if-eqz v1, :cond_17

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 520
    :cond_17
    const/16 v0, 0x29

    .line 523
    :cond_18
    const/16 v1, 0x29

    if-ne v0, v1, :cond_1a

    .line 527
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 528
    const/4 v1, 0x0

    .line 530
    :try_start_e
    const-string v0, "DELETE FROM system WHERE name=\'haptic_feedback_enabled\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 532
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 534
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultHapticSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 535
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_e

    .line 537
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 538
    if-eqz v1, :cond_19

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 540
    :cond_19
    const/16 v0, 0x2a

    .line 543
    :cond_1a
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_1c

    .line 547
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 548
    const/4 v1, 0x0

    .line 550
    :try_start_f
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 552
    const-string v0, "notification_light_pulse"

    const v2, 0x7f040011

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 554
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_f

    .line 556
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 557
    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 559
    :cond_1b
    const/16 v0, 0x2b

    .line 562
    :cond_1c
    const/16 v1, 0x2b

    if-ne v0, v1, :cond_1e

    .line 566
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 567
    const/4 v1, 0x0

    .line 569
    :try_start_10
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 571
    const-string v0, "volume_bluetooth_sco"

    sget-object v2, Landroid/media/AudioManager;->DEFAULT_STREAM_VOLUME:[I

    const/4 v3, 0x6

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 573
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_10

    .line 575
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 576
    if-eqz v1, :cond_1d

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 578
    :cond_1d
    const/16 v0, 0x2c

    .line 581
    :cond_1e
    const/16 v1, 0x2c

    if-ne v0, v1, :cond_1f

    .line 585
    const-string v0, "DROP TABLE IF EXISTS gservices"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 586
    const-string v0, "DROP INDEX IF EXISTS gservicesIndex1"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 587
    const/16 v0, 0x2d

    .line 590
    :cond_1f
    const/16 v1, 0x2d

    if-ne v0, v1, :cond_20

    .line 594
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 596
    :try_start_11
    const-string v0, "INSERT INTO secure(name,value) values(\'mount_play_not_snd\',\'1\');"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 598
    const-string v0, "INSERT INTO secure(name,value) values(\'mount_ums_autostart\',\'0\');"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 600
    const-string v0, "INSERT INTO secure(name,value) values(\'mount_ums_prompt\',\'1\');"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 602
    const-string v0, "INSERT INTO secure(name,value) values(\'mount_ums_notify_enabled\',\'1\');"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 604
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_11

    .line 606
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 608
    const/16 v0, 0x2e

    .line 611
    :cond_20
    const/16 v1, 0x2e

    if-ne v0, v1, :cond_21

    .line 616
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 618
    :try_start_12
    const-string v0, "DELETE FROM system WHERE name=\'lockscreen.password_type\';"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 619
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_12

    .line 621
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 623
    const/16 v0, 0x2f

    .line 627
    :cond_21
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_22

    .line 632
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 634
    :try_start_13
    const-string v0, "DELETE FROM system WHERE name=\'lockscreen.password_type\';"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 635
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_13

    .line 637
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 639
    const/16 v0, 0x30

    .line 642
    :cond_22
    const/16 v1, 0x30

    if-ne v0, v1, :cond_23

    .line 647
    const/16 v0, 0x31

    .line 650
    :cond_23
    const/16 v1, 0x31

    if-ne v0, v1, :cond_25

    .line 654
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 655
    const/4 v1, 0x0

    .line 657
    :try_start_14
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 659
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadUISoundEffectsSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 660
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_14

    .line 662
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 663
    if-eqz v1, :cond_24

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 666
    :cond_24
    const/16 v0, 0x32

    .line 669
    :cond_25
    const/16 v1, 0x32

    if-ne v0, v1, :cond_26

    .line 673
    const/16 v0, 0x33

    .line 676
    :cond_26
    const/16 v1, 0x33

    if-ne v0, v1, :cond_27

    .line 678
    const/16 v0, 0xb

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "lock_pattern_autolock"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "lock_pattern_visible_pattern"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "lock_pattern_show_error_path"

    aput-object v1, v4, v0

    const/4 v0, 0x3

    const-string v1, "lock_pattern_dotsvisible"

    aput-object v1, v4, v0

    const/4 v0, 0x4

    const-string v1, "lock_pattern_tactile_feedback_enabled"

    aput-object v1, v4, v0

    const/4 v0, 0x5

    const-string v1, "lockscreen.password_type"

    aput-object v1, v4, v0

    const/4 v0, 0x6

    const-string v1, "lockscreen.lockoutattemptdeadline"

    aput-object v1, v4, v0

    const/4 v0, 0x7

    const-string v1, "lockscreen.patterneverchosen"

    aput-object v1, v4, v0

    const/16 v0, 0x8

    const-string v1, "lock_pattern_autolock"

    aput-object v1, v4, v0

    const/16 v0, 0x9

    const-string v1, "lockscreen.lockedoutpermanently"

    aput-object v1, v4, v0

    const/16 v0, 0xa

    const-string v1, "lockscreen.password_salt"

    aput-object v1, v4, v0

    .line 691
    const-string v2, "system"

    const-string v3, "secure"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 692
    const/16 v0, 0x34

    .line 695
    :cond_27
    const/16 v1, 0x34

    if-ne v0, v1, :cond_29

    .line 697
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 698
    const/4 v1, 0x0

    .line 700
    :try_start_15
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 702
    const-string v0, "vibrate_in_silent"

    const v2, 0x7f040019

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 704
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_15

    .line 706
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 707
    if-eqz v1, :cond_28

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 710
    :cond_28
    const/16 v0, 0x35

    .line 713
    :cond_29
    const/16 v1, 0x35

    if-ne v0, v1, :cond_2a

    .line 717
    const/16 v0, 0x36

    .line 720
    :cond_2a
    const/16 v1, 0x36

    if-ne v0, v1, :cond_2b

    .line 724
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 726
    :try_start_16
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeScreenTimeoutFromNever(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 727
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_16

    .line 729
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 732
    const/16 v0, 0x37

    .line 735
    :cond_2b
    const/16 v1, 0x37

    if-ne v0, v1, :cond_2d

    .line 737
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "set_install_location"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "default_install_location"

    aput-object v1, v4, v0

    .line 741
    const-string v2, "system"

    const-string v3, "secure"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 742
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 743
    const/4 v1, 0x0

    .line 745
    :try_start_17
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 747
    const-string v0, "set_install_location"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 748
    const-string v0, "default_install_location"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 750
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_17

    .line 752
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 753
    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 755
    :cond_2c
    const/16 v0, 0x38

    .line 758
    :cond_2d
    const/16 v1, 0x38

    if-ne v0, v1, :cond_2f

    .line 762
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 763
    const/4 v1, 0x0

    .line 765
    :try_start_18
    const-string v0, "DELETE FROM system WHERE name=\'airplane_mode_toggleable_radios\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 767
    const-string v0, "INSERT OR IGNORE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 769
    const-string v0, "airplane_mode_toggleable_radios"

    const v2, 0x7f060001

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 771
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_18

    .line 773
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 774
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 776
    :cond_2e
    const/16 v0, 0x39

    .line 781
    :cond_2f
    const/16 v1, 0x39

    if-ne v0, v1, :cond_31

    .line 787
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 788
    const/4 v1, 0x0

    .line 790
    :try_start_19
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 792
    const-string v0, "accessibility_script_injection"

    const v2, 0x7f04001a

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 794
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 795
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 797
    const-string v0, "accessibility_web_content_key_bindings"

    const v2, 0x7f06000c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 799
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_19

    .line 801
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 802
    if-eqz v1, :cond_30

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 804
    :cond_30
    const/16 v0, 0x3a

    .line 807
    :cond_31
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_33

    .line 809
    const-string v0, "auto_time"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromSystem(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)I

    move-result v0

    .line 810
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 811
    const/4 v1, 0x0

    .line 813
    :try_start_1a
    const-string v2, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 814
    const-string v2, "auto_time_zone"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 816
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1a

    .line 818
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 819
    if-eqz v1, :cond_32

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 821
    :cond_32
    const/16 v0, 0x3b

    .line 824
    :cond_33
    const/16 v1, 0x3b

    if-ne v0, v1, :cond_35

    .line 826
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 827
    const/4 v1, 0x0

    .line 829
    :try_start_1b
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 831
    const-string v0, "user_rotation"

    const v2, 0x7f050007

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 833
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_1b

    .line 835
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 836
    if-eqz v1, :cond_34

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 838
    :cond_34
    const/16 v0, 0x3c

    .line 841
    :cond_35
    const/16 v1, 0x3c

    if-ne v0, v1, :cond_36

    .line 845
    const/16 v0, 0x3d

    .line 848
    :cond_36
    const/16 v1, 0x3d

    if-ne v0, v1, :cond_37

    .line 852
    const/16 v0, 0x3e

    .line 856
    :cond_37
    const/16 v1, 0x3e

    if-ne v0, v1, :cond_38

    .line 860
    const/16 v0, 0x3f

    .line 863
    :cond_38
    const/16 v1, 0x3f

    if-ne v0, v1, :cond_39

    .line 866
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 868
    :try_start_1c
    const-string v0, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 870
    const/16 v0, 0xae

    .line 875
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 878
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1c

    .line 880
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 882
    const/16 v0, 0x40

    .line 885
    :cond_39
    const/16 v1, 0x40

    if-ne v0, v1, :cond_3b

    .line 887
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 888
    const/4 v1, 0x0

    .line 890
    :try_start_1d
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 892
    const-string v0, "long_press_timeout"

    const v2, 0x7f05000a

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadIntegerSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 894
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 895
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1d

    .line 897
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 898
    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 900
    :cond_3a
    const/16 v0, 0x41

    .line 905
    :cond_3b
    const/16 v1, 0x41

    if-ne v0, v1, :cond_3d

    .line 909
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 910
    const/4 v1, 0x0

    .line 912
    :try_start_1e
    const-string v0, "DELETE FROM system WHERE name=\'window_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 914
    const-string v0, "DELETE FROM system WHERE name=\'transition_animation_scale\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 916
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 918
    invoke-direct {p0, v1}, Lcom/android/providers/settings/DatabaseHelper;->loadDefaultAnimationSettings(Landroid/database/sqlite/SQLiteStatement;)V

    .line 919
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_1e

    .line 921
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 922
    if-eqz v1, :cond_3c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 924
    :cond_3c
    const/16 v0, 0x42

    .line 927
    :cond_3d
    const/16 v1, 0x42

    if-ne v0, v1, :cond_3f

    .line 930
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 932
    const/16 v0, 0xa6

    .line 936
    :try_start_1f
    iget-object v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110033

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-nez v1, :cond_3e

    .line 938
    const/16 v0, 0xae

    .line 940
    :cond_3e
    const-string v1, "DELETE FROM system WHERE name=\'mode_ringer_streams_affected\'"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 942
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO system (\'name\', \'value\') values (\'mode_ringer_streams_affected\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 945
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1f

    .line 947
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 949
    const/16 v0, 0x43

    .line 952
    :cond_3f
    const/16 v1, 0x43

    if-ne v0, v1, :cond_41

    .line 954
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 955
    const/4 v1, 0x0

    .line 957
    :try_start_20
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 959
    const-string v0, "touch_exploration_enabled"

    const v2, 0x7f04001c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 961
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 962
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_20

    .line 964
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 965
    if-eqz v1, :cond_40

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 967
    :cond_40
    const/16 v0, 0x44

    .line 970
    :cond_41
    const/16 v1, 0x44

    if-ne v0, v1, :cond_42

    .line 972
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 974
    :try_start_21
    const-string v0, "DELETE FROM system WHERE name=\'notifications_use_ring_volume\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 976
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_21

    .line 978
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 980
    const/16 v0, 0x45

    .line 983
    :cond_42
    const/16 v1, 0x45

    if-ne v0, v1, :cond_43

    .line 985
    iget-object v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 987
    iget-object v1, p0, Lcom/android/providers/settings/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 989
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 991
    :try_start_22
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UPDATE system SET value=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\' "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "WHERE name=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "airplane_mode_radios"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 993
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UPDATE system SET value=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "WHERE name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "airplane_mode_toggleable_radios"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 995
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_22

    .line 997
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 999
    const/16 v0, 0x46

    .line 1002
    :cond_43
    const/16 v1, 0x46

    if-ne v0, v1, :cond_44

    .line 1004
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadBookmarks(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1005
    const/16 v0, 0x47

    .line 1008
    :cond_44
    const/16 v1, 0x47

    if-ne v0, v1, :cond_46

    .line 1010
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1011
    const/4 v1, 0x0

    .line 1013
    :try_start_23
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1015
    const-string v0, "speak_password"

    const v2, 0x7f04001b

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1017
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_23

    .line 1019
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1020
    if-eqz v1, :cond_45

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1022
    :cond_45
    const/16 v0, 0x48

    .line 1025
    :cond_46
    const/16 v1, 0x48

    if-ne v0, v1, :cond_48

    .line 1027
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1028
    const/4 v1, 0x0

    .line 1030
    :try_start_24
    const-string v0, "INSERT OR REPLACE INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1032
    const-string v0, "vibrate_in_silent"

    const v2, 0x7f040019

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1034
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_24

    .line 1036
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1037
    if-eqz v1, :cond_47

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1039
    :cond_47
    const/16 v0, 0x49

    .line 1042
    :cond_48
    const/16 v1, 0x49

    if-ne v0, v1, :cond_49

    .line 1043
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->upgradeVibrateSettingFromNone(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1044
    const/16 v0, 0x4a

    .line 1047
    :cond_49
    const/16 v1, 0x4a

    if-ne v0, v1, :cond_4b

    .line 1049
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1050
    const/4 v1, 0x0

    .line 1052
    :try_start_25
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1053
    const-string v0, "accessibility_script_injection_url"

    const v2, 0x7f06000d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1055
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_25

    .line 1057
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1058
    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1060
    :cond_4a
    const/16 v0, 0x4b

    .line 1062
    :cond_4b
    const/16 v1, 0x4b

    if-ne v0, v1, :cond_4f

    .line 1063
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1064
    const/4 v9, 0x0

    .line 1065
    const/4 v8, 0x0

    .line 1067
    :try_start_26
    const-string v1, "secure"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const/4 v0, 0x1

    const-string v3, "value"

    aput-object v3, v2, v0

    const-string v3, "name=\'lockscreen.disabled\'"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_26

    move-result-object v1

    .line 1071
    if-eqz v1, :cond_4c

    :try_start_27
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_99

    .line 1072
    :cond_4c
    const-string v0, "INSERT INTO system(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_39

    move-result-object v2

    .line 1074
    :try_start_28
    const-string v0, "lockscreen.disabled"

    const v3, 0x7f040016

    invoke-direct {p0, v2, v0, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1077
    :goto_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_3a

    .line 1079
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1080
    if-eqz v1, :cond_4d

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1081
    :cond_4d
    if-eqz v2, :cond_4e

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1083
    :cond_4e
    const/16 v0, 0x4c

    .line 1088
    :cond_4f
    const/16 v1, 0x4c

    if-ne v0, v1, :cond_50

    .line 1090
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1092
    :try_start_29
    const-string v0, "DELETE FROM system WHERE name=\'vibrate_in_silent\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1094
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_27

    .line 1096
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1099
    const/16 v0, 0x4d

    .line 1102
    :cond_50
    const/16 v1, 0x4d

    if-ne v0, v1, :cond_51

    .line 1104
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->loadVibrateWhenRingingSetting(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1106
    const/16 v0, 0x4e

    .line 1109
    :cond_51
    const/16 v1, 0x4e

    if-ne v0, v1, :cond_53

    .line 1111
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1112
    const/4 v1, 0x0

    .line 1114
    :try_start_2a
    const-string v0, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1116
    const-string v0, "accessibility_script_injection_url"

    const v2, 0x7f06000d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1118
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_28

    .line 1120
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1121
    if-eqz v1, :cond_52

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1123
    :cond_52
    const/16 v0, 0x4f

    .line 1126
    :cond_53
    const/16 v1, 0x4f

    if-ne v0, v1, :cond_55

    .line 1143
    const-string v0, "secure"

    const-string v1, "accessibility_enabled"

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8d

    const/4 v0, 0x1

    .line 1145
    :goto_3
    const-string v1, "secure"

    const-string v2, "touch_exploration_enabled"

    const/4 v3, 0x0

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_8e

    const/4 v1, 0x1

    .line 1147
    :goto_4
    if-eqz v0, :cond_54

    if-eqz v1, :cond_54

    .line 1148
    const-string v0, "secure"

    const-string v1, "enabled_accessibility_services"

    const-string v2, ""

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1150
    const-string v1, "secure"

    const-string v2, "touch_exploration_granted_accessibility_services"

    const-string v3, ""

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->getStringValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1152
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_54

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_54

    .line 1154
    const/4 v1, 0x0

    .line 1156
    :try_start_2b
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1157
    const-string v2, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1159
    const-string v2, "touch_exploration_granted_accessibility_services"

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1162
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_29

    .line 1164
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1165
    if-eqz v1, :cond_54

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1169
    :cond_54
    const/16 v0, 0x50

    .line 1174
    :cond_55
    const/16 v1, 0x50

    if-ne v0, v1, :cond_57

    .line 1176
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1177
    const/4 v1, 0x0

    .line 1179
    :try_start_2c
    const-string v0, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1181
    const-string v0, "screensaver_enabled"

    const v2, 0x1110045

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1183
    const-string v0, "screensaver_activate_on_dock"

    const v2, 0x1110046

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1185
    const-string v0, "screensaver_activate_on_sleep"

    const v2, 0x1110047

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1187
    const-string v0, "screensaver_components"

    const v2, 0x104002c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1189
    const-string v0, "screensaver_default_component"

    const v2, 0x104002c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1192
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_2a

    .line 1194
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1195
    if-eqz v1, :cond_56

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1197
    :cond_56
    const/16 v0, 0x51

    .line 1200
    :cond_57
    const/16 v1, 0x51

    if-ne v0, v1, :cond_59

    .line 1202
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1203
    const/4 v1, 0x0

    .line 1205
    :try_start_2d
    const-string v0, "INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1207
    const-string v0, "package_verifier_enable"

    const v2, 0x7f04000a

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1209
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_2b

    .line 1211
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1212
    if-eqz v1, :cond_58

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1214
    :cond_58
    const/16 v0, 0x52

    .line 1217
    :cond_59
    const/16 v1, 0x52

    if-ne v0, v1, :cond_5b

    .line 1219
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_5a

    .line 1221
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1222
    const/4 v6, 0x0

    .line 1226
    :try_start_2e
    invoke-direct {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->createGlobalTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1227
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v4

    .line 1228
    const-string v2, "system"

    const-string v3, "global"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1229
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v4

    .line 1230
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1232
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_2c

    .line 1234
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1235
    if-eqz v6, :cond_5a

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1238
    :cond_5a
    const/16 v0, 0x53

    .line 1241
    :cond_5b
    const/16 v1, 0x53

    if-ne v0, v1, :cond_5d

    .line 1245
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1246
    const/4 v1, 0x0

    .line 1248
    :try_start_2f
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1249
    const-string v0, "accessibility_display_magnification_enabled"

    const v2, 0x7f04001d

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1252
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1253
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1254
    const-string v0, "accessibility_display_magnification_scale"

    const v2, 0x7f070002

    const/4 v3, 0x1

    invoke-direct {p0, v1, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->loadFractionSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;II)V

    .line 1256
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1257
    const-string v0, "INSERT INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1258
    const-string v0, "accessibility_display_magnification_auto_update"

    const v2, 0x7f04001e

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1262
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_2d

    .line 1264
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1265
    if-eqz v1, :cond_5c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1267
    :cond_5c
    const/16 v0, 0x54

    .line 1270
    :cond_5d
    const/16 v1, 0x54

    if-ne v0, v1, :cond_5f

    .line 1271
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_5e

    .line 1272
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1273
    const/4 v6, 0x0

    .line 1277
    const/4 v0, 0x6

    :try_start_30
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "adb_enabled"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "bluetooth_on"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "data_roaming"

    aput-object v1, v4, v0

    const/4 v0, 0x3

    const-string v1, "device_provisioned"

    aput-object v1, v4, v0

    const/4 v0, 0x4

    const-string v1, "install_non_market_apps"

    aput-object v1, v4, v0

    const/4 v0, 0x5

    const-string v1, "usb_mass_storage_enabled"

    aput-object v1, v4, v0

    .line 1285
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1286
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_2e

    .line 1288
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1289
    if-eqz v6, :cond_5e

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1292
    :cond_5e
    const/16 v0, 0x55

    .line 1295
    :cond_5f
    const/16 v1, 0x55

    if-ne v0, v1, :cond_61

    .line 1296
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_60

    .line 1297
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1301
    const/4 v0, 0x1

    :try_start_31
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "stay_on_while_plugged_in"

    aput-object v1, v4, v0

    .line 1302
    const-string v2, "system"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1304
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_2f

    .line 1306
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1309
    :cond_60
    const/16 v0, 0x56

    .line 1312
    :cond_61
    const/16 v1, 0x56

    if-ne v0, v1, :cond_63

    .line 1313
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_62

    .line 1314
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1316
    const/4 v0, 0x3

    :try_start_32
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "package_verifier_enable"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "verifier_timeout"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "verifier_default_response"

    aput-object v1, v4, v0

    .line 1321
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1323
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_30

    .line 1325
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1328
    :cond_62
    const/16 v0, 0x57

    .line 1331
    :cond_63
    const/16 v1, 0x57

    if-ne v0, v1, :cond_65

    .line 1332
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_64

    .line 1333
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1335
    const/4 v0, 0x3

    :try_start_33
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "data_stall_alarm_non_aggressive_delay_in_ms"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "data_stall_alarm_aggressive_delay_in_ms"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "gprs_register_check_period_ms"

    aput-object v1, v4, v0

    .line 1340
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1342
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_31

    .line 1344
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1347
    :cond_64
    const/16 v0, 0x58

    .line 1350
    :cond_65
    const/16 v1, 0x58

    if-ne v0, v1, :cond_67

    .line 1351
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_66

    .line 1352
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1354
    const/16 v0, 0x1f

    :try_start_34
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "battery_discharge_duration_threshold"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "battery_discharge_threshold"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "send_action_app_error"

    aput-object v1, v4, v0

    const/4 v0, 0x3

    const-string v1, "dropbox_age_seconds"

    aput-object v1, v4, v0

    const/4 v0, 0x4

    const-string v1, "dropbox_max_files"

    aput-object v1, v4, v0

    const/4 v0, 0x5

    const-string v1, "dropbox_quota_kb"

    aput-object v1, v4, v0

    const/4 v0, 0x6

    const-string v1, "dropbox_quota_percent"

    aput-object v1, v4, v0

    const/4 v0, 0x7

    const-string v1, "dropbox_reserve_percent"

    aput-object v1, v4, v0

    const/16 v0, 0x8

    const-string v1, "dropbox:"

    aput-object v1, v4, v0

    const/16 v0, 0x9

    const-string v1, "logcat_for_"

    aput-object v1, v4, v0

    const/16 v0, 0xa

    const-string v1, "sys_free_storage_log_interval"

    aput-object v1, v4, v0

    const/16 v0, 0xb

    const-string v1, "disk_free_change_reporting_threshold"

    aput-object v1, v4, v0

    const/16 v0, 0xc

    const-string v1, "sys_storage_threshold_percentage"

    aput-object v1, v4, v0

    const/16 v0, 0xd

    const-string v1, "sys_storage_threshold_max_bytes"

    aput-object v1, v4, v0

    const/16 v0, 0xe

    const-string v1, "sys_storage_full_threshold_bytes"

    aput-object v1, v4, v0

    const/16 v0, 0xf

    const-string v1, "sync_max_retry_delay_in_seconds"

    aput-object v1, v4, v0

    const/16 v0, 0x10

    const-string v1, "connectivity_change_delay"

    aput-object v1, v4, v0

    const/16 v0, 0x11

    const-string v1, "captive_portal_detection_enabled"

    aput-object v1, v4, v0

    const/16 v0, 0x12

    const-string v1, "captive_portal_server"

    aput-object v1, v4, v0

    const/16 v0, 0x13

    const-string v1, "nsd_on"

    aput-object v1, v4, v0

    const/16 v0, 0x14

    const-string v1, "set_install_location"

    aput-object v1, v4, v0

    const/16 v0, 0x15

    const-string v1, "default_install_location"

    aput-object v1, v4, v0

    const/16 v0, 0x16

    const-string v1, "inet_condition_debounce_up_delay"

    aput-object v1, v4, v0

    const/16 v0, 0x17

    const-string v1, "inet_condition_debounce_down_delay"

    aput-object v1, v4, v0

    const/16 v0, 0x18

    const-string v1, "read_external_storage_enforced_default"

    aput-object v1, v4, v0

    const/16 v0, 0x19

    const-string v1, "http_proxy"

    aput-object v1, v4, v0

    const/16 v0, 0x1a

    const-string v1, "global_http_proxy_host"

    aput-object v1, v4, v0

    const/16 v0, 0x1b

    const-string v1, "global_http_proxy_port"

    aput-object v1, v4, v0

    const/16 v0, 0x1c

    const-string v1, "global_http_proxy_exclusion_list"

    aput-object v1, v4, v0

    const/16 v0, 0x1d

    const-string v1, "set_global_http_proxy"

    aput-object v1, v4, v0

    const/16 v0, 0x1e

    const-string v1, "default_dns_server"

    aput-object v1, v4, v0

    .line 1387
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1388
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_32

    .line 1390
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1393
    :cond_66
    const/16 v0, 0x59

    .line 1396
    :cond_67
    const/16 v1, 0x59

    if-ne v0, v1, :cond_69

    .line 1397
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_68

    .line 1398
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1400
    const/4 v0, 0x3

    :try_start_35
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "bluetooth_headset_priority_"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "bluetooth_a2dp_sink_priority_"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "bluetooth_input_device_priority_"

    aput-object v2, v0, v1

    .line 1406
    const-string v1, "secure"

    const-string v2, "global"

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->movePrefixedSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1408
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_33

    .line 1410
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1413
    :cond_68
    const/16 v0, 0x5a

    .line 1416
    :cond_69
    const/16 v1, 0x5a

    if-ne v0, v1, :cond_6b

    .line 1417
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_6a

    .line 1418
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1420
    const/16 v0, 0xb

    :try_start_36
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "window_animation_scale"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "transition_animation_scale"

    aput-object v1, v4, v0

    const/4 v0, 0x2

    const-string v1, "animator_duration_scale"

    aput-object v1, v4, v0

    const/4 v0, 0x3

    const-string v1, "fancy_ime_animations"

    aput-object v1, v4, v0

    const/4 v0, 0x4

    const-string v1, "compatibility_mode"

    aput-object v1, v4, v0

    const/4 v0, 0x5

    const-string v1, "emergency_tone"

    aput-object v1, v4, v0

    const/4 v0, 0x6

    const-string v1, "call_auto_retry"

    aput-object v1, v4, v0

    const/4 v0, 0x7

    const-string v1, "debug_app"

    aput-object v1, v4, v0

    const/16 v0, 0x8

    const-string v1, "wait_for_debugger"

    aput-object v1, v4, v0

    const/16 v0, 0x9

    const-string v1, "show_processes"

    aput-object v1, v4, v0

    const/16 v0, 0xa

    const-string v1, "always_finish_activities"

    aput-object v1, v4, v0

    .line 1433
    const/4 v0, 0x2

    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "preferred_network_mode"

    aput-object v1, v6, v0

    const/4 v0, 0x1

    const-string v1, "preferred_cdma_subscription"

    aput-object v1, v6, v0

    .line 1438
    const-string v2, "system"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1439
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1441
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_34

    .line 1443
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1446
    :cond_6a
    const/16 v0, 0x5b

    .line 1449
    :cond_6b
    const/16 v1, 0x5b

    if-ne v0, v1, :cond_6d

    .line 1450
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_6c

    .line 1451
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1454
    const/4 v0, 0x1

    :try_start_37
    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "mode_ringer"

    aput-object v1, v4, v0

    .line 1455
    const-string v2, "system"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1457
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_35

    .line 1459
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1462
    :cond_6c
    const/16 v0, 0x5c

    .line 1465
    :cond_6d
    const/16 v1, 0x5c

    if-ne v0, v1, :cond_6f

    .line 1466
    const/4 v1, 0x0

    .line 1468
    :try_start_38
    const-string v0, "INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1470
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_95

    .line 1474
    const-string v0, "global"

    const-string v2, "device_provisioned"

    const/4 v3, 0x0

    invoke-direct {p0, p1, v0, v2, v3}, Lcom/android/providers/settings/DatabaseHelper;->getIntValueFromTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 1476
    const-string v2, "user_setup_complete"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v1, v2, v0}, Lcom/android/providers/settings/DatabaseHelper;->loadSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_36

    .line 1484
    :goto_5
    if-eqz v1, :cond_6e

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1486
    :cond_6e
    const/16 v0, 0x5d

    .line 1489
    :cond_6f
    const/16 v1, 0x5d

    if-ne v0, v1, :cond_71

    .line 1491
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_70

    .line 1492
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1493
    const/4 v6, 0x0

    .line 1496
    :try_start_39
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSystemGlobalKeys:Ljava/util/HashSet;

    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v4

    .line 1497
    const-string v2, "system"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1498
    sget-object v0, Lcom/android/providers/settings/SettingsProvider;->sSecureGlobalKeys:Ljava/util/HashSet;

    invoke-direct {p0, v0}, Lcom/android/providers/settings/DatabaseHelper;->hashsetToStringArray(Ljava/util/HashSet;)[Ljava/lang/String;

    move-result-object v4

    .line 1499
    const-string v2, "secure"

    const-string v3, "global"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/providers/settings/DatabaseHelper;->moveSettingsToNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 1501
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_37

    .line 1503
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1504
    if-eqz v6, :cond_70

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1507
    :cond_70
    const/16 v0, 0x5e

    .line 1510
    :cond_71
    const/16 v1, 0x5e

    if-ne v0, v1, :cond_73

    .line 1512
    iget v0, p0, Lcom/android/providers/settings/DatabaseHelper;->mUserHandle:I

    if-nez v0, :cond_72

    .line 1513
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1514
    const/4 v1, 0x0

    .line 1516
    :try_start_3a
    const-string v0, "INSERT OR REPLACE INTO global(name,value) VALUES(?,?);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 1518
    const-string v0, "wireless_charging_started_sound"

    const v2, 0x7f06000b

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadStringSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V

    .line 1520
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_38

    .line 1522
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1523
    if-eqz v1, :cond_72

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 1526
    :cond_72
    const/16 v0, 0x5f

    .line 1531
    :cond_73
    if-eq v0, p3, :cond_74

    .line 1532
    const-string v1, "SettingsProvider"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got stuck trying to upgrade from version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", must wipe the settings provider"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1534
    const-string v1, "DROP TABLE IF EXISTS global"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1535
    const-string v1, "DROP TABLE IF EXISTS globalIndex1"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1536
    const-string v1, "DROP TABLE IF EXISTS system"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1537
    const-string v1, "DROP INDEX IF EXISTS systemIndex1"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1538
    const-string v1, "DROP TABLE IF EXISTS secure"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1539
    const-string v1, "DROP INDEX IF EXISTS secureIndex1"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1540
    const-string v1, "DROP TABLE IF EXISTS gservices"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1541
    const-string v1, "DROP INDEX IF EXISTS gservicesIndex1"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1542
    const-string v1, "DROP TABLE IF EXISTS bluetooth_devices"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1543
    const-string v1, "DROP TABLE IF EXISTS bookmarks"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1544
    const-string v1, "DROP INDEX IF EXISTS bookmarksIndex1"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1545
    const-string v1, "DROP INDEX IF EXISTS bookmarksIndex2"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1546
    const-string v1, "DROP TABLE IF EXISTS favorites"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1547
    invoke-virtual {p0, p1}, Lcom/android/providers/settings/DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1550
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1551
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO secure(name,value) values(\'wiped_db_reason\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1554
    :cond_74
    return-void

    .line 245
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 260
    :catchall_1
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 272
    :catchall_2
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 284
    :catchall_3
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 346
    :catchall_4
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 364
    :catchall_5
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 386
    :catchall_6
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 387
    if-eqz v1, :cond_75

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_75
    throw v0

    .line 404
    :catchall_7
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 417
    :catchall_8
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 431
    :catchall_9
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 432
    if-eqz v1, :cond_76

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_76
    throw v0

    .line 460
    :catchall_a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 475
    :catchall_b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 476
    if-eqz v1, :cond_77

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_77
    throw v0

    .line 484
    :cond_78
    :try_start_3b
    const-string v0, "0"
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_c

    goto/16 :goto_1

    .line 490
    :catchall_c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 517
    :catchall_d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 518
    if-eqz v1, :cond_79

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_79
    throw v0

    .line 537
    :catchall_e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 538
    if-eqz v1, :cond_7a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7a
    throw v0

    .line 556
    :catchall_f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 557
    if-eqz v1, :cond_7b

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7b
    throw v0

    .line 575
    :catchall_10
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 576
    if-eqz v1, :cond_7c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7c
    throw v0

    .line 606
    :catchall_11
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 621
    :catchall_12
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 637
    :catchall_13
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 662
    :catchall_14
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 663
    if-eqz v1, :cond_7d

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7d
    throw v0

    .line 706
    :catchall_15
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 707
    if-eqz v1, :cond_7e

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7e
    throw v0

    .line 729
    :catchall_16
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 752
    :catchall_17
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 753
    if-eqz v1, :cond_7f

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_7f
    throw v0

    .line 773
    :catchall_18
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 774
    if-eqz v1, :cond_80

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_80
    throw v0

    .line 801
    :catchall_19
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 802
    if-eqz v1, :cond_81

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_81
    throw v0

    .line 818
    :catchall_1a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 819
    if-eqz v1, :cond_82

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_82
    throw v0

    .line 835
    :catchall_1b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 836
    if-eqz v1, :cond_83

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_83
    throw v0

    .line 880
    :catchall_1c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 897
    :catchall_1d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 898
    if-eqz v1, :cond_84

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_84
    throw v0

    .line 921
    :catchall_1e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 922
    if-eqz v1, :cond_85

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_85
    throw v0

    .line 947
    :catchall_1f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 964
    :catchall_20
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 965
    if-eqz v1, :cond_86

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_86
    throw v0

    .line 978
    :catchall_21
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 997
    :catchall_22
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1019
    :catchall_23
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1020
    if-eqz v1, :cond_87

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_87
    throw v0

    .line 1036
    :catchall_24
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1037
    if-eqz v1, :cond_88

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_88
    throw v0

    .line 1057
    :catchall_25
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1058
    if-eqz v1, :cond_89

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_89
    throw v0

    .line 1079
    :catchall_26
    move-exception v0

    move-object v1, v8

    move-object v2, v9

    :goto_6
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1080
    if-eqz v1, :cond_8a

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1081
    :cond_8a
    if-eqz v2, :cond_8b

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8b
    throw v0

    .line 1096
    :catchall_27
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1120
    :catchall_28
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1121
    if-eqz v1, :cond_8c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8c
    throw v0

    .line 1143
    :cond_8d
    const/4 v0, 0x0

    goto/16 :goto_3

    .line 1145
    :cond_8e
    const/4 v1, 0x0

    goto/16 :goto_4

    .line 1164
    :catchall_29
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1165
    if-eqz v1, :cond_8f

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_8f
    throw v0

    .line 1194
    :catchall_2a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1195
    if-eqz v1, :cond_90

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_90
    throw v0

    .line 1211
    :catchall_2b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1212
    if-eqz v1, :cond_91

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_91
    throw v0

    .line 1234
    :catchall_2c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1235
    if-eqz v6, :cond_92

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_92
    throw v0

    .line 1264
    :catchall_2d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1265
    if-eqz v1, :cond_93

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_93
    throw v0

    .line 1288
    :catchall_2e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1289
    if-eqz v6, :cond_94

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_94
    throw v0

    .line 1306
    :catchall_2f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1325
    :catchall_30
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1344
    :catchall_31
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1390
    :catchall_32
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1410
    :catchall_33
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1443
    :catchall_34
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1459
    :catchall_35
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1480
    :cond_95
    :try_start_3c
    const-string v0, "user_setup_complete"

    const v2, 0x7f040022

    invoke-direct {p0, v1, v0, v2}, Lcom/android/providers/settings/DatabaseHelper;->loadBooleanSetting(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;I)V
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_36

    goto/16 :goto_5

    .line 1484
    :catchall_36
    move-exception v0

    if-eqz v1, :cond_96

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_96
    throw v0

    .line 1503
    :catchall_37
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1504
    if-eqz v6, :cond_97

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_97
    throw v0

    .line 1522
    :catchall_38
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1523
    if-eqz v1, :cond_98

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_98
    throw v0

    .line 1079
    :catchall_39
    move-exception v0

    move-object v2, v9

    goto/16 :goto_6

    :catchall_3a
    move-exception v0

    goto/16 :goto_6

    :cond_99
    move-object v2, v9

    goto/16 :goto_2

    :cond_9a
    move v0, p2

    goto/16 :goto_0
.end method
