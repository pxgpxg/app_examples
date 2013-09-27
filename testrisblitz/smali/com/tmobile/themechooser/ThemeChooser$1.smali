.class Lcom/tmobile/themechooser/ThemeChooser$1;
.super Ljava/lang/Object;
.source "ThemeChooser.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tmobile/themechooser/ThemeChooser;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 145
    iput-object p1, p0, Lcom/tmobile/themechooser/ThemeChooser$1;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 147
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser$1;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    #getter for: Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;
    invoke-static {v2}, Lcom/tmobile/themechooser/ThemeChooser;->access$000(Lcom/tmobile/themechooser/ThemeChooser;)Landroid/widget/Gallery;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Gallery;->getSelectedItemPosition()I

    move-result v1

    .line 148
    .local v1, selectedPos:I
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser$1;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    #getter for: Lcom/tmobile/themechooser/ThemeChooser;->mGallery:Landroid/widget/Gallery;
    invoke-static {v2}, Lcom/tmobile/themechooser/ThemeChooser;->access$000(Lcom/tmobile/themechooser/ThemeChooser;)Landroid/widget/Gallery;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/Gallery;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tmobile/themes/provider/ThemeItem;

    .line 149
    .local v0, item:Lcom/tmobile/themes/provider/ThemeItem;
    iget-object v2, p0, Lcom/tmobile/themechooser/ThemeChooser$1;->this$0:Lcom/tmobile/themechooser/ThemeChooser;

    #calls: Lcom/tmobile/themechooser/ThemeChooser;->doApply(Lcom/tmobile/themes/provider/ThemeItem;)V
    invoke-static {v2, v0}, Lcom/tmobile/themechooser/ThemeChooser;->access$100(Lcom/tmobile/themechooser/ThemeChooser;Lcom/tmobile/themes/provider/ThemeItem;)V

    .line 150
    return-void
.end method
