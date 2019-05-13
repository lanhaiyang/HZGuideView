//
//  HZ_GuideBackgroundBaseViewModel.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/4/11.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideBackgroundBaseViewModel.h"

@interface HZ_GuideBackgroundBaseViewModel()

@property(nonatomic,assign) CGFloat jumpButtonSpace;
@property(nonatomic,assign) CGFloat jumpButtonHeight;

@end

@implementation HZ_GuideBackgroundBaseViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self confige];
    }
    return self;
}

-(void)confige{
    
    _jumpButtonSpace = 15;
    _jumpButtonHeight = 30;
}

/**
 获得文本宽度
 
 @param title 文本长度
 @param font 字体大小
 @return 返回大小
 */
-(CGSize)hz_jumpButtonWidthWithTitle:(NSString *)title Font:(UIFont *)font{
    
    if (title.length == 0) {
        return CGSizeMake(0, _jumpButtonHeight);
    }
    CGSize size = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, _jumpButtonHeight)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:font} context:nil].size;
    return CGSizeMake(size.width, _jumpButtonHeight);;
}


-(CGRect)hz_jumpButtonTopLeftWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size{
    
    CGFloat x = ( _jumpButtonSpace)-centreEdge.left+centreEdge.right;
    CGFloat y = 34-centreEdge.top+centreEdge.bottom;
    
    return CGRectMake(x, y, size.width, size.height);
}

-(CGRect)hz_jumpButtonTopRightWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size{
    
    CGFloat x = (rect.size.width - size.width - _jumpButtonSpace)-centreEdge.left+centreEdge.right;
    CGFloat y = 34-centreEdge.top+centreEdge.bottom;
    
    return CGRectMake(x, y, size.width, size.height);
}

-(CGRect)hz_jumpButtonBottomLeftWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size{
    
    CGFloat x = (_jumpButtonSpace)-centreEdge.left+centreEdge.right;
    CGFloat y = (rect.size.height-size.height-34)-centreEdge.top+centreEdge.bottom;
    
    return CGRectMake(x, y, size.width, size.height);
}

-(CGRect)hz_jumpButtonBottomRightWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size{
    
    CGFloat x = (rect.size.width - size.width - _jumpButtonSpace)-centreEdge.left+centreEdge.right;
    CGFloat y = (rect.size.height-size.height-34)-centreEdge.top+centreEdge.bottom;
    
    return CGRectMake(x, y, size.width, size.height);
}

@end
