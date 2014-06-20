//
//  ScrollTestViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "ScrollTestViewController.h"

@interface ScrollTestViewController ()
@property	(nonatomic,strong)CAScrollLayer *scrollLayer;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ScrollTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initSubLayer];
    // Do any additional setup after loading the view.
}


-(void)initSubLayer{
	self.scrollLayer=[CAScrollLayer layer];
	self.scrollLayer.bounds=CGRectMake(0, 0, self.view.bounds.size.width*2, self.view.bounds.size.height);
	self.scrollLayer.backgroundColor=[UIColor whiteColor].CGColor;
	self.scrollLayer.anchorPoint=CGPointMake(0, 0);
	self.scrollLayer.position=CGPointZero;
	[self.view.layer insertSublayer:self.scrollLayer below:self.button.layer];

	
	CAGradientLayer *gLayer =[CAGradientLayer layer];
	gLayer.colors=@[(id)[UIColor greenColor].CGColor,
									(id)[UIColor blueColor].CGColor,
									(id)[UIColor redColor].CGColor];
	gLayer.locations=@[@0,@0.5,@1];
	gLayer.bounds=CGRectMake(0, 0, 300, 300);
	gLayer.position=self.view.center;
	gLayer.startPoint=CGPointZero;
	gLayer.endPoint=CGPointMake(0, 1);
//	gLayer.type=@"radial";
	[self.scrollLayer addSublayer:gLayer];
	
	
	CAShapeLayer *cLayer=[CAShapeLayer layer];
	cLayer.path=[self drawPath].CGPath;
	cLayer.bounds=CGRectMake(0, 0, 320, 400);
	cLayer.lineWidth=7;
//	cLayer.strokeEnd=1;
	cLayer.strokeColor=[UIColor redColor].CGColor;
	cLayer.fillColor=[UIColor yellowColor].CGColor;
	cLayer.position=self.view.center;
	[self.scrollLayer addSublayer:cLayer];
	
	CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	animation.duration=3;
	animation.fromValue=@0.0;
	animation.toValue=@1.0;
	[cLayer addAnimation:animation forKey:@"stroke"];
	
//	CALayer *layer1=[CALayer layer];
//	UIImage *image1=[UIImage imageNamed:@"works"];
//	layer1.bounds=CGRectMake(0, 0, 100, 100);
//	//el gravity se come los bounds
//	//	layer1.contentsGravity=kCAGravityCenter;
//	layer1.position=self.view.center;
//	//ESTO ES LO MISMO
//	layer1.position=CGPointMake(self.scrollLayer.bounds.size.width/4, self.scrollLayer.bounds.size.height/2);
//	layer1.contents=(id)image1.CGImage;
//	[self.scrollLayer addSublayer:layer1];
	
	CALayer *layer2=[CALayer layer];
	UIImage *image2=[UIImage imageNamed:@"Best-script"];
	layer2.bounds=CGRectMake(0, 0, 300, 300);
	//el gravity se come los bounds
	//	layer2.contentsGravity=kCAGravityCenter;
	layer2.position=CGPointMake(self.view.center.x + CGRectGetWidth(self.view.frame) , self.view.center.y);
	layer2.contents=(id)image2.CGImage;
	[self.scrollLayer addSublayer:layer2];
	
}

-(UIBezierPath *)drawPath{
	
	//// Star Drawing
	UIBezierPath* starPath = UIBezierPath.bezierPath;
	[starPath moveToPoint: CGPointMake(160, 66)];
	[starPath addLineToPoint: CGPointMake(197.74, 122.09)];
	[starPath addLineToPoint: CGPointMake(261.76, 141.32)];
	[starPath addLineToPoint: CGPointMake(221.06, 195.21)];
	[starPath addLineToPoint: CGPointMake(222.89, 263.18)];
	[starPath addLineToPoint: CGPointMake(160, 240.4)];
	[starPath addLineToPoint: CGPointMake(97.11, 263.18)];
	[starPath addLineToPoint: CGPointMake(98.94, 195.21)];
	[starPath addLineToPoint: CGPointMake(58.24, 141.32)];
	[starPath addLineToPoint: CGPointMake(122.26, 122.09)];
	[starPath closePath];
	return starPath;

}

- (IBAction)buttonPressed:(id)sender {
	
	if (self.button.tag==0) {
    [self.scrollLayer scrollToPoint:CGPointMake(self.view.bounds.size.width,0)];
		self.button.tag=1;
	}else{
    [self.scrollLayer scrollToPoint:CGPointMake(0,0)];
		self.button.tag=0;
	}
}

@end
