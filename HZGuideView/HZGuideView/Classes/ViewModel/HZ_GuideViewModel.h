//
//  HZ_GuideViewModel.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZ_GuideViewModel : NSObject

@property(nonatomic,assign) UIEdgeInsets imageViewEdge;

/// 计算图片位置 up
-(CGRect)hz_guideCenterUpWithRect:(CGRect)guideRect imageSize:(CGSize)size;

/// 计算图片位置 down
-(CGRect)hz_guideCenterDownWithRect:(CGRect)guideRect imageSize:(CGSize)size;

/// 计算图片位置 left
-(CGRect)hz_guideCenterLeftWithRect:(CGRect)guideRect imageSize:(CGSize)size;

/// 计算图片位置 right
-(CGRect)hz_guideCenterRightWithRect:(CGRect)guideRect imageSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
