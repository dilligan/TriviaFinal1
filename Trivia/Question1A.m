//
//  Question1A.m
//  Trivia
//
//  Created by iD Student Account on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//#import "Question1A.h"
//#import "TriviaViewController.h"
//#import "Question2A.h"
//#import "fail.h"
//#import "TriviaAppDelegate.h"
//
//@implementation Question1A
//
//-(IBAction)quit{
//	UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                  initWithTitle:@"Are you sure?"
//                                  delegate:self
//                                  cancelButtonTitle:@"Nevermind..."
//                                  destructiveButtonTitle:@"Yes I want to quit."
//                                  otherButtonTitles:nil];
//    [actionSheet showInView:self.view];
//    [actionSheet release];
//}
//- (void)actionSheet:(UIActionSheet *)actionSheet
//didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex != [actionSheet cancelButtonIndex])
//    {
//        hintused=false;
//        phoneused=false;
//        skipused=false;
//        
//        NSString *msg = nil;
//        TriviaViewController *screen=[TriviaViewController alloc];
//        [self presentModalViewController:screen animated:YES];
//        
//    }
//}
//-(IBAction)skip{
//    if (skipused == false)
//    {
//        skipused = true;
//        
//        Question2A *screen=[Question2A alloc];
//        [self presentModalViewController:screen animated:YES];
//    }
//    else
//    {
//        NSString *msg = nil;
//        msg = @"You already used your skip! >:C";
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Nice Try"
//                              message:msg
//                              delegate:self
//                              cancelButtonTitle:@"Go Back"
//                              otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//        [msg release]; 
//    }
//}
//-(IBAction)fifty{
//    [self hintAlert: 1: 0: 0: 0];
//}
//-(IBAction)phone{
//    [self phoneAlert: 1: 0: 0: 0];
//}
//-(IBAction)answer1{
//    Question2A *screen=[Question2A alloc];
//	[self presentModalViewController:screen animated:YES];
//}
//
//-(IBAction)answer2{
//    
//    fail *screen=[fail alloc];
//	[self presentModalViewController:screen animated:YES];
//}
//-(IBAction)answer3{
//    
//    fail *screen=[fail alloc];
//	[self presentModalViewController:screen animated:YES];
//}
//-(IBAction)answer4{
//    
//    fail *screen=[fail alloc];
//	[self presentModalViewController:screen animated:YES];
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)dealloc
//{
//    [super dealloc];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    // Releases the view if it doesn't have a superview.
//    [super didReceiveMemoryWarning];
//    
//    // Release any cached data, images, etc that aren't in use.
//}
//
//#pragma mark - View lifecycle
//
//- (void)viewDidLoad
//{
//    checkpoint=0;
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}
//
//
//- (void)hintAlert:(int) c1: (int) c2: (int) c3:(int) c4
//{
//    if(hintused == false)
//    {
//        hintused = true;
//        if(c1 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%3 +2;
//            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice %i or choice 1",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"50/50"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//        }
//        if(c2 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%4 + 1;
//            if(temp==2)
//            {
//                temp=4;
//            }
//            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice 2 or choice %i",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"50/50"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//            
//        }
//        if(c3 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%4 +1;
//            if(temp==3)
//            {
//                temp=1;
//            }
//            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice 3 or choice %i",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"50/50"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//        }
//        if(c4 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%2 +2;
//            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice %i or choice 4",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"50/50"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//            
//        }
//    }
//    else
//    {
//        NSString *msg = nil;
//        msg = @"You already used your 50/50 hint.";
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Nice Try"
//                              message:msg
//                              delegate:self
//                              cancelButtonTitle:@"Go Back"
//                              otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//        [msg release]; 
//    }
//}
//- (void)phoneAlert:(int) d1: (int) d2: (int) d3:(int) d4
//{
//    if(phoneused == false)
//    {
//        phoneused = true;
//        if(d1 == 1)
//        {
//            NSString *msg = nil;
//            
//            msg = @"Your friend thinks the answer is choice 1, but he's not sure.";
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"Phone a Friend"
//                                  message:msg
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//        }
//        if(d2 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%2 +2;
//            NSString *newText = [[NSString alloc] initWithFormat: @"Your friend thinks the answer is choice %i, but he's not sure.",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"Phone a Friend"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//            
//        }
//        if(d3 == 1)
//        {
//            NSString *msg = nil;
//            
//            msg = @"Your friend thinks the answer is choice 3, but he's not sure.";
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"Phone a Friend"
//                                  message:msg
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//        }
//        if(d4 == 1)
//        {
//            NSString *msg = nil;
//            
//            int temp = random()%2 +2;
//            NSString *newText = [[NSString alloc] initWithFormat: @"Your friend thinks the answer is choice %i, but he's not sure.",temp];
//            UIAlertView *alert = [[UIAlertView alloc]
//                                  initWithTitle:@"Phone a Friend"
//                                  message:newText
//                                  delegate:self
//                                  cancelButtonTitle:@"Okay"
//                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            [msg release];
//            
//            
//        }
//    }
//    else
//    {
//        NSString *msg = nil;
//        msg = @"You already used your phone a friend hint.";
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Nice Try"
//                              message:msg
//                              delegate:self
//                              cancelButtonTitle:@"Go Back"
//                              otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//        [msg release]; 
//    }
//}
//
//
//- (void)viewDidUnload
//
//
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//@end
