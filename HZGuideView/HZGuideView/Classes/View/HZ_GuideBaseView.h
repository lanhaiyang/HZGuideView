//
//  HZ_GuideBaseView.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HZ_GuideFormType) {
    HZ_GuideFormTypeRound = 0, //圆形
    HZ_GuideFormTypeRectangle,// 矩形
};

NS_ASSUME_NONNULL_BEGIN

@interface HZ_GuideBaseView : UIView


/**
 提示的image
 */
@property(nonatomic,strong) UIImageView *guideImageView;


/**
 是否显示虚线
 */
@property(nonatomic,assign) BOOL isShowDottedLine;


/**
 虚线粗细
 */
@property(nonatomic,assign) CGFloat thickness;


/**
 选择的区域
 */
@property(nonatomic,assign,readonly) CGRect selectRect;


/**
 虚线范围
 */
@property(nonatomic,assign,readonly) CGRect dottedRect;


/**
 创建指导窗口

 @param type 窗口形状
 @param rect 窗口位置
 */
- (void)creatControlWithType:(HZ_GuideFormType)type frame:(CGRect)rect;


/**
 窗口路径
 */
@property(nonatomic,strong,readonly) UIBezierPath *path;

/**
 虚线
 */
@property(nonatomic,strong,readonly) CAShapeLayer *dottedLineLayer;


/**
 是否点击在当前的选择区域中

 @param point 点击位置
 @return 是否点击
 */
- (BOOL)hz_isTapPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
