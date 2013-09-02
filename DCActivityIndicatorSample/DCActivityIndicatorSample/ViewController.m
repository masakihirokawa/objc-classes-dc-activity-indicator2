//
//  ViewController.m
//  DCActivityIndicatorSample
//
//  Created by 廣川政樹 on 2013/07/01.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

typedef enum styles : NSInteger {
    GRAY        = 1,
    WHITE       = 2,
    WHITE_LARGE = 3
} styles;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)startEvent:(id)sender
{
    if ([DCActivityIndicator isAnimating]) {
        return;
    }
    [DCActivityIndicator start:self.view
                        center:self.view.center
                       styleId:GRAY
              hidesWhenStopped:YES
                   showOverlay:NO];
}

- (IBAction)stopEvent:(id)sender
{
    if (![DCActivityIndicator isAnimating]) {
        return;
    }
    [DCActivityIndicator stop];
}

@end
