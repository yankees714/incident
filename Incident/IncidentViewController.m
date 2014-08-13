//
//  IncidentViewController.m
//  Incident
//
//  Created by Andrew Daniels on 4/5/14.
//  Copyright (c) 2014 Andrew Daniels. All rights reserved.
//

#import "IncidentViewController.h"

#import "APICommunicator.h"
#import "IncidentModel.h"
#import <AVFoundation/AVFoundation.h>

@interface IncidentViewController ()

@end

@implementation IncidentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.incident = [[IncidentModel alloc] init];
	
	
	self.goingCrazy = NO;
	NSURL *secretariatURL = [[NSBundle mainBundle] URLForResource:@"secretariat"
													withExtension:@"mp3"];
	self.secretariat = [[AVAudioPlayer alloc] initWithContentsOfURL:secretariatURL error:nil];
	self.secretariat.numberOfLoops = 1;
	
	
	
	self.counter.text = [self.incident daysSinceLastIncident];
	self.counter.font = [UIFont fontWithName:@"Courier-Bold" size:68.0];
	
	self.caption.font = [UIFont fontWithName:@"Courier-Bold" size:17.0];
	
	self.reset.titleLabel.font = [UIFont fontWithName:@"Courier-Bold" size:36.0];
	self.reset.tintColor = [UIColor redColor];
	
	[APICommunicator date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)resetTriggered:(UIButton *)sender {
	if (!self.goingCrazy) {
		[self.incident incidentOccurred];
		self.counter.text = [self.incident daysSinceLastIncident];
		
		[self.reset setTitle:@"Stop" forState:UIControlStateNormal];
		self.reset.tintColor = [UIColor whiteColor];
		
		self.goingCrazy = YES;
		[self.secretariat play];
		self.colorTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(colors) userInfo:nil repeats:YES];
		
		[self.view setNeedsDisplay];
	} else {
		self.goingCrazy = NO;
		
		[self.colorTimer invalidate];
		[self.secretariat stop];
		
		self.view.backgroundColor = [UIColor darkGrayColor];
		[self.reset setTitle:@"Reset" forState:UIControlStateNormal];
		self.reset.tintColor = [UIColor redColor];
		
	}
	
	
}

- (void)colors{
	int x = arc4random() % 100;
	if (x < 25) {
		self.view.backgroundColor = [UIColor redColor];
	} else if (x>=25 && x<50) {
		self.view.backgroundColor = [UIColor blueColor];
	} else if (x>=50 && x<75){
		self.view.backgroundColor = [UIColor yellowColor];
	} else {
		self.view.backgroundColor = [UIColor greenColor];
	}
}
@end
