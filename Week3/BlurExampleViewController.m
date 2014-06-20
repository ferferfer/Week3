//
//  BlurExampleViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "BlurExampleViewController.h"
#import "UIImage+ImageEffects.h"

@interface BlurExampleViewController ()
@property	(nonatomic,strong)UIImageView *screenShot;
@end

@implementation BlurExampleViewController
- (IBAction)blurPressed:(id)sender {
	[self presentBlurredScreenshot];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	if(self.screenShot){
		[self.screenShot removeFromSuperview];
		self.screenShot=nil;
	}
	
}

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
    // Do any additional setup after loading the view.
}

-(void)presentBlurredScreenshot{
	if(!self.screenShot){
		self.screenShot=[[UIImageView alloc]initWithFrame:self.view.frame];
	}
	self.screenShot.image=[self blurredScreenShot];
	[self.navigationController.view addSubview:self.screenShot];
}

-(UIImage *)blurredScreenShot{
	//Create the image context
	UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
	
	//take the snapshot
	[self.navigationController.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
	// Get the snapshot
	UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
	// Now apply the blur effect using Apple's UIImageEffect category
	UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
	//UIImage *blurredSnapshotImage = [snapshotImage applyDarkEffect];
	// UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
	// Clean
	UIGraphicsEndImageContext();
	return blurredSnapshotImage;
}

@end
