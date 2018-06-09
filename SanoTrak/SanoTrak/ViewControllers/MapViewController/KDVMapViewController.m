/**
  DetailViewController.m
  SanoTrak

  Created by Kenn Villegas on 6/8/18.
  Copyright © 2018 Kenn Villegas. All rights reserved.
*/

#import "KDVMapViewController.h"

@interface KDVMapViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *testButton;

- (IBAction)performTestAction:(UIBarButtonItem *)sender;

@end

@implementation KDVMapViewController

- (void)configureView {
  // Update the user interface for the detail item.
  if (self.detailItem) {
      self.detailDescriptionLabel.text = [self.detailItem description];
  }
  
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item
//TODO: - this should not be an NSDate*
- (void)setDetailItem:(NSDate *)newDetailItem {
  if (_detailItem != newDetailItem) {
      _detailItem = newDetailItem;
      
      // Update the view.
      [self configureView];
  }


  
}


/**
Manual Test Action
 
 performs basic this-n-that when activated

 @param sender just a Plain BarButton
 */
- (IBAction)performTestAction:(UIBarButtonItem *)sender {
  NSLog(@"Powa");
}
@end
