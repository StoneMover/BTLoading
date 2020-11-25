//
//  BTProgress.h
//  loadinghelp
//
//  Created by stonemover on 2018/8/11.
//  Copyright © 2018年 StoneMover. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTProgress : UIView

//forceCloseLast:是否强制关闭上一个Loading
+ (BTProgress*)showLoading:(NSString*_Nullable)str forceCloseLast:(BOOL)forceCloseLast;

+ (BTProgress*)showLoading:(NSString*_Nullable)str;

+ (BTProgress*)showLoading;

//如果前面有一个loading，则会直接返回上一个的对象，并且不会移除上一个loading然后新建一个loading
+ (BTProgress*)showLoadingFollow;

+ (BTProgress*)showLoadingFollow:(NSString*_Nullable)str;

- (instancetype)init:(NSString*_Nullable)content;

+ (void)hideLoading;

- (void)show:(UIView*)view ;

@end


NS_ASSUME_NONNULL_END
