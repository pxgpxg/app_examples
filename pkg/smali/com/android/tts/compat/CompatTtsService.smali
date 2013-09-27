.class public abstract Lcom/android/tts/compat/CompatTtsService;
.super Landroid/speech/tts/TextToSpeechService;
.source "CompatTtsService.java"


# instance fields
.field private mNativeSynth:Lcom/android/tts/compat/SynthProxy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/speech/tts/TextToSpeechService;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    return-void
.end method


# virtual methods
.method protected abstract getSoFilename()Ljava/lang/String;
.end method

.method public onCreate()V
    .locals 10

    .prologue
    const/4 v2, 0x0

    .line 41
    invoke-virtual {p0}, Lcom/android/tts/compat/CompatTtsService;->getSoFilename()Ljava/lang/String;

    move-result-object v9

    .line 43
    .local v9, soFilename:Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .local v8, f:Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    const-string v0, "CompatTtsService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid TTS Binary: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-eqz v0, :cond_1

    .line 50
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0}, Lcom/android/tts/compat/SynthProxy;->stopSync()I

    .line 51
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0}, Lcom/android/tts/compat/SynthProxy;->shutdown()V

    .line 52
    iput-object v2, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    .line 64
    :cond_1
    const-string v7, ""

    .line 65
    .local v7, engineConfig:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/tts/compat/CompatTtsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "content://"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/tts/compat/CompatTtsService;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".providers.SettingsProvider"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 67
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 68
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 69
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 70
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 72
    :cond_2
    new-instance v0, Lcom/android/tts/compat/SynthProxy;

    invoke-direct {v0, v9, v7}, Lcom/android/tts/compat/SynthProxy;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    .line 79
    invoke-super {p0}, Landroid/speech/tts/TextToSpeechService;->onCreate()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 85
    invoke-super {p0}, Landroid/speech/tts/TextToSpeechService;->onDestroy()V

    .line 87
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0}, Lcom/android/tts/compat/SynthProxy;->shutdown()V

    .line 90
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    .line 91
    return-void
.end method

.method protected onGetLanguage()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 96
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0}, Lcom/android/tts/compat/SynthProxy;->getLanguage()[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected onIsLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "lang"
    .parameter "country"
    .parameter "variant"

    .prologue
    .line 102
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    .line 103
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/tts/compat/SynthProxy;->isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method protected onLoadLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter "lang"
    .parameter "country"
    .parameter "variant"

    .prologue
    .line 109
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/tts/compat/CompatTtsService;->onIsLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 110
    .local v0, result:I
    if-ltz v0, :cond_0

    .line 111
    iget-object v1, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/tts/compat/SynthProxy;->setLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_0
    return v0
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-nez v0, :cond_0

    .line 162
    :goto_0
    return-void

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v0}, Lcom/android/tts/compat/SynthProxy;->stop()I

    goto :goto_0
.end method

.method protected onSynthesizeText(Landroid/speech/tts/SynthesisRequest;Landroid/speech/tts/SynthesisCallback;)V
    .locals 8
    .parameter "request"
    .parameter "callback"

    .prologue
    .line 119
    iget-object v5, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    if-nez v5, :cond_1

    .line 120
    invoke-interface {p2}, Landroid/speech/tts/SynthesisCallback;->error()V

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, lang:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, country:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getVariant()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, variant:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v5, v1, v0, v4}, Lcom/android/tts/compat/SynthProxy;->setLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_2

    .line 129
    const-string v5, "CompatTtsService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setLanguage("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") failed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-interface {p2}, Landroid/speech/tts/SynthesisCallback;->error()V

    goto :goto_0

    .line 135
    :cond_2
    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getSpeechRate()I

    move-result v3

    .line 136
    .local v3, speechRate:I
    iget-object v5, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v5, v3}, Lcom/android/tts/compat/SynthProxy;->setSpeechRate(I)I

    move-result v5

    if-eqz v5, :cond_3

    .line 137
    const-string v5, "CompatTtsService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setSpeechRate("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") failed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-interface {p2}, Landroid/speech/tts/SynthesisCallback;->error()V

    goto :goto_0

    .line 143
    :cond_3
    invoke-virtual {p1}, Landroid/speech/tts/SynthesisRequest;->getPitch()I

    move-result v2

    .line 144
    .local v2, pitch:I
    iget-object v5, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v5, v2}, Lcom/android/tts/compat/SynthProxy;->setPitch(I)I

    move-result v5

    if-eqz v5, :cond_4

    .line 145
    const-string v5, "CompatTtsService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setPitch("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") failed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-interface {p2}, Landroid/speech/tts/SynthesisCallback;->error()V

    goto/16 :goto_0

    .line 151
    :cond_4
    iget-object v5, p0, Lcom/android/tts/compat/CompatTtsService;->mNativeSynth:Lcom/android/tts/compat/SynthProxy;

    invoke-virtual {v5, p1, p2}, Lcom/android/tts/compat/SynthProxy;->speak(Landroid/speech/tts/SynthesisRequest;Landroid/speech/tts/SynthesisCallback;)I

    move-result v5

    if-eqz v5, :cond_0

    .line 152
    invoke-interface {p2}, Landroid/speech/tts/SynthesisCallback;->error()V

    goto/16 :goto_0
.end method
