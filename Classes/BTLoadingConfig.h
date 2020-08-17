//
//  BTLoadingHelp.h
//  moneyMaker
//
//  Created by Motion Code on 2019/2/13.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTLoadingSubView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BTLoadingHelpDelegate <NSObject>

- (void)keyBoradHeightChange;

@end

@interface BTLoadingConfig : NSObject

+ (BTLoadingConfig*)share;

@property (nonatomic, assign) CGFloat keyboardHeight;

@property (nonatomic, weak) id<BTLoadingHelpDelegate> delegate;

#pragma mark BTLoadingView相关设置

//默认加载中的文字
@property (nonatomic, strong) NSString * loadingStr;

//默认空数据的提示文字
@property (nonatomic, strong) NSString * emptyStr;

//默认界面错误的提示文字
@property (nonatomic, strong) NSString * errorInfo;

//默认加载中的图片，为gif
@property (nonatomic, strong) UIImage * loadingGif;

//空数据显示的图片
@property (nonatomic, strong) UIImage * emptyImg;

//错误界面现实的图片
@property (nonatomic, strong) UIImage * errorImg;

//自定义加载中的界面,需要每次都生成一个新的对象，默认为BTLoadingSubView
@property (nonatomic, copy) BTLoadingSubView * (^customLoadingViewBlock)(void);

//自定义空界面,需要每次都生成一个新的对象，默认为BTLoadingSubView
@property (nonatomic, copy) BTLoadingSubView * (^customEmptyViewBlock)(void);

//自定义错误的界面,需要每次都生成一个新的对象，默认为BTLoadingSubView
@property (nonatomic, copy) BTLoadingSubView * (^customErrorViewBlock)(void);


- (void)addDelegate:(id)delegate;

- (void)removeDelegate:(id)delegate;

- (UIImage*)imageBundleName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END

