//
//  GenericViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "GenericViewController.h"
#import "MyButton.h"
#import "MultipleTouchView.h"
#import "DragView.h"

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface GenericViewController ()

@end

@implementation GenericViewController

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
		case 6:
			[self example7];
			break;
		case 7:
			[self example8];
			break;
		default:
			break;
	}
}




-(void)example1{
	CGRect blueViewFrame=CGRectMake(100, 100, 100, 200);
	UIView *blueView=[[UIView alloc]initWithFrame:blueViewFrame];
	blueView.backgroundColor=[UIColor blueColor];
	[self.view addSubview:blueView];
	
//	CGRect greenViewFrame=CGRectMake(10, 10, 80, 180);
	//la mejor forma es la siguiente
	CGRect greenViewFrame=CGRectInset(blueView.bounds, 10, 10);
	UIView *greenView=[[UIView alloc]initWithFrame:greenViewFrame];
	greenView.backgroundColor=[UIColor greenColor];
	[blueView addSubview:greenView];
	
	
}
-(void)example2{
	
}
-(void)example3{
	
}
-(void)example4{
 	CGRect blueViewFrame=CGRectMake(100, 100, 100, 100);
	UIView *blueView=[[UIView alloc]initWithFrame:blueViewFrame];
	blueView.backgroundColor=[UIColor blueColor];
	[self.view addSubview:blueView];
	
	//	CGRect greenViewFrame=CGRectMake(10, 10, 80, 180);
	//la mejor forma es la siguiente
	CGRect greenViewFrame=CGRectInset(blueView.bounds, 10, 10);
	UIView *greenView=[[UIView alloc]initWithFrame:greenViewFrame];
	greenView.backgroundColor=[UIColor greenColor];
	[blueView addSubview:greenView];
	//al girar primero cambia el eje de cordenadas con lo que importa si giro y desplazo o desplazo y giro!!!!!
	greenView.transform=CGAffineTransformRotate(greenView.transform, degreesToRadians(45));
	greenView.transform=CGAffineTransformTranslate(greenView.transform, 50, 0);
}
-(void)example5{
	CGRect blueViewFrame=CGRectMake(100, 100, 100, 100);
	UIView *blueView=[[UIView alloc]initWithFrame:blueViewFrame];
	blueView.backgroundColor=[UIColor blueColor];
	[self.view addSubview:blueView];
	
	blueView.transform=CGAffineTransformMake(1, 0, -0.4, 1, 0, 0);
	
}
-(void)example6{
	
	MyButton *button =[[MyButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50) andTitle:@"Button" andColor:[UIColor greenColor]];
	[self.view addSubview:button];

	MyButton *button2 =[[MyButton alloc]initWithFrame:CGRectMake(200, 100, 100, 50) ];
	[self.view addSubview:button2];
}

-(void)example7{
	MultipleTouchView *multipleTouch=[[MultipleTouchView alloc]initWithFrame:self.view.bounds];
	[self.view addSubview:multipleTouch];
	
	
}
-(void)example8{
	DragView *dragView=[[DragView alloc]initWithFrame:self.view.bounds];
	[self.view addSubview:dragView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
