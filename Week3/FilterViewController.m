//
//  FilterViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (nonatomic,strong)UIImageView *mainImageView;
@end

@implementation FilterViewController

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
	[self logAllFilters];
	
	


	
}
-(void)logAllFilters {
	NSArray *properties = [CIFilter filterNamesInCategory:
												 kCICategoryBuiltIn];
	NSLog(@"%@", properties);
	for (NSString *filterName in properties) {
    CIFilter *fltr = [CIFilter filterWithName:filterName];
    NSLog(@"%@", [fltr attributes]);
	}
}
- (IBAction)originalPressed:(id)sender {
	self.mainImageView.image=[UIImage imageNamed:@"programmer"];
}
- (IBAction)filterPressed:(id)sender {

	CIImage *outImage;
	switch (self.filter) {
		case kFilterSimple:
			outImage=[self addSimpleEfect];
			break;
			
		default:
			break;
	}
	UIGraphicsBeginImageContextWithOptions(outImage.extent.size, NO, 0);
	[[UIImage imageWithCIImage:outImage] drawInRect:outImage.extent];
	
}

-(CIImage *)addSimpleEfect{
	CIImage *image=[CIImage imageWithCGImage:[UIImage imageNamed:@"programmer"].CGImage];
	CIFilter *color=[CIFilter filterWithName:@"CIDotScreen"];
	[color setValue:image forKeyPath:kCIInputImageKey];
	[color setValue:@1 forKeyPath:@"inputWidth"];

	
	
	
	
	return image;
}


-(CIImage *)addComplexEfect{
	
	CGFloat intensity=0.8;
	CIImage *image=[CIImage imageWithCGImage:[UIImage imageNamed:@"programmer"].CGImage];
	
	//2
	CIFilter *random=[CIFilter filterWithName:@"CIRandomGenerator"];

	CIFilter *lighten=[CIFilter filterWithName:@"CI"];
	//[color setValue:image forKeyPath:kCIInputImageKey];
	//[color setValue:@1 forKeyPath:@"inputWidth"];
	return image;
}

@end
