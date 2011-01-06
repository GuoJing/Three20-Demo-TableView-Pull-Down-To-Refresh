//
//  DataSource.h
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>

@class Model;
//TTListDataSource
@interface DataSource : TTSectionedDataSource {
    Model* _feed_model;
}

- (id)initWithSearchQuery:(NSString*)searchQuery;

@end
