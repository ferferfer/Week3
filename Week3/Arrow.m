//
//  Arrow.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "Arrow.h"

@implementation Arrow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			self.backgroundColor=[UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
	//// Color Declarations
	UIColor* color = [UIColor colorWithRed: 0.847 green: 0.253 blue: 0.253 alpha: 1];
	UIColor* color2 = [UIColor colorWithRed: 0.439 green: 0.812 blue: 0.448 alpha: 1];
	
	//// Polygon Drawing
	UIBezierPath* polygonPath = UIBezierPath.bezierPath;
	[polygonPath moveToPoint: CGPointMake(20, -0.25)];
	[polygonPath addLineToPoint: CGPointMake(35.8, 27.12)];
	[polygonPath addLineToPoint: CGPointMake(4.2, 27.13)];
	[polygonPath closePath];
	[color setFill];
	[polygonPath fill];
	
	
	//// Rectangle Drawing
	UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(13, 27, 14, 73)];
	[color2 setFill];
	[rectanglePath fill];

}


@end
