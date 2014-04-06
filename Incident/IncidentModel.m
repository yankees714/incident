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
	
	if (dateOfLastIncident) {
		self.dateOfLastIncident = dateOfLastIncident;
	} else {
		self.dateOfLastIncident = [NSDate date];
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
	
	return [NSString stringWithFormat:@"%ld",(long)daysElapsed];
}

- (void)saveDate{
	[[NSUserDefaults standardUserDefaults] setObject:self.dateOfLastIncident forKey:@"dateOfLastIncident"];
}

@end
