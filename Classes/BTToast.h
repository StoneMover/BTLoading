//
//  BTToast.h
//  loadinghelp
//
//  Created by stonemover on 2018/8/11.
//  Copyright © 2018年 StoneMover. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,BTToastStyle) {
    BTToastStyleCenter=0,
    BTToastStyleTop
};



@interface BTToast : UIView

#pragma mark 显示在window中

+ (BTToast*)show:(NSString*)str;
+ (BTToast*)show:(NSString*)str img:(UIImage*)img;
+ (BTToast*)show:(NSString*)str img:(UIImage*)img isInVc:(BOOL)isInVc;


+ (BTToast*)showSuccess:(NSString*)str;
+ (BTToast*)showWarning:(NSString*)str;

//当error对象不为空优先读取error对象信息，为空则读取errorInfo
+ (BTToast*)showErrorInfo:(NSString*)info;
+ (BTToast*)showErrorObj:(NSError*)error;
+ (BTToast*)showErrorObj:(NSError *)error errorInfo:(NSString*)errorInfo;

//MARK:显示在当前VC中
+ (BTToast*)showVc:(NSString*)str;

+ (BTToast*)showVcSuccess:(NSString*)str;
+ (BTToast*)showVcWarning:(NSString*)str;

+ (BTToast*)showVcErrorInfo:(NSString*)info;
+ (BTToast*)showVcErrorObj:(NSError*)error;
+ (BTToast*)showVcErrorObj:(NSError *)error errorInfo:(NSString*)errorInfo;


//是否可以在Toast的过程中点击屏幕内容，默认可以
@property (nonatomic, assign) BOOL isClickInToast;

//显示后消失的时间，默认2s
@property (nonatomic, assign) CGFloat delayDismissTime;

- (instancetype)init:(BTToastStyle)style str:(NSString*)str img:(UIImage*)img;

- (void)show:(UIView*)rootView;

@end
