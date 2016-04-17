//
//  TransformViewController.m
//  iOSAnimationTutorial
//
//  Created by 臧其龙 on 16/4/10.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransformViewController.h"
#import "CABasicAnimationDemo.h"

@interface TransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation TransformViewController



- (IBAction)startTransformXAxisAnimation:(id)sender
{
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kXAxisTransform WithDegrees:90 withAnchorPoint:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformX"];
}


- (IBAction)startTransformYAxisAnimation:(id)sender
{
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kYAxisTransform WithDegrees:90 withAnchorPoint:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformY"];
}


- (IBAction)startTransformZAxisAnimation:(id)sender
{
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kZAxisTransform WithDegrees:90 withAnchorPoint:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformZ"];
}


@end
