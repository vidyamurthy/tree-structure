//
//  NSMutableArray+SWUtilityButtons.m
//  SWTableViewCell
//
//  Created by Matt Bowman on 11/27/13.
//  Copyright (c) 2013 Chris Wendel. All rights reserved.
//

#import "NSMutableArray+SWUtilityButtons.h"

@implementation NSMutableArray (SWUtilityButtons)

- (void)sw_addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addObject:button];
}

- (void)sw_addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setImage:icon forState:UIControlStateNormal];
    [self addObject:button];
}

-(void)sw_addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title icon:(UIImage *)icon
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom ];
    button.backgroundColor = color;
    [button setImage:icon forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0.0, 24.0, 10.0, 24.0)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -20.0, -40.0, 0.0)];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addObject:button];
}
@end

