.class public Lcom/android/tts/compat/SynthProxy;
.super Ljava/lang/Object;
.source "SynthProxy.java"


# static fields
.field private static final PICO_FILTER_GAIN:F = 5.0f

.field private static final PICO_FILTER_LOWSHELF_ATTENUATION:F = -18.0f

.field private static final PICO_FILTER_SHELF_SLOPE:F = 1.0f

.field private static final PICO_FILTER_TRANSITION_FREQ:F = 1100.0f

.field private static final TAG:Ljava/lang/String; = "SynthProxy"


# instance fields
.field private mJniData:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string v0, "ttscompat"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "nativeSoLib"
    .parameter "engineConfig"

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    .line 52
    invoke-direct {p0, p1}, Lcom/android/tts/compat/SynthProxy;->shouldApplyAudioFilter(Ljava/lang/String;)Z

    move-result v1

    .line 53
    .local v1, applyFilter:Z
    const-string v0, "SynthProxy"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "About to load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", applyFilter="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/android/tts/compat/SynthProxy;->native_setup(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    .line 55
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    const/high16 v2, 0x40a0

    const/high16 v3, -0x3e70

    const v4, 0x44898000

    const/high16 v5, 0x3f80

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/tts/compat/SynthProxy;->native_setLowShelf(ZFFFF)I

    .line 60
    return-void
.end method

.method private final native native_finalize(I)V
.end method

.method private final native native_getLanguage(I)[Ljava/lang/String;
.end method

.method private final native native_isLanguageAvailable(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private final native native_loadLanguage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private final native native_setLanguage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private final native native_setLowShelf(ZFFFF)I
.end method

.method private final native native_setProperty(ILjava/lang/String;Ljava/lang/String;)I
.end method

.method private final native native_setup(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private final native native_shutdown(I)V
.end method

.method private final native native_speak(ILjava/lang/String;Landroid/speech/tts/SynthesisCallback;)I
.end method

.method private final native native_stop(I)I
.end method

.method private final native native_stopSync(I)I
.end method

.method private shouldApplyAudioFilter(Ljava/lang/String;)Z
    .locals 2
    .parameter "nativeSoLib"

    .prologue
    .line 64
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pico"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected finalize()V
    .locals 2

    .prologue
    .line 150
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    if-eqz v0, :cond_0

    .line 151
    const-string v0, "SynthProxy"

    const-string v1, "SynthProxy finalized without being shutdown"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0}, Lcom/android/tts/compat/SynthProxy;->native_finalize(I)V

    .line 153
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    .line 155
    :cond_0
    return-void
.end method

.method public getLanguage()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0}, Lcom/android/tts/compat/SynthProxy;->native_getLanguage(I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "language"
    .parameter "country"
    .parameter "variant"

    .prologue
    .line 95
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/tts/compat/SynthProxy;->native_isLanguageAvailable(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public loadLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "language"
    .parameter "country"
    .parameter "variant"

    .prologue
    .line 116
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/tts/compat/SynthProxy;->native_loadLanguage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setConfig(Ljava/lang/String;)I
    .locals 2
    .parameter "engineConfig"

    .prologue
    .line 102
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    const-string v1, "engineConfig"

    invoke-direct {p0, v0, v1, p1}, Lcom/android/tts/compat/SynthProxy;->native_setProperty(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "language"
    .parameter "country"
    .parameter "variant"

    .prologue
    .line 109
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/tts/compat/SynthProxy;->native_setLanguage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public final setPitch(I)I
    .locals 3
    .parameter "pitch"

    .prologue
    .line 130
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    const-string v1, "pitch"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/tts/compat/SynthProxy;->native_setProperty(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public final setSpeechRate(I)I
    .locals 3
    .parameter "speechRate"

    .prologue
    .line 123
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    const-string v1, "rate"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/tts/compat/SynthProxy;->native_setProperty(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0}, Lcom/android/tts/compat/SynthProxy;->native_shutdown(I)V

    .line 145
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    .line 146
    return-void
.end method

.method public speak(Landroid/speech/tts/SynthesisRequest;Landroid/speech/tts/SynthesisCallback;)I
    .locals 2
    .parameter "request"
    .parameter "callback"

    .prologue
    .line 87
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lcom/android/tts/compat/SynthProxy;->native_speak(ILjava/lang/String;Landroid/speech/tts/SynthesisCallback;)I

    move-result v0

    return v0
.end method

.method public stop()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0}, Lcom/android/tts/compat/SynthProxy;->native_stop(I)I

    move-result v0

    return v0
.end method

.method public stopSync()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lcom/android/tts/compat/SynthProxy;->mJniData:I

    invoke-direct {p0, v0}, Lcom/android/tts/compat/SynthProxy;->native_stopSync(I)I

    move-result v0

    return v0
.end method
