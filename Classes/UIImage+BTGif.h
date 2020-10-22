//
//  UIImage+BTGif.h
//  BTLoadingTest
//
//  Created by apple on 2020/6/4.
//  Copyright © 2020 stonemover. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BTGif)

+ (UIImage * _Nullable)bt_animatedGIFWithData:(NSData *)data;

+ (UIImage *_Nullable)bt_animatedGIFWithData:(NSData *)data scale:(NSInteger)scale;

+ (UIImage * _Nullable)bt_animatedGIFNamed:(NSString *)name bundle:(NSBundle*)b;

- (UIImage * _Nullable)bt_animatedImageByScalingAndCroppingToSize:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
