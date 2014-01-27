//
//  TAViewController.m
//  TravisTestApp
//
//  Created by Larissa Kalbhenn on 26.12.13.
//  Copyright (c) 2013 com.tailored-apps. All rights reserved.
//

#import "TAViewController.h"

@interface TAViewController ()

@end

@implementation TAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.thelabel.text = @"Hello Fabian";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)firstThreeLettersOfTheLabel
{
    return [self.thelabel.text substringToIndex:3];
}


@end
