//
//  ViewController.m
//  WProgresssView
//
//  Created by Wenhao Ho on 6/13/17.
//  Copyright © 2017 wstudio. All rights reserved.
//

#import "WProgressView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ((WProgressView *)[self.view viewWithTag:999]).progress = 0.36;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trigger:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        ((WProgressView *)[self.view viewWithTag:999]).progress = 0.36;
    } else if ([sender selectedSegmentIndex] == 1) {
        ((WProgressView *)[self.view viewWithTag:999]).progress = 0.52;
    } else {
        ((WProgressView *)[self.view viewWithTag:999]).progress = 1.0;
    }
}

@end
