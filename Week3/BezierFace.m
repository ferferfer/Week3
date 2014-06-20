//
//  BecierFace.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "BezierFace.h"
@interface BezierFace(){

	CGPoint _midMouth;
	CGPoint _prevTouch;
}
@end

@implementation BezierFace

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			self.backgroundColor=[UIColor whiteColor];
			_midMouth=CGPointMake(self.center.x, self.center.y+100);
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
	
	UIBezierPath *face=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.center.x-100, self.center.y-100, 200, 200)];
	
	UIBezierPath *eyeR=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.center.x-60, self.center.y-60, 20, 20)];

	UIBezierPath *eyeL=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.center.x+50, self.center.y-60, 20, 20)];
	
	UIBezierPath *mouth=[UIBezierPath bezierPath];
	[mouth moveToPoint:CGPointMake(self.center.x-60, self.center.y+30)];
	[mouth addQuadCurveToPoint:CGPointMake(self.center.x+60, self.center.y+30) controlPoint:_midMouth];
	
  [[UIColor blueColor]setStroke];
	[eyeL stroke];
	[eyeR stroke];
	[face stroke];
	[mouth stroke];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch=[touches anyObject];
	_prevTouch=[touch locationInView:self];
	
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch=[touches anyObject];
	CGPoint currentTouch=[touch locationInView:self];
	CGFloat amount = currentTouch.y-_prevTouch.y;
	if((_midMouth.y + amount<=400)&&(_midMouth.y + amount>=250)){
		_midMouth=CGPointMake(_midMouth.x, _midMouth.y+amount);
	}
	//DON´T CALL TO DRAWRECT TO REDRAW, CALL NEEDSDISPLAY
	[self setNeedsDisplay];
	_prevTouch=currentTouch;
	
}
@end
