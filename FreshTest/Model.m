//
//  Model.m
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Model.h"
#import "Feed.h"

@implementation Model

@synthesize searchQuery = _searchQuery;
@synthesize feeds      = _feeds;

- (id)initWithSearchQuery:(NSString*)searchQuery {
    if (self = [super init]) {
        self.searchQuery = searchQuery;
    }
    
    return self;
}

- (void) dealloc {
    TT_RELEASE_SAFELY(_searchQuery);
    TT_RELEASE_SAFELY(_feeds);
    [super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
    if (!self.isLoading && TTIsStringWithAnyText(_searchQuery)) {
        NSString* url = @"http://api.douban.com/people/2449296/miniblog/contacts/merged?alt=json&max-results=20";
        
        TTURLRequest* request = [TTURLRequest
                                 requestWithURL: url
                                 delegate: self];
        
        request.cachePolicy = cachePolicy;
        request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
        [request send];
    }
}

- (void)requestDidFinishLoad:(TTURLRequest*)request {
    NSMutableArray* feeds = [[NSMutableArray alloc] initWithCapacity:1];
    Feed* f = [[Feed alloc] init];
    f.text = @"Hi";
    [feeds addObject:f];
    _feeds = feeds;
    [super requestDidFinishLoad:request];
}

@end
