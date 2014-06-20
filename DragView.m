//
//  DragView.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "DragView.h"
@interface DragView ()

@property (nonatomic,strong)UIView *dragView;

@end

@implementation DragView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//remove old red cicles in screen
	if ([touches count]==1) {
    UITouch *touch =[touches anyObject];
		CGPoint touchPoint=[touch locationInView:self];
		
		for(UIView *view in [self subviews]){
			if(CGRectContainsPoint(view.frame, touchPoint)){
				self.dragView=view;
				return;
			}
		}

		//draw a red circle where the touch occurred
		UIView *touchView =[[UIView alloc]init];
		[touchView setBackgroundColor:[UIColor redColor]];
		CGFloat size = 60;
		touchView.frame=CGRectMake(touchPoint.x - size/2, touchPoint.y - size/2, size, size);
		[self addSubview:touchView];
		self.dragView=touchView;
	}
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//i can use anyObject because in touchesbegan only have one finger
	UITouch *touch=[touches anyObject];
	self.dragView.center=[touch locationInView:self];
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
