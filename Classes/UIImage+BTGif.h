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

+ (UIImage *)bt_animatedGIFWithData:(NSData *)data;

+ (UIImage *)bt_animatedGIFNamed:(NSString *)name bundle:(NSBundle*)b;

- (UIImage *)bt_animatedImageByScalingAndCroppingToSize:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
