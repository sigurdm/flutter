//
//  ViewController.m
//  ios_host_app
//
//  Created by Sigurd Meldgaard on 09/07/2018.
//  Copyright © 2018 Sigurd Meldgaard. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface ViewController ()

@end

@implementation ViewController
{
    FlutterViewController *flutterViewController;
}

- (void)viewDidAppear: (BOOL)animated {
    [super viewDidAppear:animated];
    flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [GeneratedPluginRegistrant registerWithRegistry: [flutterViewController pluginRegistry]];
    [self presentViewController: flutterViewController animated: true completion: nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
