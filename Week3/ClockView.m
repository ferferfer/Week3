//
//  ClockView.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "ClockView.h"
#import "Arrow.h"

@interface ClockView(){
	
	CGPoint _midArrow;
	CGPoint _prevTouch;
}

@property	(nonatomic,strong)Arrow *arrow;

@end

@implementation ClockView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor=[UIColor clearColor];
		[self addArrow];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
	//// Color Declarations
	UIColor* color3 = [UIColor colorWithRed: 0.933 green: 0.562 blue: 0.206 alpha: 1];
	UIColor* color4 = [UIColor colorWithRed: 0.952 green: 0.246 blue: 0.246 alpha: 1];
	
	
	CGRect r=CGRectMake(0, 0, 200, 200);
	r.origin=CGPointMake(self.center.x - r.size.width/2, self.center.y - r.size.height/2);
	//// Oval Drawing
	UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: r];
	[color3 setFill];
	[ovalPath fill];
	[color4 setStroke];
	ovalPath.lineWidth = 5;
	[ovalPath stroke];
	
}

-(void)addArrow{
	self.arrow= [[Arrow alloc]initWithFrame:CGRectMake(0, 0, 40, 100)];
	[self addSubview:self.arrow];
	self.arrow.layer.anchorPoint=CGPointMake(0.5, 1);
	self.arrow.layer.position=self.center;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch=[touches anyObject];
	_prevTouch=[touch locationInView:self];
	
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch=[touches anyObject];
	CGPoint currentTouch=[touch locationInView:self];
	CGFloat amount = currentTouch.x-_prevTouch.x;
	
	self.arrow.layer.transform=CATransform3DRotate(self.arrow.layer.transform, amount*0.01, 0, 0, 1);
	
		//DON´T CALL TO DRAWRECT TO REDRAW, CALL NEEDSDISPLAY
//	[self setNeedsDisplay];
	_prevTouch=currentTouch;
	
}

@end
