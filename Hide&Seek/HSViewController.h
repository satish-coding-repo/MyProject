//
//  HSViewController.h
//  Hide&Seek
//
//  Created by Sailaja Kamisetty on 17/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSViewController : UIViewController
{
    UIImageView *storyImage;
    UIImageView *storyLabel;
    UIView *buttons;
    NSMutableArray *imageArray;
    UIImageView *imageview;
    int tapCount;
}
@property(nonatomic,retain)IBOutlet UIImageView *storyImage;
@property(nonatomic,retain)IBOutlet UIImageView *storyLabel;
@end
