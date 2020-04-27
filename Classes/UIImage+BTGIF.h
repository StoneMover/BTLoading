//
//  UIImage+GIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BTGIF)

+ (UIImage *)bt_animatedGIFNamed:(NSString *)name bundle:(NSBundle*)b;

+ (UIImage *)bt_animatedGIFWithData:(NSData *)data;

- (UIImage *)bt_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end

