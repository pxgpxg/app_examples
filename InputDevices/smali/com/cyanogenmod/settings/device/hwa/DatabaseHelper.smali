.class public Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# instance fields
.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 29
    const-string v0, "package_database"

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 30
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->mContext:Landroid/content/Context;

    .line 31
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 35
    const-string v0, "CREATE TABLE IF NOT EXISTS packages ( _id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, application_label VARCHAR(50), package_name VARCHAR(100) UNIQUE, hwa_enabled VARCHAR(10), system_app VARCHAR(10))"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 36
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/cyanogenmod/settings/device/hwa/DatabaseTools;->scanPackages(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/Context;)V

    .line 37
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 7
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    const/4 v6, 0x1

    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->mContext:Landroid/content/Context;

    const v2, 0x7f040007

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 45
    const-string v0, "DROP TABLE IF EXISTS packages"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/settings/device/hwa/DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 47
    return-void
.end method
