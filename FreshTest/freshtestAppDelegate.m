//
//  freshtestAppDelegate.m
//  freshtest
//
//  Created by GuoJing on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "freshtestAppDelegate.h"
#import "RootViewController.h"


@implementation freshtestAppDelegate

@synthesize window = _window; 
@synthesize navigationController = _navigationController;

-(void)applicationDidFinishLaunching:(UIApplication *)application { 
    //定义url映射 
    TTNavigator* navigator = [TTNavigator navigator]; 
    navigator.supportsShakeToReload = YES; 
    navigator.persistenceMode = TTNavigatorPersistenceModeAll; 
    navigator.window = self.window; 
    
    //[TTStyleSheet setGlobalStyleSheet:[[[StyleSheet alloc] init] autorelease]]; 
    
    TTURLMap* map = navigator.URLMap; 
    [map from:@"*" toViewController:[TTWebController class]]; 
    [map from:@"tt://root" toViewController:NSClassFromString(@"RootViewController")]; 
    [map from:@"tt://nib/(loadFromNib:)" toSharedViewController:self]; 
    [map from:@"tt://nib/(loadFromNib:)/(withClass:)" toSharedViewController:self]; 
    [map from:@"tt://viewController/(loadFromVC:)" toSharedViewController:self]; 
    [map from:@"tt://modal/(loadFromNib:)" toModalViewController:self]; 
    
    if (![navigator restoreViewControllers]) { 
        [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://root"]]; 
    } 
}

- (void)dealloc { 
    TT_RELEASE_SAFELY(_navigationController); 
    TT_RELEASE_SAFELY(_window); 
    
    [super dealloc]; 
}

- (UIViewController*)loadFromNib:(NSString *)nibName withClass:className { 
    UIViewController* newController = [[NSClassFromString(className) alloc] 
                                       initWithNibName:nibName bundle:nil]; 
    [newController autorelease]; 
    
    return newController; 
}

- (UIViewController*)loadFromNib:(NSString*)className { 
    return [self loadFromNib:className withClass:className]; 
}

- (UIViewController *)loadFromVC:(NSString *)className { 
    UIViewController * newController = [[ NSClassFromString(className) alloc] init]; 
    [newController autorelease]; 
    
    return newController; 
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL { 
    [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]]; 
    return YES; 
}
@end

