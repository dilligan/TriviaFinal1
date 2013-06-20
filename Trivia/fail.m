//
//  fail.m
//  Trivia
//
//  Created by iD Student Account on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "fail.h"
#import "TriviaViewController.h"
#import "Question1.h"
#import "TriviaAppDelegate.h"

@implementation fail

-(IBAction)startover{
    hintused=false;
    phoneused=false;
    skipused=false;

    Question1 *screen=[Question1 alloc];
	[self presentModalViewController:screen animated:YES];
}

-(IBAction)mainmenu{
    hintused=false;
    phoneused=false;
    skipused=false;

    TriviaViewController *screen=[TriviaViewController alloc];
	[self presentModalViewController:screen animated:YES];
}

@synthesize moneyText;

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
    // Do any additional setup after loading the view from its nib.
    NSString *newText = [[NSString alloc] initWithFormat: @"%i", checkpoint];
    moneyText.text = newText;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:(checkpoint+[defaults integerForKey:@"Total Earnings"]) forKey:@"Total Earnings"];
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
