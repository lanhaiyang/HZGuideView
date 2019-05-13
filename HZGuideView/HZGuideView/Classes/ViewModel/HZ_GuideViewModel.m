//
//  HZ_GuideViewModel.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideViewModel.h"

@implementation HZ_GuideViewModel

-(CGRect)hz_guideCenterUpWithRect:(CGRect)guideRect imageSize:(CGSize)size{
    
    CGFloat x = ((guideRect.origin.x + (guideRect.size.width/2))-size.width/2) - _imageViewEdge.left + _imageViewEdge.right;
    CGFloat y = guideRect.origin.y - size.height - _imageViewEdge.top + _imageViewEdge.bottom;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    return CGRectMake(x, y, width, height);
}

-(CGRect)hz_guideCenterDownWithRect:(CGRect)guideRect imageSize:(CGSize)size{
    
    CGFloat x = ((guideRect.origin.x + (guideRect.size.width/2))-size.width/2)  - _imageViewEdge.left + _imageViewEdge.right;
    CGFloat y = guideRect.origin.y + guideRect.size.height - _imageViewEdge.top + _imageViewEdge.bottom;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    return CGRectMake(x, y, width, height);
}

-(CGRect)hz_guideCenterLeftWithRect:(CGRect)guideRect imageSize:(CGSize)size{
    
    CGFloat x = guideRect.origin.x - size.width - _imageViewEdge.left + _imageViewEdge.right;
    CGFloat y = guideRect.origin.y - guideRect.size.height/2 - _imageViewEdge.top + _imageViewEdge.bottom;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    return CGRectMake(x, y, width, height);
}

-(CGRect)hz_guideCenterRightWithRect:(CGRect)guideRect imageSize:(CGSize)size{
    
    CGFloat x = guideRect.origin.x + guideRect.size.width - _imageViewEdge.left + _imageViewEdge.right;
    CGFloat y = guideRect.origin.y - guideRect.size.height/2 - _imageViewEdge.top + _imageViewEdge.bottom;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    return CGRectMake(x, y, width, height);
}

@end
