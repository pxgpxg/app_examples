.class public interface abstract Lcom/tmobile/themes/provider/Themes$ThemeColumns;
.super Ljava/lang/Object;
.source "Themes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themes/provider/Themes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ThemeColumns"
.end annotation


# static fields
.field public static final CONTENT_PLURAL_URI:Landroid/net/Uri;

.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 177
    const-string v0, "content://com.tmobile.thememanager.themes/theme"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/tmobile/themes/provider/Themes$ThemeColumns;->CONTENT_URI:Landroid/net/Uri;

    .line 180
    const-string v0, "content://com.tmobile.thememanager.themes/themes"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/tmobile/themes/provider/Themes$ThemeColumns;->CONTENT_PLURAL_URI:Landroid/net/Uri;

    return-void
.end method
