//
//  ConfigLoaderViewController.m
//  ConfigLoader
//
//  Created by Jyothidhar Pulakunta on 6/7/12.
//  Copyright (c) 2012 Jyothidhar Pulakunta. All rights reserved.
//

#import "ConfigLoaderViewController.h"
#import "ConfigLoaderAppDelegate.h"

@implementation ConfigLoaderViewController
@synthesize textValue;
@synthesize backgroundView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setTextValue:nil];
	[self setBackgroundView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	ConfigLoaderAppDelegate *delegate= (ConfigLoaderAppDelegate*)[[UIApplication sharedApplication] delegate];
	// update local variable
	NSDictionary *jsonData = delegate->jsonData;
	NSArray* background = [jsonData objectForKey:@"background"];
	NSArray* sentText = [jsonData objectForKey:@"text"];
	
    NSLog(@"Background: %@", background); //3
	NSLog(@"Text: %@", sentText); //3
	
	textValue.text = (NSString*)sentText;
	NSString *color = (NSString*)background;
	
	if([color caseInsensitiveCompare:@"black"] == NSOrderedSame)
	{
		[backgroundView setBackgroundColor:[UIColor blackColor]];
		textValue.textColor = [UIColor whiteColor];
	}
	else if([color caseInsensitiveCompare:@"green"] == NSOrderedSame)
	{
		self.view.backgroundColor = [UIColor greenColor];
	}
	else if([color caseInsensitiveCompare:@"cyan"] == NSOrderedSame)
	{
		self.view.backgroundColor = [UIColor cyanColor];
	}
	else if([color caseInsensitiveCompare:@"blue"] == NSOrderedSame)
	{
		self.view.backgroundColor = [UIColor blueColor];
	}
	else if([color caseInsensitiveCompare:@"yellow"] == NSOrderedSame)
	{
		self.view.backgroundColor = [UIColor yellowColor];
	}
	else
	{
		self.view.backgroundColor = [UIColor redColor];   
	}
	
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
