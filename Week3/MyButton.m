//
//  MyButton.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "MyButton.h"

@interface MyButton ()

@property (nonatomic,strong)UIView *shadow;

@end

@implementation MyButton

-(id)initWithFrame:(CGRect)frame{
	return [self initWithFrame:frame andTitle:@"set title" andColor:[UIColor redColor]];
}

//designated initializer
-(id)initWithFrame:(CGRect)frame
					andTitle:(NSString *)theTitle
					andColor:(UIColor *)fillColor{
    self = [super initWithFrame:frame];
    if (self) {
			_title=theTitle;
			self.backgroundColor=fillColor;
			[self setUp];
    }
    return self;
}

-(void)setUp{
	UILabel *buttonTitle=[[UILabel alloc]initWithFrame:CGRectInset(self.bounds, 10, 10)];
	buttonTitle.text=self.title;
	buttonTitle.textColor=[UIColor whiteColor];
	buttonTitle.textAlignment=NSTextAlignmentCenter;
	[self addSubview:buttonTitle];
	
	CGFloat shadowHeight=5;
	self.shadow=[[UIView alloc]initWithFrame:CGRectMake(0,
																											self.bounds.size.height -shadowHeight,
																											self.bounds.size.width,
																											shadowHeight)];
	self.shadow.backgroundColor=[UIColor blackColor];
	self.shadow.alpha=0.2;
	[self addSubview:self.shadow];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	self.shadow.frame=self.bounds;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	CGFloat shadowHeight=5;
	self.shadow.frame=CGRectMake(0,
															self.bounds.size.height -shadowHeight,
															self.bounds.size.width,
															shadowHeight);
}

@end
