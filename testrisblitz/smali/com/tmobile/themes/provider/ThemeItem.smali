.class public Lcom/tmobile/themes/provider/ThemeItem;
.super Lcom/tmobile/themes/provider/AbstractDAOItem;
.source "ThemeItem.java"


# static fields
.field private static final CREATOR:Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tmobile/themes/provider/AbstractDAOItem$Creator",
            "<",
            "Lcom/tmobile/themes/provider/ThemeItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mColumnAuthor:I

.field private mColumnHasHostDensity:I

.field private mColumnHasThemePackageScope:I

.field private mColumnId:I

.field private mColumnIsApplied:I

.field private mColumnIsDRM:I

.field private mColumnIsSystem:I

.field private mColumnLockWallpaperUri:I

.field private mColumnName:I

.field private mColumnNotifRingtoneName:I

.field private mColumnNotifRingtoneUri:I

.field private mColumnPreviewUri:I

.field private mColumnRingtoneName:I

.field private mColumnRingtoneUri:I

.field private mColumnStyleName:I

.field private mColumnThemeId:I

.field private mColumnThemePackage:I

.field private mColumnThumbnailUri:I

.field private mColumnWallpaperName:I

.field private mColumnWallpaperUri:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lcom/tmobile/themes/provider/ThemeItem$1;

    invoke-direct {v0}, Lcom/tmobile/themes/provider/ThemeItem$1;-><init>()V

    sput-object v0, Lcom/tmobile/themes/provider/ThemeItem;->CREATOR:Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/tmobile/themes/provider/AbstractDAOItem;-><init>(Landroid/database/Cursor;)V

    .line 92
    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnId:I

    .line 93
    const-string v0, "theme_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnThemeId:I

    .line 94
    const-string v0, "theme_package"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnThemePackage:I

    .line 95
    const-string v0, "name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnName:I

    .line 96
    const-string v0, "style_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnStyleName:I

    .line 97
    const-string v0, "author"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnAuthor:I

    .line 98
    const-string v0, "is_drm"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnIsDRM:I

    .line 99
    const-string v0, "wallpaper_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnWallpaperName:I

    .line 100
    const-string v0, "wallpaper_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnWallpaperUri:I

    .line 101
    const-string v0, "lock_wallpaper_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnLockWallpaperUri:I

    .line 102
    const-string v0, "ringtone_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnRingtoneName:I

    .line 103
    const-string v0, "ringtone_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnRingtoneUri:I

    .line 104
    const-string v0, "notif_ringtone_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnNotifRingtoneName:I

    .line 105
    const-string v0, "notif_ringtone_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnNotifRingtoneUri:I

    .line 106
    const-string v0, "thumbnail_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnThumbnailUri:I

    .line 107
    const-string v0, "system"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnIsSystem:I

    .line 108
    const-string v0, "is_applied"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnIsApplied:I

    .line 109
    const-string v0, "preview_uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnPreviewUri:I

    .line 110
    const-string v0, "has_host_density"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnHasHostDensity:I

    .line 111
    const-string v0, "has_theme_package_scope"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnHasThemePackageScope:I

    .line 112
    return-void
.end method

.method public static getInstance(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/ThemeItem;
    .locals 1
    .parameter "c"

    .prologue
    .line 84
    sget-object v0, Lcom/tmobile/themes/provider/ThemeItem;->CREATOR:Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;

    invoke-virtual {v0, p0}, Lcom/tmobile/themes/provider/AbstractDAOItem$Creator;->newInstance(Landroid/database/Cursor;)Lcom/tmobile/themes/provider/AbstractDAOItem;

    move-result-object v0

    check-cast v0, Lcom/tmobile/themes/provider/ThemeItem;

    return-object v0
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnAuthor:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnName:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnThemePackage:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPreviewUri(I)Landroid/net/Uri;
    .locals 4
    .parameter "orientation"

    .prologue
    .line 251
    iget-object v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v2, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnPreviewUri:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/tmobile/themes/provider/ThemeItem;->parseUriNullSafe(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 252
    .local v0, uri:Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 253
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "orientation"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 256
    :cond_0
    return-object v0
.end method

.method public getThemeId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnThemeId:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUri(Landroid/content/Context;)Landroid/net/Uri;
    .locals 2
    .parameter "context"

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->getThemeId()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/tmobile/themes/provider/Themes;->getThemeUri(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public hasHostDensity()Z
    .locals 2

    .prologue
    .line 286
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnHasHostDensity:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasThemePackageScope()Z
    .locals 2

    .prologue
    .line 294
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnHasThemePackageScope:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDRMProtected()Z
    .locals 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/tmobile/themes/provider/ThemeItem;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lcom/tmobile/themes/provider/ThemeItem;->mColumnIsDRM:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 316
    .local v0, b:Ljava/lang/StringBuilder;
    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 317
    const-string v1, "pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    const-string v1, "themeId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->getThemeId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    const-string v1, "name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    const-string v1, "drm="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tmobile/themes/provider/ThemeItem;->isDRMProtected()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 321
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
