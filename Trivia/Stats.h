//
//  Stats.h
//  Trivia
//
//  Created by Deyan Milligan on 11/22/12.
//
//

#import <UIKit/UIKit.h>

@interface Stats : UIViewController
- (IBAction)goBack:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *totalEarnings;
@property (retain, nonatomic) IBOutlet UILabel *millionAnswered;

@end
