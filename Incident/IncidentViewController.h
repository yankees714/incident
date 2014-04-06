//
//  IncidentViewController.h
//  Incident
//
//  Created by Andrew Daniels on 4/5/14.
//  Copyright (c) 2014 Andrew Daniels. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "IncidentModel.h"

@interface IncidentViewController : UIViewController
@property (strong, nonatomic) IncidentModel * incident;
@property (nonatomic) BOOL goingCrazy;

@property (strong, nonatomic) IBOutlet UILabel *counter;
@property (strong, nonatomic) IBOutlet UILabel *caption;
@property (strong, nonatomic) IBOutlet UIButton *reset;
- (IBAction)resetTriggered:(UIButton *)sender;

@property (strong, nonatomic) AVAudioPlayer * secretariat;
@property (strong, nonatomic) NSTimer * colorTimer;

@end
