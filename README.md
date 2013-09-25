DCActivityIndicator
===================================

iOSのアクティビティインジケーターを制御する「DCActivityIndicator」クラスです。

このクラスでは、アクティビティインジケーターのアニメーション再生／停止／再生状況の取得を行えます。

下記よりサンプルとソースコードのダウンロードが行えます。

##ダウンロード

- <https://github.com/masakihirokawa/objc-classes-dc-activity-indicator2>

##使用方法

###アクティビティインジケーターのアニメーション再生

[DCActivityIndicator start:self.view
                    center:self.view.center
                   styleId:GRAY
          hidesWhenStopped:YES
               showOverlay:YES];

###アクティビティインジケーターのアニメーション停止

[DCActivityIndicator stop];

###アクティビティインジケーターのアニメーション再生状況取得

if ([DCActivityIndicator isAnimating]) {
    //アニメーション再生中の処理
    
}
