//
//  CoreGraphicsViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "CoreGraphicsViewController.h"
#import "BezierFace.h"

@interface CoreGraphicsViewController ()

@end

@implementation CoreGraphicsViewController

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
	switch (self.exampleNumber) {
		case 11:
			[self example11];
			break;
		case 12:
			[self example12];
			break;
		case 13:
			[self example13];
			break;
		case 14:
			//[self example4];
			break;
		case 15:
			//[self example5];
			break;
		case 16:
			//[self example6];
			break;
		default:
			break;
	}
}

-(void)example11{
	BezierFace	*face =[[BezierFace alloc]initWithFrame:self.view.frame];
	[self.view addSubview:face];
}

-(void)example12{

//CON UIKIT
//	UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 150), NO, 0);
//	
//	
//	UIBezierPath *triangle = [UIBezierPath bezierPath];
//	[triangle moveToPoint:CGPointMake(100, 0)];
//	[triangle addLineToPoint:CGPointMake(120, 25)];
//	[triangle addLineToPoint:CGPointMake(80, 25)];
//	[triangle closePath];
//	
//	[[UIColor blackColor]setFill];
//	triangle.lineWidth = 4.0;
//	[triangle fill];
//	
//	UIImage* triangleImage=UIGraphicsGetImageFromCurrentImageContext();
//	UIGraphicsEndImageContext();
//	UIImageView *imageView =[[UIImageView alloc]initWithImage:triangleImage];
//	imageView.center=self.view.center;
//	[self.view addSubview:imageView];
//	
//	
//	
//	
//	UIBezierPath *rect = [UIBezierPath bezierPath];
//	[rect moveToPoint:CGPointMake(100, 25)];
//	[rect addLineToPoint:CGPointMake(100, 125)];
//	[[UIColor blueColor]setFill];
//	rect.lineWidth = 30.0;
//	[rect fill];
//	UIImage* rectImage=UIGraphicsGetImageFromCurrentImageContext();
//	UIGraphicsEndImageContext();
//	UIImageView *rectView =[[UIImageView alloc]initWithImage:rectImage];
//	rectView.center=self.view.center;
//	[self.view addSubview:rectView];
	
	
	
	
	
	//CON COREGRAPHICS
	//make context
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);
  CGContextRef con = UIGraphicsGetCurrentContext();
	
	//drawing in the context
	CGContextMoveToPoint(con, 100, 0);
	CGContextAddLineToPoint(con, 150, 50);
	CGContextAddLineToPoint(con, 50, 50);
	CGContextClosePath(con);
	//fill with color
  CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
  CGContextFillPath(con);
	
	CGContextMoveToPoint(con, 120, 50);
	CGContextAddLineToPoint(con, 120, 200);
	CGContextAddLineToPoint(con, 80, 200);
	CGContextAddLineToPoint(con, 80, 50);
	CGContextClosePath(con);
	
	//fill with color
  CGContextSetFillColorWithColor(con, [UIColor blackColor].CGColor);
  CGContextFillPath(con);
  
	//make an image and imageView and adding it to a subview
	UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  UIImageView *imView = [[UIImageView alloc]initWithImage:im];
  imView.center = CGPointMake(self.view.center.x,
                                self.view.center.y);
	[self.view addSubview:imView];
	
	
}


-(void)example13{
	//CON COREGRAPHICS
	
	UIImage *image =[UIImage imageNamed:@"programmer"];
	//make context
  UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0);
  CGContextRef con = UIGraphicsGetCurrentContext();
	CGContextAddEllipseInRect(con, CGRectMake(image.size.width/2, image.size.height/2, image.size.width, image.size.width/2));
	CGContextAddEllipseInRect(con, CGRectMake(image.size.width/2, image.size.height/2, image.size.width-80, image.size.width/2));
	CGContextAddEllipseInRect(con, CGRectMake(image.size.width/2, image.size.height/2, image.size.width-120, image.size.width/2));
	CGContextAddEllipseInRect(con, CGRectMake(image.size.width/2, image.size.height/2, image.size.width-160, image.size.width/2));
	CGContextAddEllipseInRect(con, CGRectMake(image.size.width/2, image.size.height/2, image.size.width-200, image.size.width/2));
	CGContextEOClip(con);
	
//Draw the image
	[image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
	//Get the image from current context as UIImage
	UIImage *imageContext = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageView *imageView = [[UIImageView alloc]initWithImage:imageContext];
	imageView.center = self.view.center;
	[self.view addSubview:imageView];
	
	
//	ROMBO
//	UIImage *image = [UIImage imageNamed:@"dog"];
//	CGSize size = CGSizeMake(image.size.width/2, image.size.height/2);
//	UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0);
//	CGContextRef con = UIGraphicsGetCurrentContext();
//	//Draw clip mask
//	CGContextMoveToPoint(con, 0, size.height/2);
//	CGContextAddLineToPoint(con, size.width/2, 0);
//	CGContextAddLineToPoint(con, size.width, size.height/2);
//	CGContextAddLineToPoint(con, size.width/2, size.height);
//	CGContextClosePath(con);
//	CGContextEOClip(con);
//	//Draw the image
//	[image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//	//Get the image from current context as UIImage
//	UIImage *im = UIGraphicsGetImageFromCurrentImageContext();
//	UIGraphicsEndImageContext();
//	UIImageView *iView = [[UIImageView alloc]initWithImage:im];
//	[self.view addSubview:iView];
//	iView.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backToMainPressed:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
