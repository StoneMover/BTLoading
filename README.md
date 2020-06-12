# BTLoading

一个使用简单的加载中组件，虽然已经有了

* 拥有简单的```Toast```文字提示
*  菊花加载```loading```
*  详情界面请求挡板```loading```

[Untitled.gif](https://upload-images.jianshu.io/upload_images/1243802-5df740b9069b25f2.gif?imageMogr2/auto-orient/strip)


# 如何使用
```
pod install 'BTLoading'
```

## Toast文字提示

纯文本提示

```
[BTToast show:@"Hello World"];

```
成功提示

```
[BTToast showSuccess:@"发送成功~"];
```
警告提示

```
[BTToast showWarning:@"请输入正确的手机号码，后面的文字是为了增加字符串的长度加上去的了"];
```

错误提示

```
[BTToast showErrorInfo:@"既然你并没有犯错"];

```

## BTProgress加载提示


无文字loading

```
[BTProgress showLoading:@""];
[BTProgress showLoading:nil];

```




文字loading

```
[BTProgress showLoading:@"玩命加载中..."];
```

如果你想继续上一次的loading并做出文字的改变

```
[BTProgress showLoadingFollow:@"加载过度..."];
```

最主要的方法是这个，是否强制关闭上一次的```loading```

```
+ (BTProgress*)showLoading:(NSString*)str forceCloseLast:(BOOL)forceCloseLast;

```

消失

```
[BTProgress hideLoading];
```

需要注意的是这里的```Loading```都是```show```在程序的的```window```中，如果你想展示在其它```view```中，那么初先始化它，然后```show```

```
- (instancetype)init:(NSString*)content;
- (void)show:(UIView*)view;

```

##BTLoadingView

在```vc```中使用

初始化

```
#import "UIViewController+BTLoading.h"

- (void)initLoading;
- (void)initLoading:(CGRect)rect;
- (void)initLoading:(CGRect)rect isLoading:(BOOL)isLoading;

```

相关方法

```
- (void)showLoading;
- (void)showEmpty;
- (void)showNetError;
- (void)showServerError;
- (void)dismiss;
```

在```view```中单独使用

初始化

```
self.loadingHelp=[[BTLoadingView alloc]initWithFrame:rect];
self.loadingHelp.block = ^{
    [weakSelf reload];
};
self.loadingHelp.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
[self.view addSubview:self.loadingHelp];

```

相关方法

```
[self.loadingHelp showLoading];

[self.loadingHelp showEmpty];

[self.loadingHelp showError];

[self.loadingHelp showError:@"服务器开小差了^_^"];

[self.loadingHelp dismiss];

```


