.class Landroid/webkit/WebView$TouchEventQueue;
.super Ljava/lang/Object;
.source "WebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchEventQueue"
.end annotation


# static fields
.field private static final MAX_RECYCLED_QUEUED_TOUCH:I = 0xf

.field private static final QUEUED_GESTURE_TIMEOUT:I = 0x3e8


# instance fields
.field private mIgnoreUntilSequence:J

.field private mLastEventTime:J

.field private mLastHandledTouchSequence:J

.field private mNextTouchSequence:J

.field private mPreQueue:Landroid/webkit/WebView$QueuedTouch;

.field private mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

.field private mQueuedTouchRecycleCount:I

.field private mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

.field final synthetic this$0:Landroid/webkit/WebView;


# direct methods
.method private constructor <init>(Landroid/webkit/WebView;)V
    .locals 4
    .parameter

    .prologue
    const-wide v2, -0x7fffffffffffffffL

    .line 7992
    iput-object p1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7993
    iput-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mNextTouchSequence:J

    .line 7994
    const-wide/high16 v0, -0x8000

    iput-wide v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 7995
    iput-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    .line 8007
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastEventTime:J

    return-void
.end method

.method synthetic constructor <init>(Landroid/webkit/WebView;Landroid/webkit/WebView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 7992
    invoke-direct {p0, p1}, Landroid/webkit/WebView$TouchEventQueue;-><init>(Landroid/webkit/WebView;)V

    return-void
.end method

.method private dropStaleGestures(Landroid/view/MotionEvent;J)Z
    .locals 12
    .parameter "ev"
    .parameter "sequence"

    .prologue
    .line 8231
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_0

    iget-object v8, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mConfirmMove:Z
    invoke-static {v8}, Landroid/webkit/WebView;->access$2000(Landroid/webkit/WebView;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 8236
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastTouchX:I
    invoke-static {v9}, Landroid/webkit/WebView;->access$2100(Landroid/webkit/WebView;)I

    move-result v9

    sub-int v0, v8, v9

    .line 8237
    .local v0, dx:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastTouchY:I
    invoke-static {v9}, Landroid/webkit/WebView;->access$2200(Landroid/webkit/WebView;)I

    move-result v9

    sub-int v1, v8, v9

    .line 8238
    .local v1, dy:I
    mul-int v8, v0, v0

    mul-int v9, v1, v1

    add-int/2addr v8, v9

    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mTouchSlopSquare:I
    invoke-static {v9}, Landroid/webkit/WebView;->access$2300(Landroid/webkit/WebView;)I

    move-result v9

    if-le v8, v9, :cond_0

    .line 8239
    iget-object v8, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v8, v8, Landroid/webkit/WebView;->mPrivateHandler:Landroid/os/Handler;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Landroid/os/Handler;->removeMessages(I)V

    .line 8240
    iget-object v8, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v8, v8, Landroid/webkit/WebView;->mPrivateHandler:Landroid/os/Handler;

    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Landroid/os/Handler;->removeMessages(I)V

    .line 8244
    .end local v0           #dx:I
    .end local v1           #dy:I
    :cond_0
    iget-object v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    if-nez v8, :cond_2

    .line 8245
    iget-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    cmp-long v8, p2, v8

    if-gtz v8, :cond_1

    const/4 v8, 0x1

    .line 8292
    :goto_0
    return v8

    .line 8245
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 8250
    :cond_2
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    if-nez v8, :cond_4

    .line 8251
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    .line 8252
    .local v2, eventTime:J
    iget-wide v4, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastEventTime:J

    .line 8253
    .local v4, lastHandledEventTime:J
    const-wide/16 v8, 0x3e8

    add-long/2addr v8, v4

    cmp-long v8, v2, v8

    if-lez v8, :cond_4

    .line 8254
    const-string/jumbo v8, "webview"

    const-string v9, "Got ACTION_DOWN but still waiting on stale event. Catching up."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8256
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runQueuedAndPreQueuedEvents()V

    .line 8259
    iget-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8260
    .local v6, qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_1
    if-eqz v6, :cond_3

    iget-wide v8, v6, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    cmp-long v8, v8, p2

    if-gez v8, :cond_3

    .line 8261
    move-object v7, v6

    .line 8262
    .local v7, recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v6, v6, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8263
    invoke-direct {p0, v7}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    goto :goto_1

    .line 8265
    .end local v7           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_3
    iput-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8266
    const-wide/16 v8, 0x1

    sub-long v8, p2, v8

    iput-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8270
    .end local v2           #eventTime:J
    .end local v4           #lastHandledEventTime:J
    .end local v6           #qd:Landroid/webkit/WebView$QueuedTouch;
    :cond_4
    iget-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    const-wide/16 v10, 0x1

    sub-long/2addr v8, v10

    iget-wide v10, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    cmp-long v8, v8, v10

    if-lez v8, :cond_6

    .line 8271
    iget-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8272
    .restart local v6       #qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_2
    if-eqz v6, :cond_5

    iget-wide v8, v6, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v10, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_5

    .line 8273
    move-object v7, v6

    .line 8274
    .restart local v7       #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v6, v6, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8275
    invoke-direct {p0, v7}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    goto :goto_2

    .line 8277
    .end local v7           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_5
    iput-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8278
    iget-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    const-wide/16 v10, 0x1

    sub-long/2addr v8, v10

    iput-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8281
    .end local v6           #qd:Landroid/webkit/WebView$QueuedTouch;
    :cond_6
    iget-object v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v8, :cond_8

    .line 8283
    iget-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8284
    .restart local v6       #qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_3
    if-eqz v6, :cond_7

    iget-wide v8, v6, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v10, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_7

    .line 8285
    move-object v7, v6

    .line 8286
    .restart local v7       #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v6, v6, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8287
    invoke-direct {p0, v7}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    goto :goto_3

    .line 8289
    .end local v7           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_7
    iput-object v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8292
    .end local v6           #qd:Landroid/webkit/WebView$QueuedTouch;
    :cond_8
    iget-wide v8, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    cmp-long v8, p2, v8

    if-gtz v8, :cond_9

    const/4 v8, 0x1

    goto/16 :goto_0

    :cond_9
    const/4 v8, 0x0

    goto/16 :goto_0
.end method

.method private handleQueuedMotionEvent(Landroid/view/MotionEvent;)V
    .locals 5
    .parameter "ev"

    .prologue
    .line 8305
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastEventTime:J

    .line 8306
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 8307
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    .line 8308
    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v2, p1}, Landroid/webkit/WebView;->handleMultiTouchInWebView(Landroid/view/MotionEvent;)V

    .line 8320
    :goto_0
    return-void

    .line 8310
    :cond_0
    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mZoomManager:Landroid/webkit/ZoomManager;
    invoke-static {v2}, Landroid/webkit/WebView;->access$2400(Landroid/webkit/WebView;)Landroid/webkit/ZoomManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/ZoomManager;->getMultiTouchGestureDetector()Landroid/view/ScaleGestureDetector;

    move-result-object v1

    .line 8311
    .local v1, detector:Landroid/view/ScaleGestureDetector;
    if-eqz v1, :cond_1

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v2}, Landroid/webkit/WebView;->access$2500(Landroid/webkit/WebView;)I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    .line 8315
    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8318
    :cond_1
    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    #calls: Landroid/webkit/WebView;->handleTouchEventCommon(Landroid/view/MotionEvent;III)Z
    invoke-static {v2, p1, v0, v3, v4}, Landroid/webkit/WebView;->access$2600(Landroid/webkit/WebView;Landroid/view/MotionEvent;III)Z

    goto :goto_0
.end method

.method private handleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V
    .locals 1
    .parameter "qt"

    .prologue
    .line 8296
    iget-object v0, p1, Landroid/webkit/WebView$QueuedTouch;->mTed:Landroid/webkit/WebViewCore$TouchEventData;

    if-eqz v0, :cond_0

    .line 8297
    iget-object v0, p1, Landroid/webkit/WebView$QueuedTouch;->mTed:Landroid/webkit/WebViewCore$TouchEventData;

    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedTouchEventData(Landroid/webkit/WebViewCore$TouchEventData;)V

    .line 8302
    :goto_0
    return-void

    .line 8299
    :cond_0
    iget-object v0, p1, Landroid/webkit/WebView$QueuedTouch;->mEvent:Landroid/view/MotionEvent;

    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedMotionEvent(Landroid/view/MotionEvent;)V

    .line 8300
    iget-object v0, p1, Landroid/webkit/WebView$QueuedTouch;->mEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_0
.end method

.method private handleQueuedTouchEventData(Landroid/webkit/WebViewCore$TouchEventData;)V
    .locals 13
    .parameter "ted"

    .prologue
    const/4 v12, 0x7

    const/4 v0, 0x2

    const/4 v6, 0x1

    const/4 v1, 0x3

    const/4 v3, 0x0

    .line 8323
    iget-object v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mMotionEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_0

    .line 8324
    iget-object v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mMotionEvent:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastEventTime:J

    .line 8326
    :cond_0
    iget-boolean v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mReprocess:Z

    if-nez v2, :cond_6

    .line 8327
    iget v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mAction:I

    if-nez v2, :cond_4

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v2}, Landroid/webkit/WebView;->access$2500(Landroid/webkit/WebView;)I

    move-result v2

    if-ne v2, v6, :cond_4

    .line 8332
    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-boolean v3, p1, Landroid/webkit/WebViewCore$TouchEventData;->mNativeResult:Z

    if-eqz v3, :cond_1

    move v0, v1

    :cond_1
    #setter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v2, v0}, Landroid/webkit/WebView;->access$2502(Landroid/webkit/WebView;I)I

    .line 8342
    :cond_2
    :goto_0
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v0}, Landroid/webkit/WebView;->access$2500(Landroid/webkit/WebView;)I

    move-result v0

    if-ne v0, v1, :cond_3

    .line 8343
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mTouchHighlightRegion:Landroid/graphics/Region;
    invoke-static {v0}, Landroid/webkit/WebView;->access$2700(Landroid/webkit/WebView;)Landroid/graphics/Region;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Region;->setEmpty()V

    .line 8420
    :cond_3
    :goto_1
    return-void

    .line 8334
    :cond_4
    iget v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mAction:I

    if-ne v2, v0, :cond_2

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v2}, Landroid/webkit/WebView;->access$2500(Landroid/webkit/WebView;)I

    move-result v2

    if-ne v2, v0, :cond_2

    .line 8339
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-boolean v2, p1, Landroid/webkit/WebViewCore$TouchEventData;->mNativeResult:Z

    if-eqz v2, :cond_5

    move v3, v1

    :cond_5
    #setter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v0, v3}, Landroid/webkit/WebView;->access$2502(Landroid/webkit/WebView;I)I

    goto :goto_0

    .line 8346
    :cond_6
    iget-object v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPoints:[Landroid/graphics/Point;

    array-length v0, v0

    if-le v0, v6, :cond_8

    .line 8347
    iget-boolean v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mNativeResult:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v0}, Landroid/webkit/WebView;->access$2500(Landroid/webkit/WebView;)I

    move-result v0

    if-eq v0, v1, :cond_7

    .line 8348
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v0, v3}, Landroid/webkit/WebView;->access$2502(Landroid/webkit/WebView;I)I

    .line 8349
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p1, Landroid/webkit/WebViewCore$TouchEventData;->mMotionEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->handleMultiTouchInWebView(Landroid/view/MotionEvent;)V

    goto :goto_1

    .line 8351
    :cond_7
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mPreventDefault:I
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2502(Landroid/webkit/WebView;I)I

    goto :goto_1

    .line 8358
    :cond_8
    iget-boolean v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mNativeResult:Z

    if-nez v0, :cond_3

    .line 8360
    iget v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mAction:I

    sparse-switch v0, :sswitch_data_0

    goto :goto_1

    .line 8362
    :sswitch_0
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v1, v1, v3

    iget v1, v1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchX:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2802(Landroid/webkit/WebView;F)F

    .line 8363
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v1, v1, v3

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchY:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2902(Landroid/webkit/WebView;F)F

    .line 8364
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0, v6}, Landroid/webkit/WebView;->access$3002(Landroid/webkit/WebView;I)I

    goto :goto_1

    .line 8368
    :sswitch_1
    iget-object v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v0, v0, v3

    iget v10, v0, Landroid/graphics/Point;->x:I

    .line 8369
    .local v10, x:I
    iget-object v0, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v0, v0, v3

    iget v11, v0, Landroid/graphics/Point;->y:I

    .line 8371
    .local v11, y:I
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0}, Landroid/webkit/WebView;->access$3000(Landroid/webkit/WebView;)I

    move-result v0

    if-eq v0, v1, :cond_9

    .line 8372
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$3002(Landroid/webkit/WebView;I)I

    .line 8373
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    int-to-float v1, v10

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchX:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2802(Landroid/webkit/WebView;F)F

    .line 8374
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    int-to-float v1, v11

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchY:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2902(Landroid/webkit/WebView;F)F

    .line 8375
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    int-to-float v1, v10

    int-to-float v2, v11

    #calls: Landroid/webkit/WebView;->startScrollingLayer(FF)V
    invoke-static {v0, v1, v2}, Landroid/webkit/WebView;->access$3100(Landroid/webkit/WebView;FF)V

    .line 8376
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #calls: Landroid/webkit/WebView;->startDrag()V
    invoke-static {v0}, Landroid/webkit/WebView;->access$3200(Landroid/webkit/WebView;)V

    .line 8378
    :cond_9
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollX:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$3300(Landroid/webkit/WebView;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastDeferTouchX:F
    invoke-static {v2}, Landroid/webkit/WebView;->access$2800(Landroid/webkit/WebView;)F

    move-result v2

    add-float/2addr v1, v2

    int-to-float v2, v10

    sub-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->pinLocX(I)I

    move-result v0

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollX:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$3400(Landroid/webkit/WebView;)I

    move-result v1

    sub-int v7, v0, v1

    .line 8381
    .local v7, deltaX:I
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollY:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$3500(Landroid/webkit/WebView;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastDeferTouchY:F
    invoke-static {v2}, Landroid/webkit/WebView;->access$2900(Landroid/webkit/WebView;)F

    move-result v2

    add-float/2addr v1, v2

    int-to-float v2, v11

    sub-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->pinLocY(I)I

    move-result v0

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollY:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$3600(Landroid/webkit/WebView;)I

    move-result v1

    sub-int v8, v0, v1

    .line 8384
    .local v8, deltaY:I
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #calls: Landroid/webkit/WebView;->doDrag(II)V
    invoke-static {v0, v7, v8}, Landroid/webkit/WebView;->access$3700(Landroid/webkit/WebView;II)V

    .line 8385
    if-eqz v7, :cond_a

    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    int-to-float v1, v10

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchX:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2802(Landroid/webkit/WebView;F)F

    .line 8386
    :cond_a
    if-eqz v8, :cond_3

    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    int-to-float v1, v11

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchY:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2902(Landroid/webkit/WebView;F)F

    goto/16 :goto_1

    .line 8391
    .end local v7           #deltaX:I
    .end local v8           #deltaY:I
    .end local v10           #x:I
    .end local v11           #y:I
    :sswitch_2
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0}, Landroid/webkit/WebView;->access$3000(Landroid/webkit/WebView;)I

    move-result v0

    if-ne v0, v1, :cond_b

    .line 8393
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v0, v0, Landroid/webkit/WebView;->mScroller:Landroid/widget/OverScroller;

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollX:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$3800(Landroid/webkit/WebView;)I

    move-result v1

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mScrollY:I
    invoke-static {v2}, Landroid/webkit/WebView;->access$3900(Landroid/webkit/WebView;)I

    move-result v2

    iget-object v4, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->computeMaxScrollX()I

    move-result v4

    iget-object v5, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v5}, Landroid/webkit/WebView;->computeMaxScrollY()I

    move-result v6

    move v5, v3

    invoke-virtual/range {v0 .. v6}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 8396
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->invalidate()V

    .line 8397
    invoke-static {}, Landroid/webkit/WebViewCore;->resumePriority()V

    .line 8398
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mWebViewCore:Landroid/webkit/WebViewCore;
    invoke-static {v0}, Landroid/webkit/WebView;->access$700(Landroid/webkit/WebView;)Landroid/webkit/WebViewCore;

    move-result-object v0

    invoke-static {v0}, Landroid/webkit/WebViewCore;->resumeUpdatePicture(Landroid/webkit/WebViewCore;)V

    .line 8400
    :cond_b
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0, v12}, Landroid/webkit/WebView;->access$3002(Landroid/webkit/WebView;I)I

    goto/16 :goto_1

    .line 8404
    :sswitch_3
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v1, v1, v3

    iget v1, v1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchX:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2802(Landroid/webkit/WebView;F)F

    .line 8405
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    iget-object v1, p1, Landroid/webkit/WebViewCore$TouchEventData;->mPointsInView:[Landroid/graphics/Point;

    aget-object v1, v1, v3

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    #setter for: Landroid/webkit/WebView;->mLastDeferTouchY:F
    invoke-static {v0, v1}, Landroid/webkit/WebView;->access$2902(Landroid/webkit/WebView;F)F

    .line 8406
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mZoomManager:Landroid/webkit/ZoomManager;
    invoke-static {v0}, Landroid/webkit/WebView;->access$2400(Landroid/webkit/WebView;)Landroid/webkit/ZoomManager;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastTouchX:I
    invoke-static {v1}, Landroid/webkit/WebView;->access$2100(Landroid/webkit/WebView;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #getter for: Landroid/webkit/WebView;->mLastTouchY:I
    invoke-static {v2}, Landroid/webkit/WebView;->access$2200(Landroid/webkit/WebView;)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/webkit/ZoomManager;->handleDoubleTap(FF)V

    .line 8407
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0, v12}, Landroid/webkit/WebView;->access$3002(Landroid/webkit/WebView;I)I

    goto/16 :goto_1

    .line 8410
    :sswitch_4
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v9

    .line 8411
    .local v9, hitTest:Landroid/webkit/WebView$HitTestResult;
    if-eqz v9, :cond_c

    #getter for: Landroid/webkit/WebView$HitTestResult;->mType:I
    invoke-static {v9}, Landroid/webkit/WebView$HitTestResult;->access$4000(Landroid/webkit/WebView$HitTestResult;)I

    move-result v0

    if-eqz v0, :cond_c

    .line 8413
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->performLongClick()Z

    .line 8415
    :cond_c
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->this$0:Landroid/webkit/WebView;

    #setter for: Landroid/webkit/WebView;->mDeferTouchMode:I
    invoke-static {v0, v12}, Landroid/webkit/WebView;->access$3002(Landroid/webkit/WebView;I)I

    goto/16 :goto_1

    .line 8360
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_2
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x100 -> :sswitch_4
        0x200 -> :sswitch_3
    .end sparse-switch
.end method

.method private obtainQueuedTouch()Landroid/webkit/WebView$QueuedTouch;
    .locals 2

    .prologue
    .line 8014
    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v1, :cond_0

    .line 8015
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

    .line 8016
    .local v0, result:Landroid/webkit/WebView$QueuedTouch;
    iget-object v1, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

    .line 8017
    iget v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleCount:I

    .line 8020
    .end local v0           #result:Landroid/webkit/WebView$QueuedTouch;
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/webkit/WebView$QueuedTouch;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/webkit/WebView$QueuedTouch;-><init>(Landroid/webkit/WebView$1;)V

    goto :goto_0
.end method

.method private recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V
    .locals 2
    .parameter "qd"

    .prologue
    .line 8082
    iget v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleCount:I

    const/16 v1, 0xf

    if-ge v0, v1, :cond_0

    .line 8083
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

    iput-object v0, p1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8084
    iput-object p1, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleBin:Landroid/webkit/WebView$QueuedTouch;

    .line 8085
    iget v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mQueuedTouchRecycleCount:I

    .line 8087
    :cond_0
    return-void
.end method

.method private runNextQueuedEvents()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x1

    .line 8219
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8220
    .local v0, qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_0
    if-eqz v0, :cond_0

    iget-wide v2, v0, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v4, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 8221
    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    .line 8222
    move-object v1, v0

    .line 8223
    .local v1, recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v0, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8224
    invoke-direct {p0, v1}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    .line 8225
    iget-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v2, v6

    iput-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    goto :goto_0

    .line 8227
    .end local v1           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_0
    iput-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8228
    return-void
.end method

.method private runQueuedAndPreQueuedEvents()V
    .locals 15

    .prologue
    const-wide v7, 0x7fffffffffffffffL

    const-wide/16 v13, 0x1

    .line 8034
    iget-object v5, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8035
    .local v5, qd:Landroid/webkit/WebView$QueuedTouch;
    const/4 v0, 0x1

    .line 8036
    .local v0, fromPreQueue:Z
    :goto_0
    if-eqz v5, :cond_5

    iget-wide v9, v5, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v11, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v11, v13

    cmp-long v9, v9, v11

    if-nez v9, :cond_5

    .line 8037
    invoke-direct {p0, v5}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    .line 8038
    move-object v6, v5

    .line 8039
    .local v6, recycleMe:Landroid/webkit/WebView$QueuedTouch;
    if-eqz v0, :cond_0

    .line 8040
    iget-object v9, v5, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8044
    :goto_1
    invoke-direct {p0, v6}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    .line 8045
    iget-wide v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v9, v13

    iput-wide v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8047
    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v9, :cond_1

    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    iget-wide v1, v9, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    .line 8048
    .local v1, nextPre:J
    :goto_2
    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v9, :cond_2

    iget-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    iget-wide v3, v9, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    .line 8050
    .local v3, nextQueued:J
    :goto_3
    cmp-long v9, v1, v3

    if-gez v9, :cond_3

    const/4 v0, 0x1

    .line 8051
    :goto_4
    if-eqz v0, :cond_4

    iget-object v5, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8052
    :goto_5
    goto :goto_0

    .line 8042
    .end local v1           #nextPre:J
    .end local v3           #nextQueued:J
    :cond_0
    iget-object v9, v5, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v9, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_1

    :cond_1
    move-wide v1, v7

    .line 8047
    goto :goto_2

    .restart local v1       #nextPre:J
    :cond_2
    move-wide v3, v7

    .line 8048
    goto :goto_3

    .line 8050
    .restart local v3       #nextQueued:J
    :cond_3
    const/4 v0, 0x0

    goto :goto_4

    .line 8051
    :cond_4
    iget-object v5, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_5

    .line 8053
    .end local v1           #nextPre:J
    .end local v3           #nextQueued:J
    .end local v6           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_5
    return-void
.end method


# virtual methods
.method public enqueueTouchEvent(Landroid/view/MotionEvent;)V
    .locals 7
    .parameter "ev"

    .prologue
    const-wide/16 v5, 0x1

    .line 8195
    invoke-virtual {p0}, Landroid/webkit/WebView$TouchEventQueue;->nextTouchSequence()J

    move-result-wide v1

    .line 8197
    .local v1, sequence:J
    invoke-direct {p0, p1, v1, v2}, Landroid/webkit/WebView$TouchEventQueue;->dropStaleGestures(Landroid/view/MotionEvent;J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 8216
    :goto_0
    return-void

    .line 8203
    :cond_0
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runNextQueuedEvents()V

    .line 8205
    iget-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v3, v5

    cmp-long v3, v3, v1

    if-nez v3, :cond_1

    .line 8206
    invoke-direct {p0, p1}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedMotionEvent(Landroid/view/MotionEvent;)V

    .line 8208
    iget-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8211
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runNextQueuedEvents()V

    goto :goto_0

    .line 8213
    :cond_1
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->obtainQueuedTouch()Landroid/webkit/WebView$QueuedTouch;

    move-result-object v3

    invoke-virtual {v3, p1, v1, v2}, Landroid/webkit/WebView$QueuedTouch;->set(Landroid/view/MotionEvent;J)Landroid/webkit/WebView$QueuedTouch;

    move-result-object v0

    .line 8214
    .local v0, qd:Landroid/webkit/WebView$QueuedTouch;
    iget-object v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    if-nez v3, :cond_2

    .end local v0           #qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_1
    iput-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_0

    .restart local v0       #qd:Landroid/webkit/WebView$QueuedTouch;
    :cond_2
    iget-object v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    invoke-virtual {v3, v0}, Landroid/webkit/WebView$QueuedTouch;->add(Landroid/webkit/WebView$QueuedTouch;)Landroid/webkit/WebView$QueuedTouch;

    move-result-object v0

    goto :goto_1
.end method

.method public enqueueTouchEvent(Landroid/webkit/WebViewCore$TouchEventData;)Z
    .locals 10
    .parameter "ted"

    .prologue
    const-wide/16 v8, 0x1

    const/4 v3, 0x0

    .line 8130
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8131
    .local v0, preQueue:Landroid/webkit/WebView$QueuedTouch;
    if-eqz v0, :cond_0

    .line 8134
    iget-wide v4, v0, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v6, p1, Landroid/webkit/WebViewCore$TouchEventData;->mSequence:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 8135
    iget-object v4, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v4, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8151
    :cond_0
    :goto_0
    iget-wide v4, p1, Landroid/webkit/WebViewCore$TouchEventData;->mSequence:J

    iget-wide v6, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_4

    .line 8153
    const-string/jumbo v4, "webview"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Stale touch event "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Landroid/webkit/WebViewCore$TouchEventData;->mAction:I

    invoke-static {v6}, Landroid/view/MotionEvent;->actionToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " received from webcore; ignoring"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8182
    :cond_1
    :goto_1
    return v3

    .line 8137
    :cond_2
    move-object v1, v0

    .line 8138
    .local v1, prev:Landroid/webkit/WebView$QueuedTouch;
    const/4 v0, 0x0

    .line 8139
    :goto_2
    iget-object v4, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v4, :cond_0

    .line 8140
    iget-object v4, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iget-wide v4, v4, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v6, p1, Landroid/webkit/WebViewCore$TouchEventData;->mSequence:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_3

    .line 8141
    iget-object v0, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8142
    iget-object v4, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v4, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_0

    .line 8145
    :cond_3
    iget-object v1, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_2

    .line 8158
    .end local v1           #prev:Landroid/webkit/WebView$QueuedTouch;
    :cond_4
    iget-object v4, p1, Landroid/webkit/WebViewCore$TouchEventData;->mMotionEvent:Landroid/view/MotionEvent;

    iget-wide v5, p1, Landroid/webkit/WebViewCore$TouchEventData;->mSequence:J

    invoke-direct {p0, v4, v5, v6}, Landroid/webkit/WebView$TouchEventQueue;->dropStaleGestures(Landroid/view/MotionEvent;J)Z

    move-result v4

    if-nez v4, :cond_1

    .line 8164
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runNextQueuedEvents()V

    .line 8166
    iget-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v3, v8

    iget-wide v5, p1, Landroid/webkit/WebViewCore$TouchEventData;->mSequence:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_6

    .line 8167
    if-eqz v0, :cond_5

    .line 8168
    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    .line 8169
    const/4 v0, 0x0

    .line 8171
    :cond_5
    invoke-direct {p0, p1}, Landroid/webkit/WebView$TouchEventQueue;->handleQueuedTouchEventData(Landroid/webkit/WebViewCore$TouchEventData;)V

    .line 8173
    iget-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    add-long/2addr v3, v8

    iput-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8176
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runNextQueuedEvents()V

    .line 8182
    :goto_3
    const/4 v3, 0x1

    goto :goto_1

    .line 8179
    :cond_6
    if-eqz v0, :cond_7

    move-object v2, v0

    .line 8180
    .local v2, qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_4
    iget-object v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    if-nez v3, :cond_8

    .end local v2           #qd:Landroid/webkit/WebView$QueuedTouch;
    :goto_5
    iput-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_3

    .line 8179
    :cond_7
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->obtainQueuedTouch()Landroid/webkit/WebView$QueuedTouch;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/webkit/WebView$QueuedTouch;->set(Landroid/webkit/WebViewCore$TouchEventData;)Landroid/webkit/WebView$QueuedTouch;

    move-result-object v2

    goto :goto_4

    .line 8180
    .restart local v2       #qd:Landroid/webkit/WebView$QueuedTouch;
    :cond_8
    iget-object v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    invoke-virtual {v3, v2}, Landroid/webkit/WebView$QueuedTouch;->add(Landroid/webkit/WebView$QueuedTouch;)Landroid/webkit/WebView$QueuedTouch;

    move-result-object v2

    goto :goto_5
.end method

.method public ignoreCurrentlyMissingEvents()V
    .locals 2

    .prologue
    .line 8027
    iget-wide v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mNextTouchSequence:J

    iput-wide v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    .line 8030
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->runQueuedAndPreQueuedEvents()V

    .line 8031
    return-void
.end method

.method public nextTouchSequence()J
    .locals 4

    .prologue
    .line 8114
    iget-wide v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mNextTouchSequence:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mNextTouchSequence:J

    return-wide v0
.end method

.method public preQueueTouchEventData(Landroid/webkit/WebViewCore$TouchEventData;)V
    .locals 6
    .parameter "ted"

    .prologue
    .line 8067
    invoke-direct {p0}, Landroid/webkit/WebView$TouchEventQueue;->obtainQueuedTouch()Landroid/webkit/WebView$QueuedTouch;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/webkit/WebView$QueuedTouch;->set(Landroid/webkit/WebViewCore$TouchEventData;)Landroid/webkit/WebView$QueuedTouch;

    move-result-object v1

    .line 8068
    .local v1, newTouch:Landroid/webkit/WebView$QueuedTouch;
    iget-object v2, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    if-nez v2, :cond_0

    .line 8069
    iput-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8079
    :goto_0
    return-void

    .line 8071
    :cond_0
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8073
    .local v0, insertionPoint:Landroid/webkit/WebView$QueuedTouch;
    :goto_1
    iget-object v2, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v2, :cond_1

    iget-object v2, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iget-wide v2, v2, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    iget-wide v4, v1, Landroid/webkit/WebView$QueuedTouch;->mSequence:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 8074
    iget-object v0, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_1

    .line 8076
    :cond_1
    iget-object v2, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v2, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    .line 8077
    iput-object v1, v0, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    goto :goto_0
.end method

.method public reset()V
    .locals 5

    .prologue
    const-wide v3, -0x7fffffffffffffffL

    .line 8094
    iput-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mNextTouchSequence:J

    .line 8095
    const-wide/high16 v1, -0x8000

    iput-wide v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mLastHandledTouchSequence:J

    .line 8096
    iput-wide v3, p0, Landroid/webkit/WebView$TouchEventQueue;->mIgnoreUntilSequence:J

    .line 8097
    :goto_0
    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v1, :cond_0

    .line 8098
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8099
    .local v0, recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    iget-object v1, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mTouchEventQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8100
    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    goto :goto_0

    .line 8102
    .end local v0           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_0
    :goto_1
    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    if-eqz v1, :cond_1

    .line 8103
    iget-object v0, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8104
    .restart local v0       #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    iget-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    iget-object v1, v1, Landroid/webkit/WebView$QueuedTouch;->mNext:Landroid/webkit/WebView$QueuedTouch;

    iput-object v1, p0, Landroid/webkit/WebView$TouchEventQueue;->mPreQueue:Landroid/webkit/WebView$QueuedTouch;

    .line 8105
    invoke-direct {p0, v0}, Landroid/webkit/WebView$TouchEventQueue;->recycleQueuedTouch(Landroid/webkit/WebView$QueuedTouch;)V

    goto :goto_1

    .line 8107
    .end local v0           #recycleMe:Landroid/webkit/WebView$QueuedTouch;
    :cond_1
    return-void
.end method
