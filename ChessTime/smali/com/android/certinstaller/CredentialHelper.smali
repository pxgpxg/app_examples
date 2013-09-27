.class Lcom/android/certinstaller/CredentialHelper;
.super Ljava/lang/Object;
.source "CredentialHelper.java"


# instance fields
.field private mBundle:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private mCaCerts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private mName:Ljava/lang/String;

.field private mUserCert:Ljava/security/cert/X509Certificate;

.field private mUserKey:Ljava/security/PrivateKey;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    .line 72
    return-void
.end method

.method constructor <init>(Landroid/content/Intent;)V
    .locals 8
    .parameter "intent"

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    .line 66
    const-string v5, ""

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 69
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    .line 75
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 76
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 93
    :goto_0
    return-void

    .line 80
    :cond_0
    const-string v5, "name"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, name:Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 82
    if-eqz v4, :cond_1

    .line 83
    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 86
    :cond_1
    const-string v5, "CredentialHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "# extras: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/os/Bundle;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 88
    .local v3, key:Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 89
    .local v1, bytes:[B
    const-string v6, "CredentialHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "   "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ": "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez v1, :cond_2

    const/4 v5, -0x1

    :goto_2
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 89
    :cond_2
    array-length v5, v1

    goto :goto_2

    .line 92
    .end local v1           #bytes:[B
    .end local v3           #key:Ljava/lang/String;
    :cond_3
    const-string v5, "CERT"

    invoke-virtual {p0, v5}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/certinstaller/CredentialHelper;->parseCert([B)V

    goto :goto_0
.end method

.method private extractPkcs12Internal(Ljava/lang/String;)Z
    .locals 8
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 313
    const-string v5, "PKCS12"

    invoke-static {v5}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v3

    .line 314
    .local v3, keystore:Ljava/security/KeyStore;
    new-instance v4, Ljava/security/KeyStore$PasswordProtection;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 315
    .local v4, passwordProtection:Ljava/security/KeyStore$PasswordProtection;
    new-instance v5, Ljava/io/ByteArrayInputStream;

    const-string v6, "PKCS12"

    invoke-virtual {p0, v6}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v4}, Ljava/security/KeyStore$PasswordProtection;->getPassword()[C

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 318
    invoke-virtual {v3}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v1

    .line 319
    .local v1, aliases:Ljava/util/Enumeration;,"Ljava/util/Enumeration<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_0

    .line 320
    const/4 v5, 0x0

    .line 335
    :goto_0
    return v5

    .line 323
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 324
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 325
    .local v0, alias:Ljava/lang/String;
    invoke-virtual {v3, v0, v4}, Ljava/security/KeyStore;->getEntry(Ljava/lang/String;Ljava/security/KeyStore$ProtectionParameter;)Ljava/security/KeyStore$Entry;

    move-result-object v2

    .line 326
    .local v2, entry:Ljava/security/KeyStore$Entry;
    const-string v5, "CredentialHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extracted alias = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", entry="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    instance-of v5, v2, Ljava/security/KeyStore$PrivateKeyEntry;

    if-eqz v5, :cond_0

    .line 329
    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 330
    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 332
    :cond_1
    check-cast v2, Ljava/security/KeyStore$PrivateKeyEntry;

    .end local v2           #entry:Ljava/security/KeyStore$Entry;
    invoke-direct {p0, v2}, Lcom/android/certinstaller/CredentialHelper;->installFrom(Ljava/security/KeyStore$PrivateKeyEntry;)Z

    move-result v5

    goto :goto_0

    .line 335
    .end local v0           #alias:Ljava/lang/String;
    :cond_2
    const/4 v5, 0x1

    goto :goto_0
.end method

.method private declared-synchronized installFrom(Ljava/security/KeyStore$PrivateKeyEntry;)Z
    .locals 10
    .parameter "entry"

    .prologue
    .line 339
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v7

    iput-object v7, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    .line 340
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificate()Ljava/security/cert/Certificate;

    move-result-object v7

    check-cast v7, Ljava/security/cert/X509Certificate;

    iput-object v7, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    .line 342
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v4

    .line 343
    .local v4, certs:[Ljava/security/cert/Certificate;
    const-string v7, "CredentialHelper"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "# certs extracted = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    array-length v9, v4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    new-instance v7, Ljava/util/ArrayList;

    array-length v8, v4

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v7, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    .line 345
    move-object v1, v4

    .local v1, arr$:[Ljava/security/cert/Certificate;
    array-length v6, v1

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v2, v1, v5

    .line 346
    .local v2, c:Ljava/security/cert/Certificate;
    move-object v0, v2

    check-cast v0, Ljava/security/cert/X509Certificate;

    move-object v3, v0

    .line 347
    .local v3, cert:Ljava/security/cert/X509Certificate;
    invoke-direct {p0, v3}, Lcom/android/certinstaller/CredentialHelper;->isCa(Ljava/security/cert/X509Certificate;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 348
    iget-object v7, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 351
    .end local v2           #c:Ljava/security/cert/Certificate;
    .end local v3           #cert:Ljava/security/cert/X509Certificate;
    :cond_1
    const-string v7, "CredentialHelper"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "# ca certs extracted = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    const/4 v7, 0x1

    monitor-exit p0

    return v7

    .line 339
    .end local v1           #arr$:[Ljava/security/cert/Certificate;
    .end local v4           #certs:[Ljava/security/cert/Certificate;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private isCa(Ljava/security/cert/X509Certificate;)Z
    .locals 7
    .parameter "cert"

    .prologue
    const/4 v5, 0x0

    .line 159
    :try_start_0
    const-string v6, "2.5.29.19"

    invoke-virtual {p1, v6}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v0

    .line 160
    .local v0, asn1EncodedBytes:[B
    if-nez v0, :cond_0

    .line 170
    .end local v0           #asn1EncodedBytes:[B
    :goto_0
    return v5

    .line 163
    .restart local v0       #asn1EncodedBytes:[B
    :cond_0
    new-instance v6, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;

    invoke-direct {v6, v0}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lcom/android/org/bouncycastle/asn1/DEROctetString;

    .line 165
    .local v1, derOctetString:Lcom/android/org/bouncycastle/asn1/DEROctetString;
    invoke-virtual {v1}, Lcom/android/org/bouncycastle/asn1/DEROctetString;->getOctets()[B

    move-result-object v3

    .line 166
    .local v3, octets:[B
    new-instance v6, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;

    invoke-direct {v6, v3}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/ASN1InputStream;->readObject()Lcom/android/org/bouncycastle/asn1/ASN1Primitive;

    move-result-object v4

    check-cast v4, Lcom/android/org/bouncycastle/asn1/ASN1Sequence;

    .line 168
    .local v4, sequence:Lcom/android/org/bouncycastle/asn1/ASN1Sequence;
    invoke-static {v4}, Lcom/android/org/bouncycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lcom/android/org/bouncycastle/asn1/x509/BasicConstraints;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/org/bouncycastle/asn1/x509/BasicConstraints;->isCA()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    goto :goto_0

    .line 169
    .end local v0           #asn1EncodedBytes:[B
    .end local v1           #derOctetString:Lcom/android/org/bouncycastle/asn1/DEROctetString;
    .end local v3           #octets:[B
    .end local v4           #sequence:Lcom/android/org/bouncycastle/asn1/ASN1Sequence;
    :catch_0
    move-exception v2

    .line 170
    .local v2, e:Ljava/io/IOException;
    goto :goto_0
.end method

.method private parseCert([B)V
    .locals 6
    .parameter "bytes"

    .prologue
    .line 135
    if-nez p1, :cond_0

    .line 154
    :goto_0
    return-void

    .line 140
    :cond_0
    :try_start_0
    const-string v3, "X.509"

    invoke-static {v3}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 141
    .local v1, certFactory:Ljava/security/cert/CertificateFactory;
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v1, v3}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 144
    .local v0, cert:Ljava/security/cert/X509Certificate;
    invoke-direct {p0, v0}, Lcom/android/certinstaller/CredentialHelper;->isCa(Ljava/security/cert/X509Certificate;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 145
    const-string v3, "CredentialHelper"

    const-string v4, "got a CA cert"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    .end local v0           #cert:Ljava/security/cert/X509Certificate;
    .end local v1           #certFactory:Ljava/security/cert/CertificateFactory;
    :catch_0
    move-exception v2

    .line 152
    .local v2, e:Ljava/security/cert/CertificateException;
    const-string v3, "CredentialHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "parseCert(): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 148
    .end local v2           #e:Ljava/security/cert/CertificateException;
    .restart local v0       #cert:Ljava/security/cert/X509Certificate;
    .restart local v1       #certFactory:Ljava/security/cert/CertificateFactory;
    :cond_1
    :try_start_1
    const-string v3, "CredentialHelper"

    const-string v4, "got a user cert"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method


# virtual methods
.method containsAnyRawData()Z
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method createSystemInstallIntent()Landroid/content/Intent;
    .locals 7

    .prologue
    .line 248
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.credentials.INSTALL"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 251
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "com.android.settings"

    const-string v4, "com.android.settings.CredentialStorage"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 253
    :try_start_0
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v3, :cond_0

    .line 254
    const-string v3, "user_private_key_name"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "USRPKEY_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 256
    const-string v3, "user_private_key_data"

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    invoke-interface {v4}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 259
    :cond_0
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_1

    .line 260
    const-string v3, "user_certificate_name"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "USRCERT_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 262
    const-string v3, "user_certificate_data"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/security/cert/Certificate;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    aput-object v6, v4, v5

    invoke-static {v4}, Landroid/security/Credentials;->convertToPem([Ljava/security/cert/Certificate;)[B

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 265
    :cond_1
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 266
    const-string v3, "ca_certificates_name"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CACERT_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 268
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/security/cert/X509Certificate;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/security/cert/X509Certificate;

    .line 270
    .local v0, caCerts:[Ljava/security/cert/X509Certificate;
    const-string v3, "ca_certificates_data"

    invoke-static {v0}, Landroid/security/Credentials;->convertToPem([Ljava/security/cert/Certificate;)[B

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 273
    .end local v0           #caCerts:[Ljava/security/cert/X509Certificate;
    :cond_2
    return-object v2

    .line 274
    :catch_0
    move-exception v1

    .line 275
    .local v1, e:Ljava/io/IOException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 276
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 277
    .local v1, e:Ljava/security/cert/CertificateEncodingException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method extractPkcs12(Ljava/lang/String;)Z
    .locals 4
    .parameter "password"

    .prologue
    .line 303
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/certinstaller/CredentialHelper;->extractPkcs12Internal(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 306
    :goto_0
    return v1

    .line 304
    :catch_0
    move-exception v0

    .line 305
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "CredentialHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "extractPkcs12(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 306
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getData(Ljava/lang/String;)[B
    .locals 1
    .parameter "key"

    .prologue
    .line 211
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method getDescription(Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 7
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    .line 220
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .local v2, sb:Ljava/lang/StringBuilder;
    const-string v1, "<br>"

    .line 222
    .local v1, newline:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v3, :cond_0

    .line 223
    const v3, 0x7f06000a

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    :cond_0
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_1

    .line 226
    const v3, 0x7f06000b

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    :cond_1
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    .line 229
    .local v0, n:I
    if-lez v0, :cond_2

    .line 230
    if-ne v0, v4, :cond_3

    .line 231
    const v3, 0x7f06000c

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    :cond_2
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    return-object v3

    .line 233
    :cond_3
    const v3, 0x7f06000d

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 244
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    return-object v0
.end method

.method getUserCertificate()Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method hasAnyForSystemInstall()Z
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/certinstaller/CredentialHelper;->hasUserCertificate()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/certinstaller/CredentialHelper;->hasCaCerts()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasCaCerts()Z
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasKeyPair()Z
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "KEY"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "PKEY"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasPkcs12KeyStore()Z
    .locals 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "PKCS12"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method hasUserCertificate()Z
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method installCaCertsToKeyChain(Landroid/security/IKeyChainService;)Z
    .locals 7
    .parameter "keyChainService"

    .prologue
    .line 282
    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 283
    .local v1, caCert:Ljava/security/cert/X509Certificate;
    const/4 v0, 0x0

    .line 285
    .local v0, bytes:[B
    :try_start_0
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getEncoded()[B
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 289
    if-eqz v0, :cond_0

    .line 291
    :try_start_1
    invoke-interface {p1, v0}, Landroid/security/IKeyChainService;->installCaCertificate([B)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 292
    :catch_0
    move-exception v2

    .line 293
    .local v2, e:Landroid/os/RemoteException;
    const-string v4, "CredentialHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "installCaCertsToKeyChain(): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const/4 v4, 0x0

    .line 298
    .end local v0           #bytes:[B
    .end local v1           #caCert:Ljava/security/cert/X509Certificate;
    .end local v2           #e:Landroid/os/RemoteException;
    :goto_1
    return v4

    .line 286
    .restart local v0       #bytes:[B
    .restart local v1       #caCert:Ljava/security/cert/X509Certificate;
    :catch_1
    move-exception v2

    .line 287
    .local v2, e:Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 298
    .end local v0           #bytes:[B
    .end local v1           #caCert:Ljava/security/cert/X509Certificate;
    .end local v2           #e:Ljava/security/cert/CertificateEncodingException;
    :cond_1
    const/4 v4, 0x1

    goto :goto_1
.end method

.method onRestoreStates(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedStates"

    .prologue
    .line 117
    const-string v4, "data"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    .line 118
    const-string v4, "name"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 119
    const-string v4, "USRPKEY_"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 120
    .local v0, bytes:[B
    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CredentialHelper;->setPrivateKey([B)V

    .line 124
    :cond_0
    const-string v4, "crts"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v4

    invoke-static {v4}, Lcom/android/certinstaller/Util;->fromBytes([B)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 125
    .local v2, certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 126
    .local v1, cert:[B
    invoke-direct {p0, v1}, Lcom/android/certinstaller/CredentialHelper;->parseCert([B)V

    goto :goto_0

    .line 128
    .end local v1           #cert:[B
    :cond_1
    return-void
.end method

.method declared-synchronized onSaveStates(Landroid/os/Bundle;)V
    .locals 6
    .parameter "outStates"

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    const-string v4, "data"

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {p1, v4, v5}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 98
    const-string v4, "name"

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {p1, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v4, :cond_0

    .line 100
    const-string v4, "USRPKEY_"

    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    invoke-interface {v5}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 103
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 104
    .local v1, certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v4, :cond_1

    .line 105
    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    :cond_1
    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 108
    .local v0, cert:Ljava/security/cert/X509Certificate;
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 111
    .end local v0           #cert:Ljava/security/cert/X509Certificate;
    .end local v1           #certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .end local v3           #i$:Ljava/util/Iterator;
    :catch_0
    move-exception v2

    .line 112
    .local v2, e:Ljava/security/cert/CertificateEncodingException;
    :try_start_1
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .end local v2           #e:Ljava/security/cert/CertificateEncodingException;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 110
    .restart local v1       #certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_2
    :try_start_2
    const-string v4, "crts"

    invoke-static {v1}, Lcom/android/certinstaller/Util;->toBytes(Ljava/lang/Object;)[B

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    .line 114
    monitor-exit p0

    return-void
.end method

.method setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 240
    iput-object p1, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 241
    return-void
.end method

.method setPrivateKey([B)V
    .locals 3
    .parameter "bytes"

    .prologue
    .line 197
    :try_start_0
    const-string v2, "RSA"

    invoke-static {v2}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 198
    .local v1, keyFactory:Ljava/security/KeyFactory;
    new-instance v2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v2, p1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v2

    iput-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_1

    .line 204
    return-void

    .line 199
    .end local v1           #keyFactory:Ljava/security/KeyFactory;
    :catch_0
    move-exception v0

    .line 200
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 201
    .end local v0           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 202
    .local v0, e:Ljava/security/spec/InvalidKeySpecException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method
