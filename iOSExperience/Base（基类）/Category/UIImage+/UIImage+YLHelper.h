//
//  UIImage+YLHelper.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLHelper)

/** 获取纯背景色背景（CGSizeMake(1, 1)） */
+ (UIImage *)av_imageColor:(UIColor *)color;

/** 获取纯背景色背景（CGSizeMake(1, 1)） */
+ (UIImage *)av_imageColor:(UIColor *)color cornerRadius:(CGFloat)radius;
/**
 *  获取纯背景色背景
 *
 *  @param color 背景色
 *  @param size  背景大小(传入CGSizeZero返回（1，1）)
 *
 *  @return 纯色背景
 */
+ (UIImage *)av_imageColor:(UIColor *)color size:(CGSize)size;

/**
 *  获取纯颜色背景
 *
 *  @param color  背景色
 *  @param size   背景大小（传入CGSizeZero返回（1，1））
 *  @param radius 边缘角度
 *
 *  @return 纯色背景
 */
+ (UIImage *)av_imageColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius;

/** 压缩图片 */
+ (UIImage *)av_compressImage:(UIImage *)image ScaledToSize:(CGSize)newSize;

/** 按图片中心点等比例裁剪 */
- (UIImage *)av_imageByScalingAndCroppingForSize:(CGSize)targetSize;

+ (UIImage *)av_imageByScalingToMaxSize:(UIImage *)sourceImage;

@end
