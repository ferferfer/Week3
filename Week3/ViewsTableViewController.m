//
//  ViewsTableViewController.m
//  Week3
//
//  Created by Fernando Garcia Corrochano on 16/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "ViewsTableViewController.h"
#import "GenericViewController.h"

@interface ViewsTableViewController ()

@end

@implementation ViewsTableViewController

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



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	NSIndexPath *index=[self.tableView indexPathForCell:sender];
	GenericViewController *genericViewController=[segue destinationViewController];
	genericViewController.exampleNumber=index.row;
	genericViewController.title=[sender textLabel].text;
	
	
}

- (IBAction)backToMainPressed:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
