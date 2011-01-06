//
//  RootViewController.m
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DataSource.h"

@implementation RootViewController

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle { 
    if (self = [super initWithNibName:nibName bundle:bundle]) { 
        self.title = @"主菜单"; 
        self.navigationItem.backBarButtonItem = 
        [[[UIBarButtonItem alloc] initWithTitle: @"主菜单" 
                                          style: UIBarButtonItemStyleBordered 
                                         target: nil 
                                         action: nil] autorelease]; 
    } 
    
    return self; 
}

-(void)createModel {
    self.dataSource = [[[DataSource alloc] initWithSearchQuery:@"haha"] autorelease];
}

- (id<UITableViewDelegate>)createDelegate {
    return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

@end