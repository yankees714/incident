//
//  IncidentModel.m
//  Incident
//
//  Created by Andrew Daniels on 4/5/14.
//  Copyright (c) 2014 Andrew Daniels. All rights reserved.
//

#import "IncidentModel.h"

@implementation IncidentModel

- (IncidentModel *)init{
	self = [super init];
	NSDate * dateOfLastIncident = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateOfLastIncident"];
	
	if (NO) {
		self.dateOfLastIncident = dateOfLastIncident;
	} else {
		self.dateOfLastIncident = [NSDate date];
		self.dateOfLastIncident = [NSDate dateWithTimeIntervalSinceNow:-4500000];
	}
	
	[self saveDate];
	
	return self;
}

- (void)incidentOccurred{
	self.dateOfLastIncident = [NSDate date];
	[self saveDate];
}

- (NSString *)daysSinceLastIncident{
	NSDate * now = [NSDate date];
	
	NSTimeInterval secondsElapsed = [now timeIntervalSinceDate:self.dateOfLastIncident];
	NSInteger daysElapsed = (long)secondsElapsed/86400;
	
	return [NSString stringWithFormat:@"%d",daysElapsed];
}

- (void)saveDate{
	[[NSUserDefaults standardUserDefaults] setObject:self.dateOfLastIncident forKey:@"dateOfLastIncident"];
}

@end
