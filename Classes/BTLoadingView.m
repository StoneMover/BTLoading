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
-(void)showLoading:(NSString*)loadingStr{
    [self showLoading:loadingStr withImg:nil];
}
-(void)showLoading:(NSString*)loadingStr withImg:(UIImage*)img{
    self.viewLoading.hidden=NO;
    self.viewEmpty.hidden=YES;
    self.viewError.hidden=YES;
    [self.viewLoading show:loadingStr img:img];
    self.isShow=YES;
    self.hidden=NO;
}

#pragma mark loadingEmpty

-(void)showEmpty{
    [self showEmpty:nil];
}

-(void)showEmpty:(NSString*)emptyStr{
    [self showEmpty:emptyStr withImg:nil];
}

-(void)showEmpty:(NSString*)emptyStr withImg:(UIImage*)img{
    self.viewEmpty.hidden=NO;
    self.viewLoading.hidden=YES;
    self.viewError.hidden=YES;
    [self.viewEmpty show:emptyStr img:img];
    self.isShow=YES;
    self.hidden=NO;
}




#pragma mark loadError
-(void)showError{
    [self showError:nil];
}

-(void)showError:(NSString*)errorStr{
    [self showError:errorStr withImg:nil];
}

-(void)showError:(NSString*)errorStr withImg:(UIImage*)img{
    self.viewError.hidden=NO;
    self.viewLoading.hidden=YES;
    self.viewEmpty.hidden=YES;
    [self.viewError show:errorStr img:img];
    self.isShow=YES;
    self.hidden=NO;
}


#pragma mark NSError type
- (void)showErrorObj:(NSError*)error withImg:(UIImage*)img{
    NSString * info=nil;
    if ([error.userInfo.allKeys containsObject:@"NSLocalizedDescription"]) {
        info=[error.userInfo objectForKey:@"NSLocalizedDescription"];
    }else {
        info=error.domain;
    }
    [self showError:info withImg:img];
}

- (void)showErrorObj:(NSError*)error{
    
}

- (void)showError:(NSError*)error errorStr:(NSString*)errorStr{
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
