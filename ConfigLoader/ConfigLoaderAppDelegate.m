//
//  ConfigLoaderAppDelegate.m
//  ConfigLoader
//
//  Created by Jyothidhar Pulakunta on 6/7/12.
//  Copyright (c) 2012 Jyothidhar Pulakunta. All rights reserved.
//

#import "ConfigLoaderAppDelegate.h"

@implementation ConfigLoaderAppDelegate

@synthesize window = _window;


NSMutableData *responseData;
//- (IBAction)callRest:(id)sender {
- (void) makeReq {
    NSURL *url = [NSURL URLWithString:@"http://dev.jyothepro.com?page=ajax&method=test"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:NULL error:NULL];
    jsonData = 
    [NSJSONSerialization JSONObjectWithData: result
                                    options: NSJSONReadingMutableContainers 
                                      error: NULL];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
	NSString* newStr = [[NSString alloc] initWithData:responseData
											 encoding:NSUTF8StringEncoding];
	NSLog(@"Last Name %@", newStr);
	
	jsonData = 
    [NSJSONSerialization JSONObjectWithData: data
                                    options: NSJSONReadingMutableContainers 
                                      error: NULL];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{	
    NSLog(@"connection error");
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connection success");
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self makeReq];
	return YES;
	
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

@end
