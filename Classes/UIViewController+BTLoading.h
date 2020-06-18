//
//  UIViewController+BTLoading.h
//  loadinghelp
//
//  Created by stonemover on 2018/8/8.
//  Copyright © 2018年 StoneMover. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTLoadingView.h"

@interface UIViewController (BTLoading)

@property (nonatomic, strong) BTLoadingView * loadingHelp;

- (void)bt_initLoading;
- (void)bt_initLoading:(CGRect)rect;
- (void)bt_initLoading:(CGRect)rect isLoading:(BOOL)isLoading;

- (void)bt_showLoading;
- (void)bt_showEmpty;
- (void)bt_showNetError;
- (void)bt_showServerError;

- (void)bt_loadingDismiss;
- (void)bt_loadingReload;

@end
