.class public Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;
.super Landroid/widget/SimpleCursorAdapter;
.source "PackageListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PackageListAdapater"
.end annotation


# instance fields
.field private defaultIcon:Landroid/graphics/drawable/Drawable;

.field final synthetic this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V
    .locals 7
    .parameter
    .parameter "context"
    .parameter "layout"
    .parameter "c"
    .parameter "from"
    .parameter "to"
    .parameter "flags"

    .prologue
    .line 206
    iput-object p1, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p7

    .line 207
    invoke-direct/range {v0 .. v6}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    .line 202
    iget-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    invoke-virtual {v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f02

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->defaultIcon:Landroid/graphics/drawable/Drawable;

    .line 208
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    #setter for: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mInflater:Landroid/view/LayoutInflater;
    invoke-static {p1, v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$002(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/view/LayoutInflater;)Landroid/view/LayoutInflater;

    .line 209
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    #setter for: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {p1, v0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$102(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;Landroid/content/pm/PackageManager;)Landroid/content/pm/PackageManager;

    .line 210
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v7, 0x0

    .line 213
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    .line 215
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 216
    if-nez p2, :cond_0

    .line 217
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mInflater:Landroid/view/LayoutInflater;
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$000(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030001

    invoke-virtual {v3, v4, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 219
    new-instance v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;

    invoke-direct {v1}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;-><init>()V

    .line 220
    .local v1, holder:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;
    const v3, 0x7f050003

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->label:Landroid/widget/TextView;

    .line 222
    const v3, 0x7f050004

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->packageName:Landroid/widget/TextView;

    .line 224
    const v3, 0x7f050005

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->enabled:Landroid/widget/CheckBox;

    .line 226
    const v3, 0x7f050002

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 228
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 232
    :goto_0
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    const-string v5, "package_name"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 234
    .local v2, packageName:Ljava/lang/String;
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->label:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    const-string v6, "application_label"

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->packageName:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    iget-object v3, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mBusy:Z
    invoke-static {v3}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$200(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 239
    :try_start_0
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->this$0:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;

    #getter for: Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v4}, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;->access$100(Lcom/cyanogenmod/settings/device/hwa/PackageListFragment;)Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    :goto_1
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 250
    :goto_2
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->enabled:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    iget-object v5, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->mCursor:Landroid/database/Cursor;

    const-string v6, "hwa_enabled"

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 253
    return-object p2

    .line 230
    .end local v1           #holder:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;
    .end local v2           #packageName:Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;

    .restart local v1       #holder:Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;
    goto :goto_0

    .line 241
    .restart local v2       #packageName:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 242
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    const/high16 v4, 0x7f02

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 243
    const-string v3, "PackageListAdapater"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Icon "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for not found!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 247
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_1
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$PackageListAdapater;->defaultIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 248
    iget-object v3, v1, Lcom/cyanogenmod/settings/device/hwa/PackageListFragment$ViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    goto :goto_2
.end method
