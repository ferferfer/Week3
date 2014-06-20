//
//  ViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "ViewController.h"
#import "DrawingLinesView.h"
#import "HexagonButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self addDrawingLines];
	[self animatedButtons];
}

-(void)animatedButtons{
	for (HexagonButton *button in self.view.subviews) {
		button.alpha=0;
    [UIView animateWithDuration:6 animations:^{
			button.alpha=1;
		}];
	}
}

-(void)addDrawingLines{
	DrawingLinesView *drawingLines=[[DrawingLinesView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	drawingLines.center=self.view.center;
	[self.view addSubview:drawingLines];
	//Para que los toques no interactuen con esta vista
	drawingLines.userInteractionEnabled=NO;
}

#pragma mark -
#pragma mark IBActions

- (IBAction)viewsPressed:(id)sender {
	UIStoryboard *viewsStoryBoard =[UIStoryboard storyboardWithName:@"Views" bundle:[NSBundle mainBundle]];
	UINavigationController *nextStoryBoard=[viewsStoryBoard instantiateViewControllerWithIdentifier:@"ViewsNav"];
	[self presentViewController:nextStoryBoard animated:YES completion:nil];
}
- (IBAction)drawingPressed:(id)sender {
	UIStoryboard *drawingStoryBoard =[UIStoryboard storyboardWithName:@"Drawing" bundle:[NSBundle mainBundle]];
	UINavigationController *nextStoryBoard=[drawingStoryBoard instantiateViewControllerWithIdentifier:@"DrawingNav"];
	[self presentViewController:nextStoryBoard animated:YES completion:nil];
}
- (IBAction)layersPressed:(id)sender {
	UIStoryboard *drawingStoryBoard =[UIStoryboard storyboardWithName:@"Layers" bundle:[NSBundle mainBundle]];
	UINavigationController *nextStoryBoard=[drawingStoryBoard instantiateViewControllerWithIdentifier:@"LayersNav"];
	[self presentViewController:nextStoryBoard animated:YES completion:nil];
}

@end
