//
//  ConfigLoaderAppDelegate.h
//  ConfigLoader
//
//  Created by Jyothidhar Pulakunta on 6/7/12.
//  Copyright (c) 2012 Jyothidhar Pulakunta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigLoaderAppDelegate : UIResponder <UIApplicationDelegate> {
	
	@public
		NSDictionary *jsonData;
}

@property (strong, nonatomic) UIWindow *window;



@end
