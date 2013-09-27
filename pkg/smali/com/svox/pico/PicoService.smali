.class public Lcom/svox/pico/PicoService;
.super Lcom/android/tts/compat/CompatTtsService;
.source "PicoService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/android/tts/compat/CompatTtsService;-><init>()V

    return-void
.end method


# virtual methods
.method protected getSoFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    const-string v0, "/system/lib/libttspico.so"

    return-object v0
.end method
