.class final Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;
.super Ljava/lang/Object;
.source "GsmSMSDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/GsmSMSDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SmsCbConcatInfo"
.end annotation


# instance fields
.field private final mCid:I

.field private final mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

.field private final mLac:I

.field private final mPlmn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/gsm/SmsCbHeader;Ljava/lang/String;II)V
    .locals 0
    .parameter "header"
    .parameter "plmn"
    .parameter "lac"
    .parameter "cid"

    .prologue
    .line 413
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 414
    iput-object p1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    .line 415
    iput-object p2, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mPlmn:Ljava/lang/String;

    .line 416
    iput p3, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mLac:I

    .line 417
    iput p4, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mCid:I

    .line 418
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    .line 427
    instance-of v1, p1, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 428
    check-cast v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;

    .line 433
    .local v0, other:Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;
    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->geographicalScope:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->geographicalScope:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageCode:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageCode:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->updateNumber:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->updateNumber:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageIdentifier:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageIdentifier:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->dataCodingScheme:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->dataCodingScheme:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->nrOfPages:I

    iget-object v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v2, v2, Lcom/android/internal/telephony/gsm/SmsCbHeader;->nrOfPages:I

    if-ne v1, v2, :cond_0

    .line 439
    iget-object v1, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mPlmn:Ljava/lang/String;

    iget v2, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mLac:I

    iget v3, v0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mCid:I

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->matchesLocation(Ljava/lang/String;II)Z

    move-result v1

    .line 443
    .end local v0           #other:Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 422
    iget-object v0, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v0, v0, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageIdentifier:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->updateNumber:I

    add-int/2addr v0, v1

    return v0
.end method

.method public matchesLocation(Ljava/lang/String;II)Z
    .locals 2
    .parameter "plmn"
    .parameter "lac"
    .parameter "cid"

    .prologue
    const/4 v0, 0x0

    .line 456
    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mHeader:Lcom/android/internal/telephony/gsm/SmsCbHeader;

    iget v1, v1, Lcom/android/internal/telephony/gsm/SmsCbHeader;->geographicalScope:I

    packed-switch v1, :pswitch_data_0

    .line 472
    :cond_0
    :goto_0
    return v0

    .line 459
    :pswitch_0
    iget v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mCid:I

    if-ne v1, p3, :cond_0

    .line 464
    :pswitch_1
    iget v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mLac:I

    if-ne v1, p2, :cond_0

    .line 469
    :pswitch_2
    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mPlmn:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/GsmSMSDispatcher$SmsCbConcatInfo;->mPlmn:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 456
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
