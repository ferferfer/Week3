//
//  DrawingLinesView.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "DrawingLinesView.h"

@implementation DrawingLinesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			[self addLayers];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)addLayers{
	CAShapeLayer *layer1= [CAShapeLayer layer];
	layer1.path=[self path1].CGPath;
	layer1.lineWidth=2;
	layer1.strokeColor=[UIColor whiteColor].CGColor;
	layer1.fillColor=[UIColor clearColor].CGColor;
	[self.layer	addSublayer:layer1];

	CAShapeLayer *layer2= [CAShapeLayer layer];
	layer2.path=[self path2].CGPath;
	layer2.lineWidth=2;
	layer2.strokeColor=[UIColor whiteColor].CGColor;
	layer2.fillColor=[UIColor clearColor].CGColor;
	[self.layer	addSublayer:layer2];

	//ANIMATION
	CABasicAnimation*animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	animation.duration=2;
	animation.fromValue=@0;
	animation.toValue=@1;
	[layer1 addAnimation:animation forKey:@"1"];
	[layer2 addAnimation:animation forKey:@"12"];

	CABasicAnimation*animation2=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
	animation2.duration=2;
	animation2.fromValue=@0;
	animation2.toValue=@1;
	animation2.beginTime=CACurrentMediaTime()+ 2;//DELAY!!!! :D
	[layer1 addAnimation:animation2 forKey:@"123"];
	[layer2 addAnimation:animation2 forKey:@"123123"];
	
	
	
	
}

-(UIBezierPath *)path1{
	UIBezierPath* bezierPath = UIBezierPath.bezierPath;
	[bezierPath moveToPoint: CGPointMake(128.5, 207.5)];
	[bezierPath addLineToPoint: CGPointMake(172.5, 181.5)];
	[bezierPath addLineToPoint: CGPointMake(214.5, 207.5)];
	[bezierPath addLineToPoint: CGPointMake(214.5, 253.5)];
	[bezierPath addLineToPoint: CGPointMake(214.5, 388.5)];
	[bezierPath addLineToPoint: CGPointMake(172.5, 412.5)];
	[bezierPath addLineToPoint: CGPointMake(128.5, 388.5)];
	[bezierPath addLineToPoint: CGPointMake(128.5, 339.5)];
	[bezierPath addLineToPoint: CGPointMake(172.5, 314.5)];
	[bezierPath addLineToPoint: CGPointMake(214.5, 339.5)];
	[bezierPath addLineToPoint: CGPointMake(214.5, 339.5)];
	return bezierPath;
}

-(UIBezierPath *)path2{
	UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
	[bezier3Path moveToPoint: CGPointMake(213.5, 255.5)];
	[bezier3Path addLineToPoint: CGPointMake(171.5, 281.5)];
	[bezier3Path addLineToPoint: CGPointMake(127.5, 255.5)];
	[bezier3Path addLineToPoint: CGPointMake(127.5, 207.5)];
	[bezier3Path addLineToPoint: CGPointMake(127.5, 117.5)];
	[bezier3Path addLineToPoint: CGPointMake(127.5, 67.5)];
	[bezier3Path addLineToPoint: CGPointMake(171.5, 41.5)];
	[bezier3Path addLineToPoint: CGPointMake(213.5, 67.5)];
	[bezier3Path addLineToPoint: CGPointMake(213.5, 117.5)];
	[bezier3Path addLineToPoint: CGPointMake(171.5, 142.5)];
	[bezier3Path addLineToPoint: CGPointMake(127.5, 117.5)];
	return bezier3Path;
}

@end
