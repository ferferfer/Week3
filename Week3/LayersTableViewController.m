//
//  LayersTableViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "LayersTableViewController.h"
#import "GenericLayersViewController.h"
#import "ScrollTestViewController.h"

@interface LayersTableViewController ()

@end

@implementation LayersTableViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	if([segue.destinationViewController isKindOfClass:[GenericLayersViewController class]]){
		NSIndexPath *index=[self.tableView indexPathForCell:sender];
		GenericLayersViewController *genericViewController=[segue destinationViewController];
		genericViewController.exampleNumber=index.row;
		genericViewController.title=[sender textLabel].text;
	}
	
	if([segue.destinationViewController isKindOfClass:[ScrollTestViewController class]]){
		ScrollTestViewController *scrollTestViewController=[segue destinationViewController];
		scrollTestViewController.title=[sender textLabel].text;
	}

	
}

- (IBAction)backToMainPressed:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
