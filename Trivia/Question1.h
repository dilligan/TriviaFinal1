//
//  Question1.h
//  Trivia
//
//  Created by iD Student Account on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Question1 : UIViewController {
    int question;
    
    IBOutlet UINavigationItem *myNavItem;
    IBOutlet UILabel *myQuestion;
    IBOutlet UIButton *myAnswer1;
    IBOutlet UIButton *myAnswer2;
    IBOutlet UIButton *myAnswer3;
    IBOutlet UIButton *myAnswer4;
    IBOutlet UILabel *myMoney;
    IBOutlet UINavigationItem *myWorth;
    
    int userAnswer;
    int myAnswerReal;
    BOOL usingSkip;
}
@property (nonatomic,retain) IBOutlet UINavigationItem *myNavItem;
@property (nonatomic,retain) IBOutlet UILabel *myQuestion;
@property (nonatomic,retain) IBOutlet UIButton *myAnswer1;
@property (nonatomic,retain) IBOutlet UIButton *myAnswer2;
@property (nonatomic,retain) IBOutlet UIButton *myAnswer3;
@property (nonatomic,retain) IBOutlet UIButton *myAnswer4;
@property (nonatomic,retain) IBOutlet UILabel *myMoney;
@property (nonatomic,retain) IBOutlet UINavigationItem *myWorth;


-(IBAction)skip;
-(IBAction)fifty;
-(IBAction)phone;
-(IBAction)nextQuestion;
-(IBAction)takemoney;

-(IBAction)quit;

-(IBAction)answer1clicked;
-(IBAction)answer2clicked;
-(IBAction)answer3clicked;
-(IBAction)answer4clicked;

@end
