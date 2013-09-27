.class Lcom/tmobile/themechooser/ThemeChooser$2;
.super Ljava/lang/Object;
.source "ThemeChooser.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tmobile/themechooser/ThemeChooser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tmobile/themechooser/ThemeChooser;


# direct methods
.method constructor <init>(Lcom/tmobile/themechooser/ThemeChooser;)V
    .locals 0
    .parameter

    .prologue
    .line 240
    iput-object p1, p0, Lcom/tmobile/themechooser/ThemeChooser$2;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 242
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tmobile/themes/provider/ThemeItem;

    .line 243
    .local v0, item:Lcom/tmobile/themes/provider/ThemeItem;
    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser$2;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    const/4 v2, 0x1

    #setter for: Lcom/tmobile/themechooser/ThemeChooser;->mShowUninstallIcon:Z
    invoke-static {v1, v2}, Lcom/tmobile/themechooser/ThemeChooser;->access$202(Lcom/tmobile/themechooser/ThemeChooser;Z)Z

    .line 244
    invoke-virtual {v0}, Lcom/tmobile/themes/provider/ThemeItem;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 245
    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser$2;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    const/4 v2, 0x0

    #setter for: Lcom/tmobile/themechooser/ThemeChooser;->mShowUninstallIcon:Z
    invoke-static {v1, v2}, Lcom/tmobile/themechooser/ThemeChooser;->access$202(Lcom/tmobile/themechooser/ThemeChooser;Z)Z

    .line 247
    :cond_0
    iget-object v1, p0, Lcom/tmobile/themechooser/ThemeChooser$2;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    invoke-virtual {v1}, Lcom/tmobile/themechooser/ThemeChooser;->invalidateOptionsMenu()V

    .line 248
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 251
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
