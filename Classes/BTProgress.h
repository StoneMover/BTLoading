//
//  BTProgress.h
//  loadinghelp
//
//  Created by stonemover on 2018/8/11.
//  Copyright © 2018年 StoneMover. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BTProgressStyle) {
    BTProgressStyleLoading=0,
    BTProgressStyleProgress
};

@interface BTProgress : UIView

//forceCloseLast:是否强制关闭上一个Loading
+ (BTProgress*)showLoading:(NSString*)str forceCloseLast:(BOOL)forceCloseLast;

+ (BTProgress*)showLoading:(NSString*)str;

+ (BTProgress*)showLoading;

//如果前面有一个loading，则会直接返回上一个的对象，并且不会移除上一个loading然后新建一个loading
+ (BTProgress*)showLoadingFollow;

+ (BTProgress*)showLoadingFollow:(NSString*)str;

- (instancetype)init:(NSString*)content;

+ (void)hideLoading;

- (void)show:(UIView*)view ;

@end
