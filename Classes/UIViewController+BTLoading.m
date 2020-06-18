//
//  UIViewController+BTLoading.m
//  loadinghelp
//
//  Created by stonemover on 2018/8/8.
//  Copyright © 2018年 StoneMover. All rights reserved.
//

#import "UIViewController+BTLoading.h"
#import <objc/runtime.h>
#import "BTToast.h"

static const char BTLoadingHelpKey;

@implementation UIViewController (BTLoading)

- (void)setLoadingHelp:(BTLoadingView *)loadingHelp{
    objc_setAssociatedObject(self, &BTLoadingHelpKey, loadingHelp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BTLoadingView*)loadingHelp{
    return objc_getAssociatedObject(self, &BTLoadingHelpKey);
}

- (void)bt_initLoading;{
    [self bt_initLoading:self.view.bounds];
}
- (void)bt_initLoading:(CGRect)rect{
    [self bt_initLoading:rect isLoading:YES];
}
- (void)bt_initLoading:(CGRect)rect isLoading:(BOOL)isLoading{
    __weak UIViewController * weakSelf=self;
    self.loadingHelp=[[BTLoadingView alloc]initWithFrame:rect];
    self.loadingHelp.block = ^{
        [weakSelf bt_loadingReload];
    };
    self.loadingHelp.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.loadingHelp];
    if(isLoading){
        [self bt_showLoading];
    }else{
        [self.loadingHelp dismiss:NO];
    }
}

- (void)bt_showLoading{
    [self.loadingHelp showLoading];
}
- (void)bt_showEmpty{
    [self.loadingHelp showEmpty];
}
- (void)bt_showNetError{
    [self.loadingHelp showError];
}
- (void)bt_showServerError{
    [self.loadingHelp showError:@"服务器开小差了^_^"];
}

- (void)bt_loadingReload{
    [self bt_showLoading];
}

- (void)bt_loadingDismiss{
    [self.loadingHelp dismiss];
}

@end
