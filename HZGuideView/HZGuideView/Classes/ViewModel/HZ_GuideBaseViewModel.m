//
//  HZ_GuideBaseViewModel.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideBaseViewModel.h"

@implementation HZ_GuideBaseViewModel


+ (BOOL)point:(CGPoint)point inCircleRect:(CGRect)rect {
    
    //通过圆心距 测量是否在圆上
    CGFloat radius = rect.size.width/2.0;
    CGPoint center = CGPointMake(rect.origin.x, rect.origin.y);
    double dx = fabs(point.x - center.x);
    double dy = fabs(point.y - center.y);
    
    double dis = 0.0;
    if (dx <= dy) {
        dis = sqrt((dy*dy)+(dx * dx));
    }
    else{
        dis = sqrt((dx*dx)+(dy * dy));
    }
    
    return dis <= radius;
}

@end
