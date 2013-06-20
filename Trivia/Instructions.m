//
//  Instructions.m
//  Trivia
//
//  Created by iD Student Account on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Instructions.h"
#import "TriviaViewController.h"
#import "Question1.h"
#import "TriviaAppDelegate.h"

@implementation Instructions

-(IBAction)goBack //added
{
	TriviaViewController *screen=[TriviaViewController alloc];
	[self presentModalViewController:screen animated:YES];
}

-(IBAction)ready{
    TriviaViewController *screen = [TriviaViewController alloc];
    [self presentModalViewController:screen animated:YES];
    [screen release];

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
    moneyPot=0;

    [super viewDidLoad];
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
