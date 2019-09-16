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

- (void)initLoading;{
    [self initLoading:self.view.bounds];
}
- (void)initLoading:(CGRect)rect{
    [self initLoading:rect isLoading:YES];
}
- (void)initLoading:(CGRect)rect isLoading:(BOOL)isLoading{
    __weak UIViewController * weakSelf=self;
    self.loadingHelp=[[BTLoadingView alloc]initWithFrame:rect];
    self.loadingHelp.block = ^{
        [weakSelf reload];
    };
    self.loadingHelp.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.loadingHelp];
    if(isLoading){
        [self showLoading];
    }else{
        [self.loadingHelp dismiss:NO];
    }
}

- (void)showLoading{
    [self.loadingHelp showLoading];
}
- (void)showEmpty{
    [self.loadingHelp showEmpty];
}
- (void)showNetError{
    [self.loadingHelp showError];
}
- (void)showServerError{
    [self.loadingHelp showError:@"服务器开小差了^_^"];
}

- (void)reload{
    [self showLoading];
}

- (void)dismiss{
    [self.loadingHelp dismiss];
}

@end
