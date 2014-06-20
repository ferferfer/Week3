//
//  GenericLayersViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "GenericLayersViewController.h"
#import "ClockView.h"
#import "ScrollTestViewController.h"
@interface GenericLayersViewController ()

@end

@implementation GenericLayersViewController

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
			//[self example1];
			break;
		case 1:
			[self example2];
			break;
		case 3:
		//	[self example4];
			break;
		case 4:
	//		[self example5];
			break;
		case 5:
//			[self example6];
			break;
		default:
			break;
	}

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)example2{
	ClockView *clock=[[ClockView alloc]initWithFrame:self.view.frame];
	[self.view addSubview:clock];
}

-(void)example3{

	ScrollTestViewController	*scroll=[[ScrollTestViewController alloc]init];
		[self.view addSubview:scroll];
}


@end
