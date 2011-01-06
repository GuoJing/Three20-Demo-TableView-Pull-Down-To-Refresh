//
//  Feed.m
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"

@implementation Feed

@synthesize text      = _text;
@synthesize source    = _source;
@synthesize ftype    = _ftype;
@synthesize img = _img;

- (void) dealloc {
    TT_RELEASE_SAFELY(_text);
    TT_RELEASE_SAFELY(_source);
    TT_RELEASE_SAFELY(_ftype);
    TT_RELEASE_SAFELY(_img);
    [super dealloc];
}

@end

