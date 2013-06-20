//
//  win.m
//  Trivia
//
//  Created by iD Student Account on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "win.h"
#import "Question1.h"
#import "TriviaViewController.h"
#import "TriviaAppDelegate.h"

@implementation win

-(IBAction)gohome{
    hintused=false;
    phoneused=false;
    skipused=false;

    TriviaViewController *screen=[TriviaViewController alloc];
	[self presentModalViewController:screen animated:NO];
}
-(IBAction)restart{
    hintused=false;
    phoneused=false;
    skipused=false;

    Question1 *screen=[Question1 alloc];
    [self presentModalViewController:screen animated:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:(1000000+[defaults integerForKey:@"Total Earnings"]) forKey:@"Total Earnings"];
    [defaults setInteger:(1+[defaults integerForKey:@"Million Won"]) forKey:@"Million Won"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
