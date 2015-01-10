//
//  ViewController.m
//  PickBits
//
//  Created by Peerincle on 31/12/2014.
//  Copyright (c) 2014 Peerincle. All rights reserved.
//

#import "ViewController.h"
#import "home.h"
#import "ActivityViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHome:(id)sender {
    id controller = [[home alloc] initWithNibName:@"home" bundle:nil];
    [self presentViewController:controller animated:YES completion:NULL];
}

- (IBAction)showActivity:(id)sender {
    id activityController = [[ActivityViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:activityController animated:YES];
}
@end
