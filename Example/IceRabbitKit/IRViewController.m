//
//  IRViewController.m
//  IceRabbitKit
//
//  Created by iCe Rabbit on 11/11/2020.
//  Copyright (c) 2020 iCe Rabbit. All rights reserved.
//

#import "IRViewController.h"

#import <IceRabbitKit/NSTimer+Weak.h>


@interface IRViewController ()

@end

@implementation IRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer ir_scheduledTimerWithTimeInterval:1 target:self selector:@selector(showQ) userInfo:nil repeats:YES];
}

-(void)showQ {
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
