//
//  MultiSelectTableViewAppDelegate.h
//  MultiSelectTableView
//
//  Created by Jamming on 12-3-21.
//  Copyright 2012 Jamming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSelectTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

