//
//  FilterViewController.h
//  Week3
//
//  Created by Fernando Garcia Corrochano on 17/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController
typedef NS_ENUM(NSUInteger,filterType){
	kFilterVignette,
	kFilterSimple,
	kFilterComplex
};
@property	(nonatomic)filterType filter;
@end
