//
//  DrawingFirstGenericViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "DrawingFirstGenericViewController.h"

@interface DrawingFirstGenericViewController ()
@property	(nonatomic)BOOL centerWithSuperView;
@end

@implementation DrawingFirstGenericViewController

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
		case 0:
			[self example1];
			break;
		case 1:
			[self example2];
			break;
		case 2:
			[self example3];
			break;
		case 3:
			[self example4];
			break;
		case 4:
			[self example5];
			break;
		case 5:
			[self example6];
			break;
		default:
			break;
	}

}

-(void)viewDidLayoutSubviews{
	if(_centerWithSuperView){
		for(UIView *tiled in self.view.subviews){
			tiled.center=self.view.center;
		}
	}
}


-(void)example1{

	UIImage *image =[UIImage imageNamed:@"Icon-60"];
	UIImage	*imageTiled=[image resizableImageWithCapInsets:UIEdgeInsetsZero
																						resizingMode:UIImageResizingModeTile];
	UIImageView *imageView=[[UIImageView alloc]initWithImage:imageTiled];
	[self.view addSubview:imageView];
	imageView.frame=CGRectMake(imageView.center.x
														 , imageView.center.y
														 , imageView.frame.size.width*3, imageView.frame.size.height*3);
		imageView.center=self.view.center;
	
}
-(void)example2{
	UIImage *image =[UIImage imageNamed:@"Icon-60"];
	UIImage	*imageTiled=[image resizableImageWithCapInsets:UIEdgeInsetsMake(18, 0, 18, 0)
																						resizingMode:UIImageResizingModeTile];
	UIImageView *imageView=[[UIImageView alloc]initWithImage:imageTiled];
	[self.view addSubview:imageView];
	imageView.frame=CGRectMake(imageView.center.x
														 , imageView.center.y
														 , imageView.frame.size.width, imageView.frame.size.height*3);
	imageView.center=self.view.center;
	
}
-(void)example3{
	
	UIImage *image =[UIImage imageNamed:@"Icon-60"];
	UIImage	*imageTiled=[image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 0, 30, 0)
																						resizingMode:UIImageResizingModeStretch];
	UIImageView *imageView=[[UIImageView alloc]initWithImage:imageTiled];
	[self.view addSubview:imageView];
	imageView.frame=CGRectMake(imageView.center.x
														 , imageView.center.y
														 , imageView.frame.size.width, imageView.frame.size.height*3);
	imageView.center=self.view.center;
	
}
-(void)example4{
	//LA IMAGEN SALE BIEN XQ HE TOCADO LOS INSENTS EN LOS XCASSETS
	UIImage *image =[UIImage imageNamed:@"button"];
	UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
	[self.view addSubview:imageView];
	imageView.frame=CGRectMake(100
														 , 100
														 , 200, 50);
	imageView.center=self.view.center;
}
-(void)example5{
	_centerWithSuperView=YES;
	UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
	NSMutableArray *images=[[NSMutableArray alloc]init];
	for (int i=1; i<7; i++) {
    UIImage *img =[UIImage imageNamed:[NSString stringWithFormat:@"Ryu_%i",i]];
		[images addObject:img];
	}
	imageView.contentMode=UIViewContentModeScaleAspectFit;
	imageView.animationImages=[images mutableCopy];
	imageView.animationDuration=0.4;
//	imageView.animationRepeatCount=2;
	[imageView startAnimating];
	
	[self.view addSubview:imageView];
	
}
-(void)example6{
	_centerWithSuperView=YES;
	UIImage *image = [UIImage imageNamed:@"Icon-60"];
	CGSize size=image.size;
	UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width/2,size.height), NO, 0);
	[image drawAtPoint:CGPointMake(-size.width/2, 0)];
	UIImage *drawingImage=UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageView *imageView=[[UIImageView alloc]initWithImage:drawingImage];
	[self.view addSubview:imageView];
	
	imageView.center=self.view.center;

	
}



@end
