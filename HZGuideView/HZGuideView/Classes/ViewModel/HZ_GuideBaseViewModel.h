//
//  HZ_GuideBaseViewModel.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZ_GuideBaseViewModel : NSObject


/**
 判断 point 是否在圆上

 @param point 点
 @param rect 圆的范围
 @return 返回是否在圆上
 */
+ (BOOL)point:(CGPoint)point inCircleRect:(CGRect)rect ;

@end

NS_ASSUME_NONNULL_END
