//
//  LoadingHelpView.m
//  Base
//
//  Created by whbt_mac on 15/11/3.
//  Copyright © 2015年 StoneMover. All rights reserved.
//

#import "BTLoadingView.h"



@interface BTLoadingView()

@property(nonatomic,assign)int w;

@property(nonatomic,assign)int h;

@property (nonatomic, assign) BOOL isShow;

@end

@implementation BTLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor whiteColor];
    self.w=self.frame.size.width;
    self.h=self.frame.size.height;
    [self initSelf];
    return self;
}

- (void)initSelf{
    __weak BTLoadingView * weakSelf=self;
    self.viewLoading=[BTLoadingConfig share].customLoadingViewBlock();
    self.viewLoading.frame=self.bounds;
    [self.viewLoading initSubView];
    self.viewLoading.clickBlock = ^{
        [weakSelf reloadClick];
    };
    self.viewLoading.label.text=[BTLoadingConfig share].loadingStr;
    self.viewLoading.imgView.image=[BTLoadingConfig share].loadingGif;
    self.viewLoading.btn.hidden=YES;
    [self addSubview:self.viewLoading];
    
    self.viewEmpty=[BTLoadingConfig share].customEmptyViewBlock();
    self.viewEmpty.frame=self.bounds;
    [self.viewEmpty initSubView];
    self.viewEmpty.clickBlock = ^{
        [weakSelf reloadClick];
    };
    self.viewEmpty.label.text=[BTLoadingConfig share].emptyStr;
    self.viewEmpty.imgView.image=[BTLoadingConfig share].emptyImg;
    
    [self addSubview:self.viewEmpty];
    
    
    self.viewError=[BTLoadingConfig share].customErrorViewBlock();
    self.viewError.frame=self.bounds;
    self.viewError.clickBlock = ^{
        [weakSelf reloadClick];
    };
    [self.viewError initSubView];
    self.viewError.label.text=[BTLoadingConfig share].errorInfo;
    self.viewError.imgView.image=[BTLoadingConfig share].errorImg;
    
    [self addSubview:self.viewError];
}

- (void)layoutSubviews{
    self.viewLoading.frame=self.bounds;
    self.viewEmpty.frame=self.bounds;
    self.viewError.frame=self.bounds;
}

- (void)reloadClick{
    if (self.block) {
        self.block();
    }
}



#pragma mark loadingView
-(void)showLoading{
    [self showLoading:nil];
}
-(void)showLoading:(NSString*_Nullable)loadingStr{
    [self showLoading:loadingStr withImg:nil];
}
-(void)showLoading:(NSString*_Nullable)loadingStr withImg:(UIImage*_Nullable)img{
    self.viewLoading.hidden=NO;
    self.viewEmpty.hidden=YES;
    self.viewError.hidden=YES;
    [self.viewLoading show:loadingStr img:img btnStr:nil];
    self.isShow=YES;
    self.hidden=NO;
}

#pragma mark loadingEmpty

-(void)showEmpty{
    [self showEmpty:nil];
}

-(void)showEmpty:(NSString*_Nullable)emptyStr{
    [self showEmpty:emptyStr withImg:nil];
}

-(void)showEmpty:(NSString*_Nullable)emptyStr withImg:(UIImage*_Nullable)img{
    [self showEmpty:emptyStr withImg:img btnStr:nil];
}

-(void)showEmpty:(NSString*_Nullable)emptyStr withImg:(UIImage*_Nullable)img btnStr:(NSString*_Nullable)btnStr{
    self.viewEmpty.hidden=NO;
    self.viewLoading.hidden=YES;
    self.viewError.hidden=YES;
    [self.viewEmpty show:emptyStr img:img btnStr:btnStr];
    self.isShow=YES;
    self.hidden=NO;
}


#pragma mark loadError
-(void)showError{
    [self showError:nil];
}

-(void)showError:(NSString*_Nullable)errorStr{
    [self showError:errorStr withImg:nil];
}

-(void)showError:(NSString*_Nullable)errorStr withImg:(UIImage*_Nullable)img{
    [self showError:errorStr withImg:img btnStr:nil];
}

-(void)showError:(NSString*_Nullable)errorStr withImg:(UIImage*_Nullable)img btnStr:(NSString*_Nullable)btnStr{
    self.viewError.hidden=NO;
    self.viewLoading.hidden=YES;
    self.viewEmpty.hidden=YES;
    [self.viewError show:errorStr img:img btnStr:btnStr];
    self.isShow=YES;
    self.hidden=NO;
}


#pragma mark NSError type
- (void)showErrorObj:(NSError*_Nullable)error withImg:(UIImage*_Nullable)img{
    NSString * info=nil;
    if (error == nil) {
        info = @"错误:error对象为空";
    }else{
        if ([error.userInfo.allKeys containsObject:@"NSLocalizedDescription"]) {
            info=[error.userInfo objectForKey:@"NSLocalizedDescription"];
        }else {
            info=error.domain;
        }
    }
    
    [self showError:info withImg:img];
}

- (void)showErrorObj:(NSError*_Nullable)error{
    [self showErrorObj:error withImg:nil];
}

- (void)showError:(NSError*_Nullable)error errorStr:(NSString*_Nullable)errorStr{
    if (error) {
        [self showErrorObj:error];
    }else{
        [self showError:errorStr];
    }
}

-(void)dismiss{
    [self dismiss:YES];
}
-(void)dismiss:(BOOL)anim{
    self.isShow=NO;
    if (anim) {
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self setAlpha:0];
        } completion:^(BOOL finished) {
            if(!self.isShow){
                self.hidden=YES;
                [self setAlpha:1];
            }
        }];
    }else{
        self.hidden=YES;
    }
}




@end
