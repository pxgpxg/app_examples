.class public Lcom/tmobile/themechooser/ThemeChooser;
.super Landroid/app/Activity;
.source "ThemeChooser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tmobile/themechooser/ThemeChooser$ViewHolder;,
        Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAdapter:Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

.field private final mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

.field private mGallery:Landroid/widget/Gallery;

.field private final mItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mShowUninstallIcon:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    const-class v0, Lcom/tmobile/themechooser/ThemeChooser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tmobile/themechooser/ThemeChooser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 61
    new-instance v0, Lcom/tmobile/themechooser/ChangeThemeHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/tmobile/themechooser/ChangeThemeHelper;-><init>(Landroid/app/Activity;I)V

    iput-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mShowUninstallIcon:Z

    .line 240
    new-instance v0, Lcom/tmobile/themechooser/ThemeChooser$2;

    invoke-direct {v0, p0}, Lcom/tmobile/themechooser/ThemeChooser$2;-><init>(Lcom/tmobile/themechooser/ThemeChooser;)V

    iput-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 291
    return-void
.end method

.method static synthetic access$000(Lcom/tmobile/themechooser/ThemeChooser;)Landroid/widget/Gallery;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    return-object v0
.end method

.method static synthetic access$100(Lcom/tmobile/themechooser/ThemeChooser;Lcom/tmobile/themes/provider/ThemeItem;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/tmobile/themechooser/ThemeChooser;->doApply(Lcom/tmobile/themes/provider/ThemeItem;)V

    return-void
.end method

.method static synthetic access$202(Lcom/tmobile/themechooser/ThemeChooser;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/tmobile/themechooser/ThemeChooser;->mShowUninstallIcon:Z

    return p1
.end method

.method private doApply(Lcom/tmobile/themes/provider/ThemeItem;)V
    .locals 4
    .parameter "item"

    .prologue
    .line 255
    invoke-virtual {p1, p0}, Lcom/tmobile/themes/provider/ThemeItem;->getUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    .line 256
    .local v0, uri:Landroid/net/Uri;
    sget-object v1, Lcom/tmobile/themechooser/ThemeChooser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending request to change to \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/tmobile/themes/provider/ThemeItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {p1}, Lcom/tmobile/themes/provider/ThemeItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/tmobile/themechooser/ChangeThemeHelper;->beginChange(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x7f04

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 259
    invoke-static {p0, v0}, Lcom/tmobile/themes/provider/Themes;->changeStyle(Landroid/content/Context;Landroid/net/Uri;)V

    .line 263
    :goto_0
    return-void

    .line 261
    :cond_0
    invoke-static {p0, v0}, Lcom/tmobile/themes/provider/Themes;->changeTheme(Landroid/content/Context;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method private inflateActivity()V
    .locals 2

    .prologue
    .line 89
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/tmobile/themechooser/ThemeChooser;->setContentView(I)V

    .line 91
    const/high16 v0, 0x7f07

    invoke-virtual {p0, v0}, Lcom/tmobile/themechooser/ThemeChooser;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    iput-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    .line 92
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser;->mAdapter:Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 93
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser;->mItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 94
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .parameter "newConfig"

    .prologue
    .line 98
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 102
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v2, p1}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnConfigurationChanged(Landroid/content/res/Configuration;)Z

    move-result v0

    .line 106
    .local v0, finishing:Z
    if-nez v0, :cond_0

    .line 110
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 111
    .local v1, state:Landroid/os/Bundle;
    invoke-virtual {p0, v1}, Lcom/tmobile/themechooser/ThemeChooser;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 116
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 117
    invoke-direct {p0}, Lcom/tmobile/themechooser/ThemeChooser;->inflateActivity()V

    .line 121
    invoke-virtual {p0, v1}, Lcom/tmobile/themechooser/ThemeChooser;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 123
    .end local v1           #state:Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "icicle"

    .prologue
    const/4 v4, 0x1

    .line 74
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 76
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.tmobile.intent.extra.theme.EXISTING_URI"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 77
    .local v1, currentTheme:Landroid/net/Uri;
    new-instance v2, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

    invoke-direct {v2, p0}, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mAdapter:Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

    .line 78
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mAdapter:Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

    invoke-virtual {v2, v4, v1}, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;->setUseAutomaticMarking(ZLandroid/net/Uri;)V

    .line 80
    invoke-direct {p0}, Lcom/tmobile/themechooser/ThemeChooser;->inflateActivity()V

    .line 82
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 83
    .local v0, actionBar:Landroid/app/ActionBar;
    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 84
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    iget-object v3, p0, Lcom/tmobile/themechooser/ThemeChooser;->mAdapter:Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;

    invoke-virtual {v3}, Lcom/tmobile/themechooser/ThemeChooser$ThemeChooserAdapter;->getMarkedPosition()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Gallery;->setSelection(I)V

    .line 85
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v2}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnCreate()V

    .line 86
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    const v1, 0x7f06000b

    .line 140
    packed-switch p1, :pswitch_data_0

    .line 161
    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v1, p1}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    :goto_0
    return-object v1

    .line 142
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 143
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 144
    const v1, 0x7f06000c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 145
    const v1, 0x7f06000e

    new-instance v2, Lcom/tmobile/themechooser/ThemeChooser$1;

    invoke-direct {v2, p0}, Lcom/tmobile/themechooser/ThemeChooser$1;-><init>(Lcom/tmobile/themechooser/ThemeChooser;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 152
    const v1, 0x7f06000f

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 153
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 155
    .end local v0           #builder:Landroid/app/AlertDialog$Builder;
    :pswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 156
    .restart local v0       #builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 157
    const v1, 0x7f06000d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 158
    const v1, 0x104000a

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 159
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 140
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const/4 v4, 0x6

    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 183
    const/4 v0, 0x1

    const v1, 0x7f060001

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080051

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 186
    const v0, 0x7f060002

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108003c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 189
    const/4 v0, 0x3

    const v1, 0x7f060003

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080041

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 192
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 12
    .parameter "item"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 197
    iget-object v8, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    invoke-virtual {v8}, Landroid/widget/Gallery;->getSelectedItemPosition()I

    move-result v5

    .line 198
    .local v5, selectedPos:I
    iget-object v8, p0, Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;

    invoke-virtual {v8, v5}, Landroid/widget/Gallery;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/tmobile/themes/provider/ThemeItem;

    .line 199
    .local v6, theme:Lcom/tmobile/themes/provider/ThemeItem;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    .line 237
    :goto_0
    return v10

    .line 201
    :sswitch_0
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->finish()V

    goto :goto_0

    .line 204
    :sswitch_1
    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->hasHostDensity()Z

    move-result v8

    if-nez v8, :cond_0

    .line 205
    invoke-virtual {p0, v10}, Lcom/tmobile/themechooser/ThemeChooser;->showDialog(I)V

    goto :goto_0

    .line 208
    :cond_0
    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->hasThemePackageScope()Z

    move-result v8

    if-nez v8, :cond_1

    .line 209
    const/4 v8, 0x2

    invoke-virtual {p0, v8}, Lcom/tmobile/themechooser/ThemeChooser;->showDialog(I)V

    goto :goto_0

    .line 212
    :cond_1
    const-string v8, "android.intent.action.PICK"

    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 213
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {v6, p0}, Lcom/tmobile/themes/provider/ThemeItem;->getUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v3, v11, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 214
    .local v3, i:Landroid/content/Intent;
    const/4 v8, -0x1

    invoke-virtual {p0, v8, v3}, Lcom/tmobile/themechooser/ThemeChooser;->setResult(ILandroid/content/Intent;)V

    .line 215
    invoke-virtual {p0}, Lcom/tmobile/themechooser/ThemeChooser;->finish()V

    goto :goto_0

    .line 217
    .end local v3           #i:Landroid/content/Intent;
    :cond_2
    invoke-direct {p0, v6}, Lcom/tmobile/themechooser/ThemeChooser;->doApply(Lcom/tmobile/themes/provider/ThemeItem;)V

    goto :goto_0

    .line 221
    :sswitch_2
    const-string v8, "package"

    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v11}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 222
    .local v7, uri:Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v8, "android.intent.action.DELETE"

    invoke-direct {v1, v8, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 223
    .local v1, deleteIntent:Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/tmobile/themechooser/ThemeChooser;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 226
    .end local v1           #deleteIntent:Landroid/content/Intent;
    .end local v7           #uri:Landroid/net/Uri;
    :sswitch_3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 227
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 228
    .local v4, packageName:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3

    const-string v4, "com.android.systemui"

    .line 229
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const v9, 0x7f060006

    invoke-virtual {p0, v9}, Lcom/tmobile/themechooser/ThemeChooser;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const v9, 0x7f060005

    invoke-virtual {p0, v9}, Lcom/tmobile/themechooser/ThemeChooser;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/tmobile/themes/provider/ThemeItem;->getAuthor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const v9, 0x7f060007

    invoke-virtual {p0, v9}, Lcom/tmobile/themechooser/ThemeChooser;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f060003

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 233
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 234
    .local v2, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 199
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x102002c -> :sswitch_0
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnPause()V

    .line 134
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 135
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v0, p1, p2}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnPrepareDialog(ILandroid/app/Dialog;)V

    .line 168
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    const/4 v1, 0x1

    .line 172
    iget-boolean v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mShowUninstallIcon:Z

    if-eqz v0, :cond_0

    .line 173
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 178
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    .line 175
    :cond_0
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/tmobile/themechooser/ThemeChooser;->mChangeHelper:Lcom/tmobile/themechooser/ChangeThemeHelper;

    invoke-virtual {v0}, Lcom/tmobile/themechooser/ChangeThemeHelper;->dispatchOnResume()V

    .line 128
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 129
    return-void
.end method
