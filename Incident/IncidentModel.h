//
//  IncidentModel.h
//  Incident
//
//  Created by Andrew Daniels on 4/5/14.
//  Copyright (c) 2014 Andrew Daniels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncidentModel : NSObject
@property (nonatomic) NSDate * dateOfLastIncident;

- (void)incidentOccurred;
- (NSString *)daysSinceLastIncident;

@end
