//
//  Application.m
//  iOS UI Test
//
//  Created by Jonathan Willing on 4/8/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import "Application.h"
#import <mailcore/mailcore.h>

@implementation Application

- (void)sendEvent:(UIEvent *)event {
	//mailcore::AutoreleasePool * pool = new mailcore::AutoreleasePool();
	[super sendEvent:event];
	
}

@end
