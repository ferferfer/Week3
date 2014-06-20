//
//  MultipleTouchView.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "MultipleTouchView.h"

@implementation MultipleTouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			[self setMultipleTouchEnabled:YES];
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//remove old red cicles in screen
	for (UIView *view in [self subviews]){
    [view removeFromSuperview];
	}
	//enumerate over all teh touches and draw a red dot on the screen where the touches were
	[touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop){
		//Get a single touch and it´s location
		UITouch *touch=obj;
		CGPoint point=[touch locationInView:self];
		
		//draw a red circle where the touch occurred
		UIView *touchView =[[UIView alloc]init];
		[touchView setBackgroundColor:[UIColor redColor]];
		touchView.frame=CGRectMake(point.x, point.y, 30, 30);
		[self addSubview:touchView];
	}];
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
