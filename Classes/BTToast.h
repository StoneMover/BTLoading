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

NS_ASSUME_NONNULL_BEGIN

@interface BTToast : UIView

#pragma mark 显示在window中

+ (BTToast*)show:(NSString*_Nullable)str;
+ (BTToast*)show:(NSString*_Nullable)str img:(UIImage*_Nullable)img;
+ (BTToast*)show:(NSString*_Nullable)str img:(UIImage*_Nullable)img isInVc:(BOOL)isInVc;


+ (BTToast*)showSuccess:(NSString*_Nullable)str;
+ (BTToast*)showWarning:(NSString*_Nullable)str;

//当error对象不为空优先读取error对象信息，为空则读取errorInfo
+ (BTToast*)showErrorInfo:(NSString*_Nullable)info;
+ (BTToast*)showErrorObj:(NSError*_Nullable)error;
+ (BTToast*)showErrorObj:(NSError *_Nullable)error errorInfo:(NSString*_Nullable)errorInfo;

//MARK:显示在当前VC中
+ (BTToast*)showVc:(NSString*_Nullable)str;

+ (BTToast*)showVcSuccess:(NSString*_Nullable)str;
+ (BTToast*)showVcWarning:(NSString*_Nullable)str;

+ (BTToast*)showVcErrorInfo:(NSString*_Nullable)info;
+ (BTToast*)showVcErrorObj:(NSError*_Nullable)error;
+ (BTToast*)showVcErrorObj:(NSError *_Nullable)error errorInfo:(NSString*_Nullable)errorInfo;


//是否可以在Toast的过程中点击屏幕内容，默认可以
@property (nonatomic, assign) BOOL isClickInToast;

//显示后消失的时间，默认2s
@property (nonatomic, assign) CGFloat delayDismissTime;

- (instancetype)init:(BTToastStyle)style str:(NSString*_Nullable)str img:(UIImage*_Nullable)img;

- (void)show:(UIView*)rootView;

@end

NS_ASSUME_NONNULL_END
