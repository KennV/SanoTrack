//
//  MasterViewController.h
//  SanoTrak
//
//  Created by Kenn Villegas on 6/8/18.
//  Copyright © 2018 Kenn Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KDVMapViewController;

@interface KDVTableViewController : UITableViewController

@property (strong, nonatomic) KDVMapViewController *detailViewController;


@end

