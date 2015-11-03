//
//  ViewController.m
//  TrollStarViewDemo
//
//  Created by Troll on 15/11/2.
//  Copyright © 2015年 Troll. All rights reserved.
//

#import "ViewController.h"
#import "TrollStarMarkView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TrollStarMarkView *markView = [[TrollStarMarkView alloc] initWithFrame:CGRectMake(20, 100, 300, 80) starCount:4];
    [self.view addSubview:markView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
