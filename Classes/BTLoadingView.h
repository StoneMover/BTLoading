//
//  LoadingHelpView.h
//  Base
//
//  Created by whbt_mac on 15/11/3.
//  Copyright © 2015年 StoneMover. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTLoadingConfig.h"
#import "BTLoadingSubView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^BTLoadingBlock)(void);

@interface BTLoadingView : UIView

@property (nonatomic, strong) BTLoadingSubView * viewLoading;

@property (nonatomic, strong) BTLoadingSubView * viewEmpty;

@property (nonatomic, strong) BTLoadingSubView * viewError;

#pragma mark 显示加载中界面
-(void)showLoading;
-(void)showLoading:(NSString*_Nullable)loadingStr;
-(void)showLoading:(NSString*_Nullable)loadingStr withImg:(UIImage*_Nullable)img;

#pragma mark 显示空界面
-(void)showEmpty:(NSString*_Nullable)emptyStr withImg:(UIImage*_Nullable)img btnStr:(NSString*_Nullable)btnStr;
-(void)showEmpty:(NSString*_Nullable)emptyStr withImg:(UIImage*_Nullable)img;
-(void)showEmpty:(NSString*_Nullable)emptyStr;
-(void)showEmpty;

#pragma mark 显示错误界面,如服务器错误,网络错误等界面
-(void)showError:(NSString*_Nullable)errorStr withImg:(UIImage*_Nullable)img btnStr:(NSString*_Nullable)btnStr;
-(void)showError:(NSString*_Nullable)errorStr withImg:(UIImage*_Nullable)img;
-(void)showError:(NSString*_Nullable)errorStr;
-(void)showError;

#pragma mark NSError type
- (void)showErrorObj:(NSError*_Nullable)error withImg:(UIImage*_Nullable)img;

- (void)showErrorObj:(NSError*_Nullable)error;

//当error不为空，显示errorObj类型，当error为空显示str类型
- (void)showError:(NSError*_Nullable)error errorStr:(NSString*_Nullable)errorStr;

#pragma mark 消失
//这里消失以后loading的view仍然在parentView中，如果需要可自己移除
-(void)dismiss;
-(void)dismiss:(BOOL)anim;

@property (nonatomic, copy) BTLoadingBlock block;

@end

NS_ASSUME_NONNULL_END
