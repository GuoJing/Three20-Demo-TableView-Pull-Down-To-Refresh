//
//  DataSource.m
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataSource.h"
#import "Model.h"
#import "Feed.h"

@implementation DataSource

- (id)initWithSearchQuery:(NSString*)searchQuery {
    if (self = [super init]) {
        _feed_model = [[Model alloc] initWithSearchQuery:searchQuery];
    }
    return self;
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_feed_model);
    
    [super dealloc];
}

- (id<TTModel>)model {
    return _feed_model;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
    NSMutableArray* items = [[NSMutableArray alloc] init];
    for(Feed *f in _feed_model.feeds) {
        [items addObject:[TTTableTextItem itemWithText:f.text]];
    }
    self.items = items;
}

- (NSString*)titleForLoading:(BOOL)reloading {
    if (reloading) {
        return NSLocalizedString(@"Updating feed...", @"Feed updating text");
    } else {
        return NSLocalizedString(@"Loading feed...", @"Feed loading text");
    }
}

- (NSString*)titleForEmpty {
    return NSLocalizedString(@"No feed found.", @"Feed no results");
}

- (NSString*)subtitleForError:(NSError*)error {
    return NSLocalizedString(@"Sorry, there was an error loading the Feed stream.", @"");
}
@end
