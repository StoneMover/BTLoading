//
//  BTLoadingHelp.m
//  moneyMaker
//
//  Created by Motion Code on 2019/2/13.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import "BTLoadingConfig.h"
#import "UIImage+BTGif.h"

static BTLoadingConfig * help=nil;

@interface BTLoadingConfig()

@property (nonatomic, strong) NSMutableArray * delegates;

@end



@implementation BTLoadingConfig

+(void)load
{
    [self performSelectorOnMainThread:@selector(share) withObject:nil waitUntilDone:NO];
}

+ (BTLoadingConfig*)share{
    if (!help) {
        help=[BTLoadingConfig new];
    }
    
    return help;
}

- (instancetype)init{
    self=[super init];
    self.delegates=[NSMutableArray new];
    self.loadingStr=@"玩命加载中...";
    self.emptyStr=@"貌似这里什么都没有";
    self.errorInfo=@"似乎断开了与互联网的连接";
    self.loadingGif=[UIImage bt_animatedGIFNamed:@"bt_loading_icon" bundle:[NSBundle bundleForClass:[self class]]];
    self.errorImg=[self imageBundleName:@"bt_loading_empty"];
    self.emptyImg=[self imageBundleName:@"bt_loading_error"];
    [self initNotification];
    [self initDefaultView];
    return self;
}

- (void)initNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)initDefaultView{
    self.customLoadingViewBlock = ^BTLoadingSubView * _Nonnull{
        return [[BTLoadingSubView alloc] init];
    };
    
    self.customEmptyViewBlock = ^BTLoadingSubView * _Nonnull{
        return [[BTLoadingSubView alloc] init];
    };
    
    self.customErrorViewBlock = ^BTLoadingSubView * _Nonnull{
        return [[BTLoadingSubView alloc] init];
    };
    
}



- (void)addDelegate:(id)delegate{
    [self.delegates addObject:delegate];
}
- (void)removeDelegate:(id)delegate{
    [self.delegates removeObject:delegate];
}

#pragma mark 键盘监听
//当键盘消失的时候调用
- (void)keyboardWillHide:(NSNotification *)notif {
    self.keyboardHeight=0;
    for (id del in self.delegates) {
        if ([del respondsToSelector:@selector(keyBoradHeightChange)]) {
            [del keyBoradHeightChange];
        }
    }
}

//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat h = keyboardRect.size.height;
    if (h==self.keyboardHeight) {
        return;
    }
    self.keyboardHeight=h;
    for (id del in self.delegates) {
        if ([del respondsToSelector:@selector(keyBoradHeightChange)]) {
            [del keyBoradHeightChange];
        }
    }
}

- (UIImage*)imageBundleName:(NSString*)name{
    NSBundle * bundle = [NSBundle bundleForClass:[self class]];
    UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"BTLoadingBundle.bundle/%@",name] inBundle:bundle compatibleWithTraitCollection:nil];
    return img;
}


@end
