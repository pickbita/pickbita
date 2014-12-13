//
//  ViewController.m
//  pickbita
//
//  Created by Peerincle on 13/12/2014.
//  Copyright (c) 2014 Peerincle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextView *DebugInfo;

@property (strong, nonatomic) IBOutlet UIImageView *picsView;

@property (strong, nonatomic) IBOutlet UICollectionView *Shares;

@property (strong, nonatomic) IBOutlet UITableView *LikesComments;

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
- (IBAction)homeButton:(id)sender {
    self.DebugInfo.text = @"Loading! ";
    self.picsView.image=[UIImage imageNamed:@"1.jpg"];
    
}

@end
