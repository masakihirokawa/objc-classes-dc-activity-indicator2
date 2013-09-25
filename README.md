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

##ソースコード

###DCActivityIndicator.h

#import <UIKit/UIKit.h>

#define INDICATOR_LARGE_SIZE 50
#define INDICATOR_SMALL_SIZE 20

@interface DCActivityIndicator : UIActivityIndicatorView

#pragma mark - public method
+ (void)start:(id)view center:(CGPoint)center styleId:(NSInteger)styleId hidesWhenStopped:(BOOL)hidesWhenStopped showOverlay:(BOOL)showOverlay;
+ (void)stop;
+ (BOOL)isAnimating;

@end

###DCActivityIndicator.m

#import "DCActivityIndicator.h"

@implementation DCActivityIndicator

static UIActivityIndicatorView *indicator_;
static UIView                  *overlay_;
static BOOL                    showOverlay_;

typedef NS_ENUM(NSUInteger, styles) {
    GRAY        = 1,
    WHITE       = 2,
    WHITE_LARGE = 3
};

// アニメーション開始
+ (void)start:(id)view center:(CGPoint)center styleId:(NSInteger)styleId hidesWhenStopped:(BOOL)hidesWhenStopped showOverlay:(BOOL)showOverlay
{
    // インジケーター初期化
    DCActivityIndicator.indicator = [[UIActivityIndicatorView alloc] init];
    
    // スタイルを設定
    switch (styleId) {
        case GRAY:
            DCActivityIndicator.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
            break;
        case WHITE:
            DCActivityIndicator.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
            break;
        case WHITE_LARGE:
            DCActivityIndicator.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
            break;
    }
    
    // スタイルに応じて寸法変更
    if (DCActivityIndicator.indicator.activityIndicatorViewStyle == UIActivityIndicatorViewStyleWhiteLarge) {
        DCActivityIndicator.indicator.frame = CGRectMake(0, 0, INDICATOR_LARGE_SIZE, INDICATOR_LARGE_SIZE);
    } else {
        DCActivityIndicator.indicator.frame = CGRectMake(0, 0, INDICATOR_SMALL_SIZE, INDICATOR_SMALL_SIZE);
    }
    
    // 座標をセンターに指定
    DCActivityIndicator.indicator.center = center;
    
    // 停止した時に隠れるよう設定
    DCActivityIndicator.indicator.hidesWhenStopped = hidesWhenStopped;
    
    // インジケーターアニメーション開始
    [DCActivityIndicator.indicator startAnimating];
    
    // オーバーレイ表示フラグ保持
    showOverlay_ = showOverlay;
    
    // オーバーレイ表示
    if (showOverlay_) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        overlay_ = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, screenSize.width == 320 && screenSize.height == 568 ? 568 : 480)];
        overlay_.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
        [view addSubview:overlay_];
    }
    
    // 画面に追加
    [view addSubview:DCActivityIndicator.indicator];
}

// アニメーション停止
+ (void)stop
{
    if (showOverlay_) {
        [overlay_ removeFromSuperview];
    }
    [DCActivityIndicator.indicator stopAnimating];
}

// アニメーション中であるか
+ (BOOL)isAnimating
{
    return [DCActivityIndicator.indicator isAnimating];
}

+ (void)setIndicator:(UIActivityIndicatorView *)indicator
{
    indicator_ = indicator;
}

+ (UIActivityIndicatorView *)indicator
{
    return indicator_;
}

@end
