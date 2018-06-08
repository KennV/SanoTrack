//
//  DetailViewController.h
//  SanoTrak
//
//  Created by Kenn Villegas on 6/8/18.
//  Copyright © 2018 Kenn Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDVMapViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

