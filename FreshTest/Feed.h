//
//  Feed.h
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>

@interface Feed : NSObject {
    NSString* _text;
    NSString* _source;
    NSString* _ftype;
    NSString* _img;
}

@property (nonatomic, copy)   NSString* text;
@property (nonatomic, copy)   NSString* source;
@property (nonatomic, copy)   NSString* ftype;
@property (nonatomic, copy)   NSString* img;

@end
