//
//  BTLoadingSubView.h
//  BTLoadingTest
//
//  Created by zanyu on 2019/8/13.
//  Copyright © 2019 stonemover. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTLoadingSubView : UIView

@property (nonatomic, strong) UIImageView * imgView;

@property (nonatomic, strong) UILabel * label;

@property (nonatomic, strong) UIButton * btn;

//中间的文字垂直居中的偏移量
@property (nonatomic, assign) CGFloat labelCenterYConstant;

//图片距离label的高度
@property (nonatomic, assign) CGFloat imgViewTopLabelConstant;

//按钮的宽度
@property (nonatomic, assign) CGFloat btnW;

//按钮的高度
@property (nonatomic, assign) CGFloat btnH;

//按钮距离label的高度
@property (nonatomic, assign) CGFloat btnTopLabelConstant;

@property (nonatomic, copy) void(^clickBlock)(void);

- (void)initSubView;

- (void)show:(NSString*_Nullable)title img:(UIImage*_Nullable)img btnStr:(NSString*_Nullable)btnStr;

- (void)createLabel;

- (void)createImg;

- (void)createBtn;


@end

NS_ASSUME_NONNULL_END
