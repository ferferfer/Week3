//
//  DrawingTableViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "DrawingTableViewController.h"
#import "DrawingFirstGenericViewController.h"
#import "FilterViewController.h"
#import "CoreGraphicsViewController.h"

@interface DrawingTableViewController ()



@end

@implementation DrawingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	if([segue.destinationViewController isKindOfClass:[DrawingFirstGenericViewController class]]){
		NSIndexPath *index=[self.tableView indexPathForCell:sender];
		DrawingFirstGenericViewController *genericViewController=[segue destinationViewController];
		genericViewController.exampleNumber=index.row;
		genericViewController.title=[sender textLabel].text;
	}
	if([segue.destinationViewController isKindOfClass:[FilterViewController class]]){
		NSIndexPath *index=[self.tableView indexPathForCell:sender];
		FilterViewController *filterViewController=[segue destinationViewController];
		switch (index.row) {
			case 8:
				filterViewController.filter=kFilterSimple;
				break;
			case 9:
				filterViewController.filter=kFilterComplex;
				break;
			case 10:
				filterViewController.filter=kFilterVignette;
				break;
			default:
				break;
		}
		filterViewController.title=[sender textLabel].text;
	}
	if([segue.destinationViewController isKindOfClass:[CoreGraphicsViewController class]]){
		NSIndexPath *index=[self.tableView indexPathForCell:sender];
		CoreGraphicsViewController *coreGraphicsViewController=[segue destinationViewController];
		coreGraphicsViewController.exampleNumber=index.row;
		coreGraphicsViewController.title=[sender textLabel].text;
	}
		
}

- (IBAction)backToMainPressed:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
