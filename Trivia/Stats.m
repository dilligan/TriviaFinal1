//
//  Stats.m
//  Trivia
//
//  Created by Deyan Milligan on 11/22/12.
//
//

#import "Stats.h"
#import "TriviaViewController.h"

@interface Stats ()

@end

@implementation Stats
@synthesize totalEarnings;
@synthesize millionAnswered;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *newText = [[NSString alloc] initWithFormat: @"%d", [defaults integerForKey:@"Total Earnings"]];
    totalEarnings.text=newText;
    NSString *newText2 = [[NSString alloc] initWithFormat: @"%d", [defaults integerForKey:@"Million Won"]];
    millionAnswered.text=newText2;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [totalEarnings release];
    [millionAnswered release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTotalEarnings:nil];
    [self setMillionAnswered:nil];
    [super viewDidUnload];
}
- (IBAction)goBack:(id)sender {
    TriviaViewController *screen=[TriviaViewController alloc];
	[self presentModalViewController:screen animated:YES];
}
@end
