.class Lcom/android/location/fused/FusedLocationProvider$1;
.super Landroid/os/Handler;
.source "FusedLocationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/location/fused/FusedLocationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/location/fused/FusedLocationProvider;


# direct methods
.method constructor <init>(Lcom/android/location/fused/FusedLocationProvider;)V
    .locals 0
    .parameter

    .prologue
    .line 68
    iput-object p1, p0, Lcom/android/location/fused/FusedLocationProvider$1;->this$0:Lcom/android/location/fused/FusedLocationProvider;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 71
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 85
    :goto_0
    return-void

    .line 73
    :pswitch_0
    iget-object v1, p0, Lcom/android/location/fused/FusedLocationProvider$1;->this$0:Lcom/android/location/fused/FusedLocationProvider;

    #getter for: Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;
    invoke-static {v1}, Lcom/android/location/fused/FusedLocationProvider;->access$000(Lcom/android/location/fused/FusedLocationProvider;)Lcom/android/location/fused/FusionEngine;

    move-result-object v1

    iget-object v2, p0, Lcom/android/location/fused/FusedLocationProvider$1;->this$0:Lcom/android/location/fused/FusedLocationProvider;

    invoke-virtual {v1, v2}, Lcom/android/location/fused/FusionEngine;->init(Lcom/android/location/fused/FusionEngine$Callback;)V

    goto :goto_0

    .line 76
    :pswitch_1
    iget-object v1, p0, Lcom/android/location/fused/FusedLocationProvider$1;->this$0:Lcom/android/location/fused/FusedLocationProvider;

    #getter for: Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;
    invoke-static {v1}, Lcom/android/location/fused/FusedLocationProvider;->access$000(Lcom/android/location/fused/FusedLocationProvider;)Lcom/android/location/fused/FusionEngine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/location/fused/FusionEngine;->deinit()V

    goto :goto_0

    .line 80
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;

    .line 81
    .local v0, wrapper:Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;
    iget-object v1, p0, Lcom/android/location/fused/FusedLocationProvider$1;->this$0:Lcom/android/location/fused/FusedLocationProvider;

    #getter for: Lcom/android/location/fused/FusedLocationProvider;->mEngine:Lcom/android/location/fused/FusionEngine;
    invoke-static {v1}, Lcom/android/location/fused/FusedLocationProvider;->access$000(Lcom/android/location/fused/FusedLocationProvider;)Lcom/android/location/fused/FusionEngine;

    move-result-object v1

    iget-object v2, v0, Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;->request:Lcom/android/location/provider/ProviderRequestUnbundled;

    iget-object v3, v0, Lcom/android/location/fused/FusedLocationProvider$RequestWrapper;->source:Landroid/os/WorkSource;

    invoke-virtual {v1, v2, v3}, Lcom/android/location/fused/FusionEngine;->setRequest(Lcom/android/location/provider/ProviderRequestUnbundled;Landroid/os/WorkSource;)V

    goto :goto_0

    .line 71
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
