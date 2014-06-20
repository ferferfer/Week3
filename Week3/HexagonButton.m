//
//  HexagonButton.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "HexagonButton.h"

@implementation HexagonButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	//// Color Declarations
	UIColor* color = [UIColor colorWithRed: 0.296 green: 0.501 blue: 0.754 alpha: 1];
	
	//// Polygon Drawing
	UIBezierPath* polygonPath = UIBezierPath.bezierPath;
	[polygonPath moveToPoint: CGPointMake(50, 0)];
	[polygonPath addLineToPoint: CGPointMake(93.3, 25)];
	[polygonPath addLineToPoint: CGPointMake(93.3, 75)];
	[polygonPath addLineToPoint: CGPointMake(50, 100)];
	[polygonPath addLineToPoint: CGPointMake(6.7, 75)];
	[polygonPath addLineToPoint: CGPointMake(6.7, 25)];
	[polygonPath closePath];
	[color setFill];
	[polygonPath fill];

}

@end
