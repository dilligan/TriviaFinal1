//
//  Question15.m
//  Trivia
//
//  Created by Deyan Milligan on 8/9/11.
//  Copyright 2011 University of WA School of Medicine. All rights reserved.
//

#import "Question15.h"
#import "fail.h"
#import "win.h"
#import "TriviaViewController.h"
#import "TriviaAppDelegate.h"


@implementation Question15
@synthesize myAnswer1, myAnswer2, myAnswer3, myAnswer4, myNavItem, myQuestion, myMoney, myWorth;
-(IBAction)quit{
	UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"Nevermind..."
                                  destructiveButtonTitle:@"Yes I want to quit."
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}
- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        hintused=false;
        phoneused=false;
        skipused=false;
		
        NSString *msg = nil;
        TriviaViewController *screen=[TriviaViewController alloc];
        [self presentModalViewController:screen animated:YES];
        
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewDidLoad {
	int randPath = random()%9+1;
	
	[myNavItem setTitle: @"Question 15"];
	myMoney.text = @"700,000";
	[myWorth setTitle: @"$300,000"];
	checkpoint=25000;
	
	
	switch (randPath) {
		case 1:
			myQuestion.text = @"Edgar Martinez's major leauge batting average was...";
			[myAnswer1 setTitle: @"3.14"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"2.98"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"3.12"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"3.18"  forState:UIControlStateNormal];
			myAnswerReal = 3;                        
			break;
			
		case 2:
			myQuestion.text = @"The State of New York was admitted into the Union in...";
			[myAnswer1 setTitle: @"1801"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"1799"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"1792"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"1788"  forState:UIControlStateNormal];
			myAnswerReal = 4;                      
			break;
			
		case 3:
			myQuestion.text = @"The highest point of New Mexico is...";
			[myAnswer1 setTitle: @"Heaphan Peak"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"Mt. Redstone"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"Red Bluff"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"Wheeler Peak"  forState:UIControlStateNormal];
			myAnswerReal = 1;
			break;
			
		case 4:
			myQuestion.text = @"Who invented the revolver pistol?";
			[myAnswer1 setTitle: @"Samuel Colt"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"Hirim Maxim"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"Hans Lippershey"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"Davie Crocket"  forState:UIControlStateNormal];
			myAnswerReal = 1;                        
			break;
			
		case 5:
			myQuestion.text = @"What is the capitol of Nigeria?";
			[myAnswer1 setTitle: @"Hausa"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"N'Djamena"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"Niamey"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"Abuja"  forState:UIControlStateNormal];
			myAnswerReal = 4;                      
			break;
			
		case 6:
			myQuestion.text = @"The Republic of Malawi's Internet TLD is...";
			[myAnswer1 setTitle: @".ma"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @".ml"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @".mw"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @".rw"  forState:UIControlStateNormal];
			myAnswerReal = 3;
			break;
			
		case 7:
			myQuestion.text = @"How many electoral votes does the state of Washington have?";
			[myAnswer1 setTitle: @"9"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"10"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"11"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"12"  forState:UIControlStateNormal];
			myAnswerReal = 3;
			break;
			
		case 8:
			myQuestion.text = @"What rank is the state of Washington, in terms of population, comparted to other US states?";
			[myAnswer1 setTitle: @"13th"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"15th"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"17th"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"19th"  forState:UIControlStateNormal];
			myAnswerReal = 1;
			break;
			
		case 9:
			myQuestion.text = @"Who invented the garage door?";
			[myAnswer1 setTitle: @"Leno Martian"  forState:UIControlStateNormal];
			[myAnswer2 setTitle: @"Henry George"  forState:UIControlStateNormal];
			[myAnswer3 setTitle: @"Jules Montenier"  forState:UIControlStateNormal];
			[myAnswer4 setTitle: @"C. J. Johnson"  forState:UIControlStateNormal];
			myAnswerReal = 4;
			break;
			
		default:
			break;
	}
    question = 1;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)answer1clicked
{
    userAnswer = 1;
}

-(IBAction)answer2clicked
{
    userAnswer = 2;
}

-(IBAction)answer3clicked
{
    userAnswer = 3;
}

-(IBAction)answer4clicked
{
    userAnswer = 4;
}

-(IBAction)nextQuestion
{
	if(userAnswer == myAnswerReal)
    {
        question++;
		
		switch (question)
		{
            case 2:;
                win *screen=[win alloc];
                [self presentModalViewController:screen animated:YES];
				break;
			default:
				break;
		}
	}
	else 
	{
		fail *screen=[fail alloc];
		[self presentModalViewController:screen animated:YES];
	}
			
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
}


@end
