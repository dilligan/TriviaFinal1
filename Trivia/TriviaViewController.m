//
//  TriviaViewController.m
//  Trivia
//
//  Created by iD Student Account on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TriviaViewController.h"
#import "Instructions.h"
#import "TriviaAppDelegate.h"
#import "Question1.h"
#import "Question1A.h"
#import "Stats.h"

@implementation TriviaViewController

-(IBAction)gotoinstruction {
        Instructions *screen = [Instructions alloc];
        [self presentModalViewController:screen animated:YES];
        [screen release];
}
- (IBAction)goToStats:(id)sender {
    Stats *screen = [Stats alloc];
    [self presentModalViewController:screen animated:YES];
    [screen release];
}

-(IBAction)play {
    //int temp = random()%2 +1;
   // if (temp==1) {
        Question1 *screen = [Question1 alloc];
        [self presentModalViewController:screen animated:NO];
        [screen release];
   // }
   // else {
   //     Question1A *screen = [Question1A alloc];
   //     [self presentModalViewController:screen animated:NO];
    //    [screen release];

   // }
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


//Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    moneyPot=0;
    [super viewDidLoad];
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
