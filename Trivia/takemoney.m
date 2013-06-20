//
//  takemoney.m
//  Trivia
//
//  Created by iD Student Account on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "takemoney.h"
#import "TriviaAppDelegate.h"
#import "Question1.h"
#import "TriviaViewController.h"

@implementation takemoney

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

@synthesize statusText;

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
    
    NSString *newText = [[NSString alloc] initWithFormat: @"%i", moneyPot];
    statusText.text = newText;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //this won't work. we need to have it so that it adds monePot to "total earnings," not sets it to monepot
    //now, will this work? or do i need to define defauls "total earnings" beforehand?
    [defaults setInteger:(moneyPot+[defaults integerForKey:@"Total Earnings"]) forKey:@"Total Earnings"];
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
