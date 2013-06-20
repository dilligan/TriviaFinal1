//
//  Question1.m
//  Trivia
//
//  Created by iD Student Account on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Question1.h"
#import "TriviaViewController.h"
#import "fail.h"
#import "TriviaAppDelegate.h"
#import "takemoney.h"
#import "win.h"
#import "goforit.h"

@implementation Question1
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
-(IBAction)skip{
    if (skipused == false)
    {
        usingSkip = true;
        [self nextQuestion];
    }
    else
    {
        NSString *msg = nil;
        msg = @"You already used your skip! >:C";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nice Try"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Go Back"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release]; 
    }
}
-(IBAction)takemoney;
{
    takemoney *screen=[takemoney alloc];
    [self presentModalViewController:screen animated:YES];

}
-(IBAction)fifty{
    if(hintused == false)
    {
        
        //update new questions for next question
        switch (myAnswerReal) {
            case 1:
                [self hintAlert: 1: 0: 0: 0];
                break;
            case 2:
                [self hintAlert: 0: 1: 0: 0];
                break;
            case 3:
                [self hintAlert: 0: 0: 1: 0];
                break;
            case 4:
                [self hintAlert: 0: 0: 0: 1];
                break;
        }
        
        (hintused = true);
    }
    else
    {
        NSString *msg = nil;
        msg = @"You already used your 50/50 hint.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nice Try"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Go Back"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release]; 
 
    }
}
-(IBAction)phone{
    if(phoneused == false)
    {
        
        //update new questions for next question
        switch (myAnswerReal) {
            case 1:
                [self phoneAlert: 1: 0: 0: 0];
                break;
            case 2:
                [self phoneAlert: 0: 1: 0: 0];
                break;
            case 3:
                [self phoneAlert: 0: 0: 1: 0];
                break;
            case 4:
                [self phoneAlert: 0: 0: 0: 1];
                break;
                
        }
        
        (phoneused = true);
    }
    else
    {
        NSString *msg = nil;
        msg = @"You already used your phone a friend hint!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nice Try"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Go Back"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release]; 

    }
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
				srandom(time(NULL));
				int randPath = random()%15+1;
				
				[myNavItem setTitle: @"Question 1"];
				myMoney.text = @"0";
				[myWorth setTitle: @"$1,000"];
				moneyPot=0;
				checkpoint=0;


				switch (randPath) {
					case 1:
									myQuestion.text = @"What celebrity was the inspiration for the meme, 'Duh? Winning!'";
									[myAnswer1 setTitle: @"Charlie Sheen"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Linsey Lohan"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Barack Obama"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Joe Shmo"  forState:UIControlStateNormal];
									myAnswerReal = 1;                        
									break;
									
					case 2:
									myQuestion.text = @"How many days are in the month of December?";
									[myAnswer1 setTitle: @"30"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"31"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"32"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"28"  forState:UIControlStateNormal];
									myAnswerReal = 2;                      
									break;
									
					case 3:
									myQuestion.text = @"A USB stores...";
									[myAnswer1 setTitle: @"Digital Memory"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Produce"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Clothing"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Papers"  forState:UIControlStateNormal];
									myAnswerReal = 1;
									break;
									
					case 4:
									myQuestion.text = @"'The Rolling Stones' is a...?";
									[myAnswer1 setTitle: @"Publisher"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Studio"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Tape Recorder"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Rock Band"  forState:UIControlStateNormal];
									myAnswerReal = 4;
									break;
					
					case 5:
									myQuestion.text = @"How many ears do rabbits have?";
									[myAnswer1 setTitle: @"2"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"4"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"1"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"8"  forState:UIControlStateNormal];
									myAnswerReal = 1;
									break;
					
					case 6:
									myQuestion.text = @"1 foot is how many inches?";
									[myAnswer1 setTitle: @"7"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"10"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"2"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"12"  forState:UIControlStateNormal];
									myAnswerReal = 4;
									break;
						
					case 7:
									myQuestion.text = @"Fines from the library come from ____ books.";
									[myAnswer1 setTitle: @"Unsaturated"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Transentient"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Overdue"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Sad"  forState:UIControlStateNormal];
									myAnswerReal = 3;
									break;
									
					case 8:
									myQuestion.text = @"Litter boxes are for...";
									[myAnswer1 setTitle: @"Housepets"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Humans"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Computers"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Hats"  forState:UIControlStateNormal];
									myAnswerReal = 1;
									break;
									
					case 9:
									myQuestion.text = @"Kleenex is a brand of...";
									[myAnswer1 setTitle: @"Hats"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"Suits"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Tissues"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"China"  forState:UIControlStateNormal];
									myAnswerReal = 3;
									break;
					case 10:
									myQuestion.text = @"Brazil is in what continent?";
									[myAnswer1 setTitle: @"North America"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"South America"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Europe"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Asia"  forState:UIControlStateNormal];
									myAnswerReal = 2;
									break;
						
					case 11:
									myQuestion.text = @"Poland is part of what continent?";
									[myAnswer1 setTitle: @"North America"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"South America"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Europe"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Asia"  forState:UIControlStateNormal];
									myAnswerReal = 3;
									break;
									
					case 12:
									myQuestion.text = @"Nigeria is part of what continent";
									[myAnswer1 setTitle: @"North America"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"South America"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Europe"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"Africa"  forState:UIControlStateNormal];
									myAnswerReal = 4;
									break;
						
					case 13:
									myQuestion.text = @"How many books are in the Harry Potter series?";
									[myAnswer1 setTitle: @"3"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"5"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"7"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"13"  forState:UIControlStateNormal];
									myAnswerReal = 3;
									break;
									
					case 14:
									myQuestion.text = @"Ron Weasly, Hermione Granger, and Draco Malfoy are characters in what series?";
									[myAnswer1 setTitle: @"Harry Potter"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"The Last Olympian"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"Eragon"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"City of Ember"  forState:UIControlStateNormal];
									myAnswerReal = 1;
									break;
									
					case 15:
									myQuestion.text = @"American Independance Day is on what day?";
									[myAnswer1 setTitle: @"4th of July"  forState:UIControlStateNormal];
									[myAnswer2 setTitle: @"6th of April"  forState:UIControlStateNormal];
									[myAnswer3 setTitle: @"23rd of December"  forState:UIControlStateNormal];
									[myAnswer4 setTitle: @"1st of January"  forState:UIControlStateNormal];
									myAnswerReal = 1;
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
    if(userAnswer == myAnswerReal || usingSkip)
    {
        question++;
        
        if(usingSkip)
        {
            usingSkip = false;
            skipused = true;
        }
        
        switch (question) {
            case 2:

                [myNavItem setTitle: @"Question 2"];
                myMoney.text = @"1,000";
                [myWorth setTitle: @"$1,000"];
                moneyPot=1000;
                checkpoint=0;
				int randPath = random()%17+1;

                
                switch (randPath) {
                    case 1:
                        myQuestion.text = @"What artist sings the song, 'Baby' and 'Never say Never'";
                        [myAnswer1 setTitle: @"Michael Jackson"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"David Li"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Justin Bieber"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Rebecca Black"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;

                    case 2:
                        myQuestion.text = @"Who is president of the US as of 2011?";
                        [myAnswer1 setTitle: @"George Bush"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Donald Trump"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"John McCain"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Barack Obama"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                      
                        break;

                    case 3:
                        myQuestion.text = @"Little Red Riding Hood involved which of the following antagonists?";
                        [myAnswer1 setTitle: @"A Bear"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"A Wolf"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"A Vampire"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"A Chick"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
					
					case 4:
                        myQuestion.text = @"Which of the following is not a fruit?";
                        [myAnswer1 setTitle: @"The Orange"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The Grape"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The Plum"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"The Cracker"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"People who cannot see with their eyes are...";
                        [myAnswer1 setTitle: @"Deaf"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Blind"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Mute"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Broken"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"The phrase, 'Not on the hairs of my chinny chin chin!' comes from which tale?";
                        [myAnswer1 setTitle: @"Repunzel"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The 3 Little Pigs"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Humpty Dumpty"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Peter Rabbit"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 7:
						myQuestion.text = @"The phrase, 'Fe Fi Fo Fum, I smell the blood of an Englishman!' comes from what tale?";
						[myAnswer1 setTitle: @"Repunzel"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The 3 Little Pigs"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Humpty Dumpty"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Jack &the Beanstalk"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 8:
						myQuestion.text = @"Who's buried in Grant's tomb?";
						[myAnswer1 setTitle: @"Lincoln"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Grant"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"N/A"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Washington"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 9:
						myQuestion.text = @"The sport of Basketball has shots that are worth ____ points.";
						[myAnswer1 setTitle: @"2 and 4"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"1,2, and 3"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"3 and 7"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"2,3, and 4"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"Lent is a(n) ______ tradition?";
						[myAnswer1 setTitle: @"Catholic"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Quaker"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Hindu"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Islamic"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 11:
						myQuestion.text = @"Montana does not border which of these states?";
						[myAnswer1 setTitle: @"Idaho"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"North Dakoda"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Wyoming"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Nevada"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 12:
						myQuestion.text = @"Dallas is located in what state?";
						[myAnswer1 setTitle: @"Missippi"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Texas"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Arkansas"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"New Mexico"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 13:
						myQuestion.text = @"Cheetos are a snack which has a ______ flavor?";
						[myAnswer1 setTitle: @"Cheesy"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Sweet"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Bitter"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Grape"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 14:
						myQuestion.text = @"How long is a soccer game, (not including added time)?";
						[myAnswer1 setTitle: @"30 minutes"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"60 minutes"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"90 minutes"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"120 minutes"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 15:
						myQuestion.text = @"Michael Jackson did not compose which of the following songs?";
						[myAnswer1 setTitle: @"Thriller"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Friday"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Billie Jean"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Startin' Something"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 16:
						myQuestion.text = @"How many US Supreme Court Justices are there?";
						[myAnswer1 setTitle: @"3"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"7"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"9"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"11"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 17:
						myQuestion.text = @"The McDonalds franchise is famous for their...";
						[myAnswer1 setTitle: @"Blizzards"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Big Macs"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"7/11s"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Starbucks"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;

                    default:
                        break;
                }
                
                break;
            case 3:   
																
                [myNavItem setTitle: @"Question 3"];
                myMoney.text = @"2,000";
                [myWorth setTitle: @"$1,000"];
                moneyPot=2000;
                checkpoint=0;
				int randPath3 = random()%16+1;

																
                switch (randPath3) {
																								
                    case 1:
                        myQuestion.text = @"The sport of tennis does not involve a...";
                        [myAnswer1 setTitle: @"Net"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Racket"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Goal"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Ball"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 2:
                        myQuestion.text = @"The Bullfrog is a(n)...";
                        [myAnswer1 setTitle: @"Insect"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Animal"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Snake"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Plant"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 3:
                        myQuestion.text = @"Ketchup is generally made up of...";
                        [myAnswer1 setTitle: @"Chili Peppers"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Mustard"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Red Peppers"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Tomatoes"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
						
                    case 4:
                        myQuestion.text = @"Which of these colors does not describe a type of rabbit's fur?";
                        [myAnswer1 setTitle: @"Green"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Black"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Blue"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"White"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
						
                    case 5:
                        myQuestion.text = @"Which of the following is not a type of pen?";
                        [myAnswer1 setTitle: @"Felt"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Ballpoint"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Fountian"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Water"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 6:
						myQuestion.text = @"GE (the corperation) stands for...";
						[myAnswer1 setTitle: @"Grant's Ephiphany"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Gerald Earnest"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"General Electric"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Great Expectations"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 7:
						myQuestion.text = @"Skippy is a brand of...";
						[myAnswer1 setTitle: @"Oatmeal"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Bottled Water"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Windex"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Peanut Butter"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 8:
						myQuestion.text = @"Sunglasses generally have ___ protection.";
						[myAnswer1 setTitle: @"Heat"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Radiation"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Ultra Violet"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Photon"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 9:
						myQuestion.text = @"Honda is a(n) ______ company?";
						[myAnswer1 setTitle: @"Korean"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Japanese"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"US"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Chinese"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"The FIFA World Cup is held every how many year(s)?";
						[myAnswer1 setTitle: @"1"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"2"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"3"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"4"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 11:
						myQuestion.text = @"Talking Rain is a _____ company?";
						[myAnswer1 setTitle: @"Beverage"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Packageing"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Food"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Cleaning"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 12:
						myQuestion.text = @"Christmas is on what day?";
						[myAnswer1 setTitle: @"December 3rd"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"December 24th"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"December 25th"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"December 26th"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 13:
						myQuestion.text = @"Windex is famous for its _____ color?";
						[myAnswer1 setTitle: @"Green"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Yellow"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Grey"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Blue"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 14:
						myQuestion.text = @"The universal suggested daily calorie intake is...";
						[myAnswer1 setTitle: @"1500 Calories"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"2000"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"2200"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"2500"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 15:
						myQuestion.text = @"Where is the Catholic Church headquatered?";
						[myAnswer1 setTitle: @"London"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"New York"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Constantinople"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Vatican City"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 16:
						myQuestion.text = @"Which of the following is not a gum company?";
						[myAnswer1 setTitle: @"Blizzards"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Orbit"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Trident"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"5 Gum"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
																								
                    default:
                        break;
                }
																break;

               
            case 4:        
																[myNavItem setTitle: @"Question 4"];
                myMoney.text = @"3,000";
                [myWorth setTitle: @"$1,000"];
                moneyPot=3000;
                checkpoint=0;
				int randPath4 = random()%17+1;
												
                switch (randPath4) {
                    case 1:
                        myQuestion.text = @"Pop Singer _________ had hit songs 'Thriller' and 'Billie Jean'";
                        [myAnswer1 setTitle: @"Stevie Wonder"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Britney Spears"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Justin Bieber"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Michael Jackson"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"Which of these movies has an academy award?";
                        [myAnswer1 setTitle: @"Slumdog Millionaire"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Final Destination"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Spy Kids 3"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Yo There"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"Breast cancer awareness revolves around the color...";
                        [myAnswer1 setTitle: @"Blue"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Pink"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Green"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Yellow"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 4:
                        myQuestion.text = @"Water's molecular representation is...";
                        [myAnswer1 setTitle: @"4W"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"H2O"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"WTR"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"0_0"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"Which of the following is not a unit used to measure electricity?";
                        [myAnswer1 setTitle: @"Jams"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Watts"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Volts"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Joules"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Which of the following is not a US pro football team?";
                        [myAnswer1 setTitle: @"The Giants"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The Seahawks"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The Jets"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"The Bulldogs"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 7:
						myQuestion.text = @"Orchids are a type of...";
						[myAnswer1 setTitle: @"Vegetable"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Fish"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Flower"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Bread"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 8:
						myQuestion.text = @"Edgar Allen Poe did not write which of the following stories/poems?";
						[myAnswer1 setTitle: @"The Raven"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The Pit & Pendulum"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"The House of Usher"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"The Skull Tomb"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 9:
						myQuestion.text = @"The 'Mona Lisa' is painted by...";
						[myAnswer1 setTitle: @"Di Vinci"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Jackson Pollock"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Rembrant"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Vermeer"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 10:
						myQuestion.text = @"Which of the following is not a car company?";
						[myAnswer1 setTitle: @"Citron"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Subaru"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Smart Car"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Venus"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 11:
						myQuestion.text = @"The Seattle American Football team name is...";
						[myAnswer1 setTitle: @"The Seahawks"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The Cowboys"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"The Rangers"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"The Chargers"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 12:
						myQuestion.text = @"Dr. Grip is a _____ company?";
						[myAnswer1 setTitle: @"Beverage"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Chair"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Pen"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Shoe"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 13:
						myQuestion.text = @"Which of the following is not a child that enters Willie Wonka's factory in 'Charlie and the Chocolate Factory'?";
						[myAnswer1 setTitle: @"Augustus Gloop"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Veruca Salt"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Violet Beauregarde"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Miranda Piker"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 14:
						myQuestion.text = @"Surgical Gloves are generally made out of...";
						[myAnswer1 setTitle: @"Latex"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Linen"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Polyester"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Rubber"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 15:
						myQuestion.text = @"Natural Gas is _____ into a liquid for transport.";
						[myAnswer1 setTitle: @"Evaoprated"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Pressurized"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Condensated"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Sublimated"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 16:
						myQuestion.text = @"Bing, the search engine, is made by what company?";
						[myAnswer1 setTitle: @"Microsoft"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Northface"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Google"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Yahoo"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 17:
						myQuestion.text = @"What is the first four letters on the center line of the American standard keyboard?";
						[myAnswer1 setTitle: @"qwer"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"adfg"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"ajkl"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"asdf"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
																					
                    default:
                        break;
                }
																break;

            case 5:        
																[myNavItem setTitle: @"Question 5"];
                myMoney.text = @"4,000";
                [myWorth setTitle: @"$1,000"];
                moneyPot=4000;
                checkpoint=0;
				int randPath5 = random()%16+1;
											
                switch (randPath5) {
                    case 1:
                        myQuestion.text = @"A moon that is shrinking in size is called a _____ moon.";
                        [myAnswer1 setTitle: @"Waxing"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Waning"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Bringing"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Blonging"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"George Bush's vice president's name was...";
                        [myAnswer1 setTitle: @"Bob Dole"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"John McCain"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"John Kerry"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Dick Chaney"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"A touchdown in american football is worth _____ points.";
                        [myAnswer1 setTitle: @"7"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"6"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"3"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"1"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 4:
                        myQuestion.text = @"Tazo is a brand of...";
                        [myAnswer1 setTitle: @"Hot Sauce"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Tea"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Coffee"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Pepper"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"Humans are scientifically classified as...";
                        [myAnswer1 setTitle: @"Homo Habilis"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Homo Erectus"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Arthrathicus"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Homo Sapiens"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"The Capitol of Canada is...";
                        [myAnswer1 setTitle: @"Ottawa"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Vancover BC"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Ontario"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Toronto"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 7:
						myQuestion.text = @"T-mobile is now merged with which of these companies?";
						[myAnswer1 setTitle: @"Amoco"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"AT&T"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Bank One"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Compaq"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 8:
						myQuestion.text = @"Which of the following is not a bank?";
						[myAnswer1 setTitle: @"Chase"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Wells Fargo"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"WA Mutual"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Lenovo"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 9:
						myQuestion.text = @"The _____ Patriots is a US America Football team.";
						[myAnswer1 setTitle: @"New England"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Washington"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Massachusetts"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Boston"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 10:
						myQuestion.text = @"The line, 'Et Tu Brute, then fall Ceasar!' comes from a famous play written by who?";
						[myAnswer1 setTitle: @"Homer"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"William Shakespear"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Authur Miller"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"John Fletcher"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 11:
						myQuestion.text = @"The Impressionist movement started approximently when?";
						[myAnswer1 setTitle: @"1850's"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"1870's"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"1890's"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"1900's"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 12:
						myQuestion.text = @"Captian Jack sparrow is played by whom?";
						[myAnswer1 setTitle: @"Tom Hanks"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Leonardo DiCaprio"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Brad Pitt"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Jonny Depp"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 13:
						myQuestion.text = @"Bill Gates is the founder and CEO of...";
						[myAnswer1 setTitle: @"YouTube"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Google"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Intel"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Microsoft"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 14:
						myQuestion.text = @"David Beckham is plays what sport?";
						[myAnswer1 setTitle: @"Football"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Soccer"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Basketball"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Polo"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 15:
						myQuestion.text = @"What is the largest (by populaiton) of the following cities?";
						[myAnswer1 setTitle: @"Seattle"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"New York"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Chicago"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Detroit"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 16:
						myQuestion.text = @"The California ___ are famous gold diggers.";
						[myAnswer1 setTitle: @"69er's"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Diggers"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"49er's"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Miners"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
                    default:
                        break;
                }
																break;

            case 6:        
																[myNavItem setTitle: @"Question 6"];
                myMoney.text = @"5,000";
                [myWorth setTitle: @"$5,000"];
                moneyPot=5000;
                checkpoint=5000;
				int randPath6 = random()%16+1;
												
                switch (randPath6) {
                    case 1:
                        myQuestion.text = @"The 'H' in 'H2O' stands for...";
                        [myAnswer1 setTitle: @"Helium"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Hydrocodone"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Hydrogen"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Hydrogenated"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"Helium is the ____ lightest element";
                        [myAnswer1 setTitle: @"Second"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Fifth"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Seventh"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Third"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"The Beatles consisted of ___ band members.";
                        [myAnswer1 setTitle: @"4"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"5"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"3"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"7"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 4:
                        myQuestion.text = @"The square root of 14 is...";
                        [myAnswer1 setTitle: @"7"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Irrational"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Not Real"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"3.741"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"The French flag has ____ on it.";
                        [myAnswer1 setTitle: @"Green"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Black"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Blue"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Yellow"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Tabasco Sauce is mostly made up of...";
                        [myAnswer1 setTitle: @"Tomatoes"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Vineger"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Bell Peppers"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Water"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 7:
						myQuestion.text = @"Which of the following is not a film studio?";
						[myAnswer1 setTitle: @"Paramont"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Liberty Ent."  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Warner Bro."  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Nickelodean"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 8:
						myQuestion.text = @"The pharse, 'Viva La Revolution!' is from what revolution?";
						[myAnswer1 setTitle: @"American"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"French"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Russian"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Swiss"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 9:
						myQuestion.text = @"Van Gogh was a ___ artist.";
						[myAnswer1 setTitle: @"Modern"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Impressionist"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Post-Impressionist"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Neo-Classical"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 10:
						myQuestion.text = @"Who said, 'Never, Never, Never, Never give up,' during World War II?";
						[myAnswer1 setTitle: @"F. Roosevelt"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Truman"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"W. Churchill"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Hitler"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 11:
						myQuestion.text = @"What year did World War II end, (in Japn and in Europe)?";
						[myAnswer1 setTitle: @"1943"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"1944"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"1945"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"1946"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 12:
						myQuestion.text = @"Blockbuster, 'Titanic,' starred Leonardo DiCaprio and...";
						[myAnswer1 setTitle: @"Meagan Fox"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Angelina Jolie"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Kate Winslet"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Diane Keaton"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						
					case 13:
						myQuestion.text = @"'The Godfather' movie series has ";
						[myAnswer1 setTitle: @"Meagan Fox"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Angelina Jolie"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Kate Winslet"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Diane Keaton"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 14:
						myQuestion.text = @"What is the maximum score on the SAT?";
						[myAnswer1 setTitle: @"36"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"800"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"1600"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"2400"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 15:
						myQuestion.text = @"Which of the following is not a citrus fruit?";
						[myAnswer1 setTitle: @"Grapefruit"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Grape"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Orange"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Lime"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 16:
						myQuestion.text = @"A safety in football is worth how many points??";
						[myAnswer1 setTitle: @"1"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"2"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"3"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"6"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
																								
                    default:
                        break;
                }
																break;

            case 7:
                [myNavItem setTitle: @"Question 7"];
                myMoney.text = @"10,000";
                [myWorth setTitle: @"$5,000"];
                moneyPot=10000;
                checkpoint=5000;
				int randPath7 = random()%15+1;
										
                switch (randPath7) {
                    case 1:
                        myQuestion.text = @"Which of the following is closest to the value of the mathematical concept 'pi'?";
                        [myAnswer1 setTitle: @"3.14"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"3.251236135"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"3.1415"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"3.1416"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"What so-called 'war' spawned the dueling slogans 'Better Dead Than RED' and 'Better Red Than Dead' in the 1950's?";
                        [myAnswer1 setTitle: @"World War II"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"World War I"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Cold War"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Vietnam War"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"The Standard form for a quadratic equation is...";
                        [myAnswer1 setTitle: @"ax^2+bx+c=0"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"ax+bx=cx"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"mx+b=y"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"4x-5y=0"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 4:
                        myQuestion.text = @"If a story is erroneous it is?";
                        [myAnswer1 setTitle: @"Inaccurate"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Authentic"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Removed"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Sad"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"What is the name of the stick that is passed in most relays?";
                        [myAnswer1 setTitle: @"Baton"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Pole"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Stick"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Stub"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Apart from immunization for diseases, what other activities are undertaken to assist in the promotion of health?";
                        [myAnswer1 setTitle: @"Education"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Potable Water"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Sanitation Systems"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"All of the above"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 7:
						myQuestion.text = @"The largest city in India is...";
						[myAnswer1 setTitle: @"Bombay"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Calcutta"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Delhi"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Bengalore"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 8:
						myQuestion.text = @"The hit series, 'Percy Jackson and the Olympians' was written by...";
						[myAnswer1 setTitle: @"Rick Riordan"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Ken Jennings"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Betsey Bayers"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Gordon Korman"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 9:
						myQuestion.text = @"Which of the following is not a great lake?";
						[myAnswer1 setTitle: @"Lake Superior"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Lake Erin"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Lake Michigan"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Lake Huron"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"What is the top grossing movie of all time?";
						[myAnswer1 setTitle: @"Titanic"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Toy Story 3"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Star Wars"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Avatar"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 11:
						myQuestion.text = @"China does not border which of these countries?";
						[myAnswer1 setTitle: @"North Korea"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"India"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Burma"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Bangladesh"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 12:
						myQuestion.text = @"The Andes Mountain Range is primarily located in what country?";
						[myAnswer1 setTitle: @"Mexico"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Morocco"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Chile"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Peru"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 13:
						myQuestion.text = @"Which of the following is (or was) not an NBA basketball player?";
						[myAnswer1 setTitle: @"Brett Farve"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"LeBron James"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Coby Bryant"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Magic Johnson"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 14:
						myQuestion.text = @"Who hosted the 1996 Olympics?";
						[myAnswer1 setTitle: @"Australia"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The USA"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Greece"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"China"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 15:
						myQuestion.text = @"The man who assasinated JFK was later ______.";
						[myAnswer1 setTitle: @"Also assasinated"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Sentanced"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Convicted"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Aquitted"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
																							
                    default:
                        break;
                }
																break;


            case 8:
																[myNavItem setTitle: @"Question 8"];
                myMoney.text = @"15,000";
                [myWorth setTitle: @"$5,000"];
                moneyPot=15000;
                checkpoint=5000;
				int randPath8 = random()%15+1;
										
                switch (randPath8) {
                    case 1:
                        myQuestion.text = @"How many US fluid ounces are in a cup?";
                        [myAnswer1 setTitle: @"24"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"16"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"8"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"6"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"Which of these presidents were not assasinated?";
                        [myAnswer1 setTitle: @"Kennedy"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Lincoln"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Jackson"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Garfield"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"What was a gladiator armed with, in addition to a dagger and spear?";
                        [myAnswer1 setTitle: @"An Ax"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"A Projectile"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"A Mace"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"A Net"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 4:
                        myQuestion.text = @"What is the proper name for what is commonly called 'bow-tie pasta'?";
                        [myAnswer1 setTitle: @"Ruote"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Farfalle"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Linguine"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Elbow Macaroni"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"The 'Wars of the Roses' were fought to control which country's throne?";
                        [myAnswer1 setTitle: @"England"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Russia"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Scotland"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Ireland"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"The movie 'Wall-E' is made by...";
                        [myAnswer1 setTitle: @"Dreamworks"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Bad Robot"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Universal Studios"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Pixar"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 7:
						myQuestion.text = @"Pixar was recently bought by...";
						[myAnswer1 setTitle: @"Dreamworks"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Warner Bros."  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Disney"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Nickelodean"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 8:
						myQuestion.text = @"Of the US states that border Mexico, which shares the shortest border?";
						[myAnswer1 setTitle: @"California"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Arizona"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"New Mexico"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Texas"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 9:
						myQuestion.text = @"Which of the following is not involved in the sport of curling?";
						[myAnswer1 setTitle: @"The Broom"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The Rock"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"The Ice"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"The Chip"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 10:
						myQuestion.text = @"The Samsung ______ was the first android-based tablet.";
						[myAnswer1 setTitle: @"Pad"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Galaxy"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"FroYo"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Atrix"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 11:
						myQuestion.text = @"OJ Simpson was aquitted from what crime?";
						[myAnswer1 setTitle: @"Assult"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Arson"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Dog Fighting"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Murder"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 12:
						myQuestion.text = @"Monet painted his famous, blurred water lillies when he was...";
						[myAnswer1 setTitle: @"Young"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"At his peak"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Older"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Very Elderly"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 13:
						myQuestion.text = @"Hurricane Katrina was a category __ hurricane?";
						[myAnswer1 setTitle: @"1"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"2"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"3"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"4"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 14:
						myQuestion.text = @"The Most Violent hurricane is a category ___ huricane?";
						[myAnswer1 setTitle: @"4"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"5"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"6"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"No Limit"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 15:
						myQuestion.text = @"The maximum score on the ACT is...";
						[myAnswer1 setTitle: @"24"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"32"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"36"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"2400"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
																					
                    default:
                        break;
                }
																break;

            case 9:
																[myNavItem setTitle: @"Question 9"];
                myMoney.text = @"20,000";
                [myWorth setTitle: @"$5,000"];
                moneyPot=20000;
                checkpoint=5000;
				int randPath9 = random()%15+1;
										
                switch (randPath9) {
                    case 1:
                        myQuestion.text = @"Lincoln was assinated by a Confederate extreamist who's last name was...";
                        [myAnswer1 setTitle: @"Oswald"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Hackerman"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Booth"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Buchanan"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"What single name is more commonly applied to Holy Roman Emperor Charles the Great?";
                        [myAnswer1 setTitle: @"Pepin"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"William"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"French Charles"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Charlemagne"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"The 'Halo' series is made by which company?";
                        [myAnswer1 setTitle: @"Steam"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Bungee"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Valve"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Pyrex"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 4:
                        myQuestion.text = @"The town of Verona was the setting for which Shakespearan play?";
                        [myAnswer1 setTitle: @"Romeo and Juliet"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Othello"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Richad III"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Hamlet"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"What car company produces the Impala?";
                        [myAnswer1 setTitle: @"Dodge"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Ford"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Chevolet"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Land Rover"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Fox, Boston, and Jack Russel are adjectives describing what?";
                        [myAnswer1 setTitle: @"Rabbits"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Dogs"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Foxes"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Snakes"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 7:
					    myQuestion.text = @"The plural of fox is...";
                        [myAnswer1 setTitle: @"Foxes"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Foxies"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Fox"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Fox's"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 8:
						myQuestion.text = @"Which of the following superheros is not part of Marvel's 'Avengers'?";
						[myAnswer1 setTitle: @"The Wasp"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The Green Lantern"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Captain America"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"The Hulk"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 9:
						myQuestion.text = @"Which of the following superheros is not part of DC Comics' 'Justice Leauge'?";
						[myAnswer1 setTitle: @"Flash"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Thor"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Batman"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Aquaman"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"This 'angelic' looking actress had a photo shown in 'Life' magazine in 1976 that subsequently became the best selling poster of the 20th century. Who was she?";
						[myAnswer1 setTitle: @"Farrah Fawcett"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Olivia Newton-John"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Pamela Anderson"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Kate Jackson"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 11:
						myQuestion.text = @"In the game of 'Monopoly,' what is the name of the most expensive property??";
						[myAnswer1 setTitle: @"Water Works"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Park Place"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Boardwalk"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Marvin Gardens"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 12:
						myQuestion.text = @"In which sport would a pommel horse be used?";
						[myAnswer1 setTitle: @"American Football"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Rodeo"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Gymnastics"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Horse racing"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;	
						
					case 13:
						myQuestion.text = @"Which of the following is not considered game?";
						[myAnswer1 setTitle: @"Deer"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Geese"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Rabbit"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Elk"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 14:
						myQuestion.text = @"Who succeeded JFK after he was assasinated in 1963?";
						[myAnswer1 setTitle: @"Richard Nixon"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Andrew Johnson"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Gerald Ford"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Lyndon Johnson"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 15:
						myQuestion.text = @"How many people are currently respresentatives in The United States House of Representatives?";
						[myAnswer1 setTitle: @"400"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"415"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"425"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"435"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
																								
                    default:
                        break;
                }
																break;


            case 10:
																[myNavItem setTitle: @"Question 10"];
                myMoney.text = @"25,000";
                [myWorth setTitle: @"$25,000"];
                moneyPot=25000;
                checkpoint=25000;
				int randPath10 = random()%12+1;
										
                switch (randPath10) {
                    case 1:
                        myQuestion.text = @"Who was the last president of the Soviet Union?";
                        [myAnswer1 setTitle: @"Lenin"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Slovek"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Putin"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Gorbachev"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"What modern vehicle was invented to circumvent trench warfare?";
                        [myAnswer1 setTitle: @"The Jet"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The Hummer"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The Tank"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"The Subterranial"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"Who is the Greek god of Marriage?";
                        [myAnswer1 setTitle: @"Hera"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Aphrodite"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Vare"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Athena"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 4:
                        myQuestion.text = @"How many teaspoons are in one tablespoon in US measurement?";
                        [myAnswer1 setTitle: @"5"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"4"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"6"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"3"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"Which coffee boasts that 'The best part of waking up is in your cup?'";
                        [myAnswer1 setTitle: @"Maxwell House"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Flogers"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Starbucks"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Tully's"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Coffee was first grown in...";
                        [myAnswer1 setTitle: @"NW America"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Eastern Europe"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Arabia"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"China"  forState:UIControlStateNormal];
                        myAnswerReal = 3;
                        break;
						
					case 7:
						myQuestion.text = @"During what war was 'The Iliad' set in?";
						[myAnswer1 setTitle: @"First Persian War"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Trojan War"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Peloponnesian Wars"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Battle of Marathon"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 8:
						myQuestion.text = @"Achilles, a mythological hero, supposedly fought in what war?";
						[myAnswer1 setTitle: @"First Persian War"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Trojan War"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Peloponnesian Wars"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Battle of Marathon"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 9:
						myQuestion.text = @"Gerald Ford succeeded which of the following presidents?";
						[myAnswer1 setTitle: @"Lincoln"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Kennedy"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Nixon"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Carter"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 10:
						myQuestion.text = @"In the US, for every one of these creatures in the wild, there are 700 plastic replicas decorating lawns. What creature is it?";
						[myAnswer1 setTitle: @"Gnomes"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Flamingos"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Deer"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Frogs"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 11:
						myQuestion.text = @"In the ABBA song 'Dancing Queen' - How old was the Dancing Queen?";
						[myAnswer1 setTitle: @"16"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"21"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"18"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"17"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 12:
						myQuestion.text = @"The 2016 Summer Olympic Games will be hosted where?";
						[myAnswer1 setTitle: @"London"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Brazil"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"S. Korea"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"America"  forState:UIControlStateNormal];
						myAnswerReal =2;
						break;
						
						
																								
                    default:
                        break;
                }
																break;

            case 11:
																[myNavItem setTitle: @"Question 11"];
                myMoney.text = @"50,000";
                [myWorth setTitle: @"$25,000"];
                moneyPot=50000;
                checkpoint=25000;
				int randPath11 = random()%11+1;
										
                switch (randPath11) {
                    case 1:
                        myQuestion.text = @"What political system was gradually dismantled in South Africa, starting in 1989?";
                        [myAnswer1 setTitle: @"The Reactionism"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The Divide"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The 'Command'"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"The Apartheid"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"'Dunder Mifflin' is a fictional company in what show?";
                        [myAnswer1 setTitle: @"30 Rock"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Get Smart"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The Office"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Friends"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"The majority of the European Union flag is...?";
                        [myAnswer1 setTitle: @"Blue"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Red"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"White"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Yellow"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 4:
                        myQuestion.text = @"What language is spoken, as a first language, by the most people worldwide?";
                        [myAnswer1 setTitle: @"Indian"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"English"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Chinese "  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Sanskrit"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"What character had a sidekick by the name of Boo-Boo?";
                        [myAnswer1 setTitle: @"Bugs Bunny"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Yogi Bear"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Winnie the Poo"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Mickey Mouse"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"The 2010 World Series was won by...";
                        [myAnswer1 setTitle: @"The Giants"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"The Rangers"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"The Yankees"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"The Redsox"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 7:
						myQuestion.text = @"The 2005 Super Bowl was won by...";
						[myAnswer1 setTitle: @"The Patriots"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"The Eagles"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"The Stealers"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"The Giants"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 8:
						myQuestion.text = @"Which of the following books did Mark Twain not write?";
						[myAnswer1 setTitle: @"Tom Sawyer"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Huckleberry Fin"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Moby Dick"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Roughing It"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 9:
						myQuestion.text = @"The heart, as a whole, is a(n)...";
						[myAnswer1 setTitle: @"Tissue"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Organ"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Muscle"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Cartilage"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"Beethoven's 9th Symphony is famous for its _____ movement?";
						[myAnswer1 setTitle: @"Ode to Joy"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Suprise"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Ex Porium"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Incomplete"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 11:
						myQuestion.text = @"Which of the following is not an extreemist Islamic faction.";
						[myAnswer1 setTitle: @"Taliban"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Hezbola"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Al-Qaida"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Sunnis"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
						
																								
                    default:
                        break;
                }
																break;

            case 12:
                [myNavItem setTitle: @"Question 12"];
                myMoney.text = @"75,000";
                [myWorth setTitle: @"$25,000"];
                moneyPot=75000;
                checkpoint=25000;
				int randPath12 = random()%11+1;
										
                switch (randPath12) {
                    case 1:
                        myQuestion.text = @"Who said: 'I'm the president of the United States and I'm not going to eat any more broccoli'?";
                        [myAnswer1 setTitle: @"Andrew Jackson"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Bill Clinton"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"George W. Bush"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"George H. W. Bush"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"'Youtube' is owned by...";
                        [myAnswer1 setTitle: @"GE"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Themselves"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Google"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Microsoft"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"Washington DC houses _____ Univerisity?";
                        [myAnswer1 setTitle: @"American"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Brown"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Columbia"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Layola"  forState:UIControlStateNormal];
                        myAnswerReal = 1;
                        break;
						
					case 4:
                        myQuestion.text = @"Willie Nelson sings what genre of music?";
                        [myAnswer1 setTitle: @"Jazz"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Pop"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Rock"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Country"  forState:UIControlStateNormal];
                        myAnswerReal = 4;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"What is the largest rodent in the world?";
                        [myAnswer1 setTitle: @"Capybara"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Mole"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Brown Rat"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Raccoon"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"What was Charlie Browns younger sisters name?";
                        [myAnswer1 setTitle: @"Cindi"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Sally"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Hillary"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Alex"  forState:UIControlStateNormal];
                        myAnswerReal = 2;
                        break;
						
					case 7:
						myQuestion.text = @"The Dow Jones Industrial average consists of how many corperations?";
						[myAnswer1 setTitle: @"20"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"30"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"50"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"100"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 8:
						myQuestion.text = @"On average, how many babies are bown each day in the United States?";
						[myAnswer1 setTitle: @"2,000"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"5,000"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"7,500"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"10,000"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
					case 9:
						myQuestion.text = @"What is the second most common cause of death in the US?";
						[myAnswer1 setTitle: @"Heart Disease"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Cancer"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Lung Disease"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Strokes"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 10:
						myQuestion.text = @"What is the creator of the game 'Angry Birds'?";
						[myAnswer1 setTitle: @"Rovio Studios"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Lima Sky"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Chillingo"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Microsoft"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 11:
						myQuestion.text = @"Which of the following is not a hotel?";
						[myAnswer1 setTitle: @"Starwood"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Hyatt"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Renissance"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Ritz"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
																								
                    default:
                        break;
                }
																break;

            case 13:
                [myNavItem setTitle: @"Question 13"];
                myMoney.text = @"100,000";
                [myWorth setTitle: @"$100,000"];
                moneyPot=100000;
                checkpoint=25000;
				int randPath13 = random()%9+1;
											
                switch (randPath13) {
                    case 1:
                        myQuestion.text = @"What current branch of the U.S. military was a corps of only 50 soldiers when World War I broke out?";
                        [myAnswer1 setTitle: @"Marine Corps"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Air Force"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Coast Guard"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Parasoldier Corps"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"What ethnic group was largely responsible for building most of the early railways in the U.S. West?";
                        [myAnswer1 setTitle: @"Blacks"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Chinese"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Native American"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"White 'Trash'"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"Mars is named after a Roman God, who's Greek name is...";
                        [myAnswer1 setTitle: @"Zeus"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Hephestus"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Ares"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Hades"  forState:UIControlStateNormal];
                        myAnswerReal = 3;
                        break;
					case 4:
                        myQuestion.text = @"The number of people in a bobsled can be...";
                        [myAnswer1 setTitle: @"1,2, or 4"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"2 or 4"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"4 or 6"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"2, 4, or 6"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"When was the telescope invented?";
                        [myAnswer1 setTitle: @"16th Century"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"15th Century"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"17th Century"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"14th Century"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Who invented the telescope?";
                        [myAnswer1 setTitle: @"Thomas Newcomen"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"David Bushnell"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Hans Lippershey"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Issac Newton"  forState:UIControlStateNormal];
                        myAnswerReal = 3;
                        break;
						
					case 7:
						myQuestion.text = @"Who was the runner-up of the '92 eleciton?";
						[myAnswer1 setTitle: @"Bob Dole"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"George H.W. Bush"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Michael Dukakas"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"George W Bush"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 8:
						myQuestion.text = @"About how long ago did humans start domesticating animals?";
						[myAnswer1 setTitle: @"5,000 years ago"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"10,000"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"15,000"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"20,000"  forState:UIControlStateNormal];
						myAnswerReal = 2;
						break;
						
					case 9:
						myQuestion.text = @"Who was the runner-up of the 2006 Super Bowl?";
						[myAnswer1 setTitle: @"Patriots"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Stealers"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Cardinals"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Seahawks"  forState:UIControlStateNormal];
						myAnswerReal = 4;
						break;
						
						
																								
                    default:
                        break;
                }
																break;

            case 14:
				[myNavItem setTitle: @"Question 14"];
                myMoney.text = @"200,000";
                [myWorth setTitle: @"$100,000"];
                moneyPot=200000;
                checkpoint=25000;
				int randPath14 = random()%9+1;
												
                switch (randPath14) {
                    case 1:
                        myQuestion.text = @"Which of the following is not a US Supreme Court justice currently?";
                        [myAnswer1 setTitle: @"William Rehnquist"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Sonya Sotomayor"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Elena Kagan"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Anthony Kennedy"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                        
                        break;
																								
                    case 2:
                        myQuestion.text = @"Who is the Hindu god of creation?";
                        [myAnswer1 setTitle: @"Brahma"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Shiva"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Odin"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Vishnu"  forState:UIControlStateNormal];
                        myAnswerReal = 1;                      
                        break;
																								
                    case 3:
                        myQuestion.text = @"Dwight Eisenhower was elected US President in the year...";
                        [myAnswer1 setTitle: @"1950"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"1948"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"1952"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"1953"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 4:
                        myQuestion.text = @"How many members does OPEC have?";
                        [myAnswer1 setTitle: @"8"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"10"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"12"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"14"  forState:UIControlStateNormal];
                        myAnswerReal = 3;                        
                        break;
						
                    case 5:
                        myQuestion.text = @"What element is used in an atomic clock?";
                        [myAnswer1 setTitle: @"Thorium"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Cecium"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Uranium"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Americinium"  forState:UIControlStateNormal];
                        myAnswerReal = 2;                      
                        break;
						
                    case 6:
                        myQuestion.text = @"Samsura is a ____ concept";
                        [myAnswer1 setTitle: @"Buddhist"  forState:UIControlStateNormal];
                        [myAnswer2 setTitle: @"Janist"  forState:UIControlStateNormal];
                        [myAnswer3 setTitle: @"Islamic"  forState:UIControlStateNormal];
                        [myAnswer4 setTitle: @"Hindu"  forState:UIControlStateNormal];
                        myAnswerReal = 4;
                        break;
						
					case 7:
						myQuestion.text = @"How did Chairman Mao's last wife, Jiang Qing, allegedly die of?";
						[myAnswer1 setTitle: @"Old age"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Throat cancer"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Hanging herself"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Killed by inmate"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
					case 8:
						myQuestion.text = @"'Pol Pot' was dictator of what country?";
						[myAnswer1 setTitle: @"Cambodia"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Columbia"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Cuba"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"Guatamala"  forState:UIControlStateNormal];
						myAnswerReal = 1;
						break;
						
					case 9:
						myQuestion.text = @"Monet's water lillie paintings are found in what city?";
						[myAnswer1 setTitle: @"London"  forState:UIControlStateNormal];
						[myAnswer2 setTitle: @"Nice"  forState:UIControlStateNormal];
						[myAnswer3 setTitle: @"Paris"  forState:UIControlStateNormal];
						[myAnswer4 setTitle: @"New York City"  forState:UIControlStateNormal];
						myAnswerReal = 3;
						break;
						
						
																								
                    default:
                        break;
                }
				break;
			case 15:
				;
                goforit *screen=[goforit alloc];
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

- (void)hintAlert:(int) c1: (int) c2: (int) c3:(int) c4
{
    if(hintused == false)
    {
        hintused = true;
        if(c1 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%3 +2;
            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice %i or choice 1",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"50/50"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];

        }
        if(c2 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%4 + 1;
            if(temp==2)
            {
                temp=4;
            }
            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice 2 or choice %i",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"50/50"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
            

        }
        if(c3 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%4 +1;
            if(temp==3)
            {
                temp=1;
            }
            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice 3 or choice %i",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"50/50"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
        }
        if(c4 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%2 +2;
            NSString *newText = [[NSString alloc] initWithFormat: @"The answer is either choice %i or choice 4",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"50/50"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
            

        }
    }
    else
    {
        NSString *msg = nil;
        msg = @"You already used your 50/50 hint.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nice Try"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Go Back"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release]; 
    }
}
- (void)phoneAlert:(int) d1: (int) d2: (int) d3:(int) d4
{
    if(phoneused == false)
    {
        phoneused = true;
        if(d1 == 1)
        {
            NSString *msg = nil;
            
            msg = @"Your friend thinks the answer is choice 1, but he's not sure.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Phone a Friend"
                                  message:msg
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
            
        }
        if(d2 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%2 +2;
            NSString *newText = [[NSString alloc] initWithFormat: @"Your friend thinks the answer is choice %i, but he's not sure.",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Phone a Friend"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
            
            
        }
        if(d3 == 1)
        {
            NSString *msg = nil;
            
            msg = @"Your friend thinks the answer is choice 3, but he's not sure.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Phone a Friend"
                                  message:msg
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
        }
        if(d4 == 1)
        {
            NSString *msg = nil;
            
            int temp = random()%2 +2;
            NSString *newText = [[NSString alloc] initWithFormat: @"Your friend thinks the answer is choice %i, but he's not sure.",temp];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Phone a Friend"
                                  message:newText
                                  delegate:self
                                  cancelButtonTitle:@"Okay"
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [msg release];
            
            
        }
    }
    else
    {
        NSString *msg = nil;
        msg = @"You already used your phone a friend hint.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nice Try"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Go Back"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release]; 
    }
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
