DCActivityIndicator
===================================

iOSのアクティビティインジケーターを制御する「DCActivityIndicator」クラスです。

このクラスでは、アクティビティインジケーターのアニメーション再生／停止／再生状況の取得を行えます。

##使用方法

###アクティビティインジケーターのアニメーション再生

```objective-c
[DCActivityIndicator start:self.view
                    center:self.view.center
                   styleId:GRAY
          hidesWhenStopped:YES
               showOverlay:YES];
```

###アクティビティインジケーターのアニメーション停止

```objective-c
[DCActivityIndicator stop];
```

###アクティビティインジケーターのアニメーション再生状況取得

```objective-c
if ([DCActivityIndicator isAnimating]) {
    //アニメーション再生中の処理
    
}
```
