//
//  Model.h
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>

@interface Model : TTURLRequestModel {
    NSString* _searchQuery;
    NSArray*  _feeds;
}

@property (nonatomic, copy)     NSString* searchQuery;
@property (nonatomic, readonly) NSArray*  feeds;

- (id)initWithSearchQuery:(NSString*)searchQuery;

@end
