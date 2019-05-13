//
//  HZ_GuideBackgroundBaseViewModel.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/4/11.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZ_GuideBackgroundBaseViewModel : NSObject

@property(nonatomic,strong) NSArray<NSString *> *guideHiddenClass;



/**
 获得文本宽度

 @param title 文本长度
 @param font 字体大小
 @return 返回大小
 */
-(CGSize)hz_jumpButtonWidthWithTitle:(NSString *)title Font:(UIFont *)font;


-(CGRect)hz_jumpButtonTopLeftWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size;

-(CGRect)hz_jumpButtonTopRightWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size;

-(CGRect)hz_jumpButtonBottomLeftWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size;

-(CGRect)hz_jumpButtonBottomRightWithSuperViewRect:(CGRect)rect centreEdge:(UIEdgeInsets)centreEdge size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
