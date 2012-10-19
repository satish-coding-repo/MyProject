//
//  HSViewController.m
//  Hide&Seek
//
//  Created by Sailaja Kamisetty on 17/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HSViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HSViewController ()

@end

@implementation HSViewController
@synthesize storyImage,storyLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title = @"Hide & Seek";
        
        buttons = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 320, 40)];
        [self.view addSubview:buttons];
        
        UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
       [skipButton setFrame:CGRectMake(170, 5, 80, 35)];
        [skipButton setTitle:@"Skip" forState:UIControlStateNormal];
        [skipButton addTarget:self action:@selector(skipButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [buttons addSubview:skipButton];
        
        UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [playButton setFrame:CGRectMake(50, 5, 80, 35)];
        [playButton setTitle:@"Continue" forState:UIControlStateNormal];
        [playButton addTarget:self action:@selector(ContinueStory) forControlEvents:UIControlEventTouchUpInside];
        [buttons addSubview:playButton];
        
        
        imageview = [[UIImageView alloc]initWithFrame:CGRectMake(16,16,288, 167)];
        [imageview setImage:[UIImage imageNamed:@"Sairam.jpg"]];
        [self.storyImage addSubview:imageview];
        [imageview release];
        
        
        UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(15,0,240,100)];
       [description setBackgroundColor:[UIColor clearColor]];
        description.text = @"Need to add the story description related to the story image & it changes from screen to screen";
        description.numberOfLines = 5;
        [self.storyLabel addSubview:description];
       [description release];
        
        imageArray = [[NSMutableArray alloc]initWithObjects:@"Vishnu.jpg",@"amma.jpg",@"god.jpg",nil];
        
    }
    return self;
}

- (void)easeIn
{
    [self.storyImage setFrame:CGRectMake( -200.0f, 44.0f, 320.0f, 200.0f)]; //notice this is OFF screen!
    [UIView beginAnimations:@"animateStoryImage" context:nil];
    [UIView setAnimationDuration:2];
    [self.storyImage setFrame:CGRectMake( 0.0f, 44.0f, 320.0f, 200.0f)]; //notice this is ON screen!
    [UIView commitAnimations];
    
    [self.storyLabel setFrame:CGRectMake( -200.0f, 272.0f, 268.0f,110.0f)]; //notice this is OFF screen!
    [UIView beginAnimations:@"animateStoryLabel" context:nil];
    [UIView setAnimationDuration:2];
    [self.storyLabel setFrame:CGRectMake( 26.0f, 272.0f, 268.0f, 110.0f)]; //notice this is ON screen!
    [UIView commitAnimations]; 
    
    [buttons setFrame:CGRectMake( -400.0f, 400.0f, 320.0f,40.0f)]; //notice this is OFF screen!
    [UIView beginAnimations:@"animateButtons" context:nil];
    [UIView setAnimationDuration:6];
    [buttons setFrame:CGRectMake( 0.0f, 400.0f, 320.0f, 40.0f)]; //notice this is ON screen!
    [UIView commitAnimations];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self easeIn];
     tapCount = 0;
   	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)ContinueStory
{
    if (tapCount < [imageArray count]) {
    [imageview setImage:[UIImage imageNamed:[imageArray objectAtIndex:tapCount]]];
    tapCount++;
    }
    [self easeIn];
    NSLog(@"playButtonClicked");
}
- (void)skipButtonClicked
{
    NSLog(@"skipButtonClicked");
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
