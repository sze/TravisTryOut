//
//  TAViewController.h
//  TravisTestApp
//
//  Created by Larissa Kalbhenn on 26.12.13.
//  Copyright (c) 2013 com.tailored-apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *thelabel;
- (NSString *)firstThreeLettersOfTheLabel;

@end
