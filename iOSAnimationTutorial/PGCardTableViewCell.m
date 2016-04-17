//
//  PGCardTableViewCell.m
//  PerfectVideoEditor
//
//  Created by zangqilong on 14/12/4.
//  Copyright (c) 2014年 zangqilong. All rights reserved.
//

#import "PGCardTableViewCell.h"

@implementation PGCardTableViewCell

- (void)awakeFromNib {
    
}

/*!
 *  @author  WGB  , 16-04-15 15:04:42
 *
 *  @brief UIView的 Spring动画
 *
 *  @param duration     动画时间
 *  @param delay        延时
 *  @param dampingRatio 阻尼率
 *  @param velocity      初始速度
 *  @param options      动画样式style
 *  @param animations   动画干些什么
 *  @param completion   动画完成后block的回调
 */
//+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;

/**  实现动画的延时  */
- (void)startAnimationWithDelay:(CGFloat)delayTime
{
    /**  屏幕宽度  */
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    /**  利用仿射变换平移  先移出屏幕,再利用动画回到原来的位置 */
    _cardView.transform =  CGAffineTransformMakeTranslation(screenWidth, 0);
    /**  实现动画  */
    [UIView animateWithDuration:1. delay:delayTime usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        _cardView.transform = CGAffineTransformIdentity;
    } completion:NULL];
}



@end
