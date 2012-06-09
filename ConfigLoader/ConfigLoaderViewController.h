//
//  ConfigLoaderViewController.h
//  ConfigLoader
//
//  Created by Jyothidhar Pulakunta on 6/7/12.
//  Copyright (c) 2012 Jyothidhar Pulakunta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigLoaderViewController : UIViewController{
	UILabel *textValue;
	UIView *backgroundView;
}
@property (strong, nonatomic) IBOutlet UILabel *textValue;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end
