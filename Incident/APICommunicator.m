//
//  APICommunicator.m
//  Incident
//
//  Created by Andrew Daniels on 8/12/14.
//  Copyright (c) 2014 Andrew Daniels. All rights reserved.
//

#import "APICommunicator.h"

@implementation APICommunicator
+ (void)date{
	NSString *urlString = @"http://incident-api.herokuapp.com/";
	NSURL *url = [[NSURL alloc] initWithString:urlString];
	
	[NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
		
		if (error) {
			NSLog(@"Error");
		} else {
			NSError *serializationError = nil;
			NSDictionary *dateJSON = [NSJSONSerialization JSONObjectWithData:data
																	 options:0
																	   error:&serializationError];
			NSLog(@"%@", dateJSON);
		}
	}];
}
@end
