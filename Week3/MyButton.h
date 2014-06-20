//
//  MyButton.h
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIView

@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) UIColor *fillColor;

-(id)initWithFrame:(CGRect)frame
						 andTitle:(NSString *)theTitle
						 andColor:(UIColor *)fillColor;

@end
