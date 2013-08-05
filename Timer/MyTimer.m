//
//  MyTimer.m
//  Timer
//
//  Created by Brian Dinh on 7/13/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "MyTimer.h"
//#import <AVFoundation/AVFoundation.h>

@interface MyTimer (){
  //  AVAudioPlayer *audioPlayer;
    __weak IBOutlet UILabel *remainingTimeLabel;
    __weak IBOutlet UIDatePicker *datePickerDate;
    NSTimer *myCountDown;
    BOOL running;
    double countsRemaining;
    __weak IBOutlet UILabel *titleLabel;
}
- (IBAction)toStopWatch:(id)sender;
- (IBAction)startCountDown:(id)sender;
- (IBAction)stopCountDown:(id)sender;

@end

@implementation MyTimer

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
    running = NO;
    [titleLabel setFont:[UIFont fontWithName:@"Quicksand" size:30]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toStopWatch:(id)sender {
    [self.view removeFromSuperview];
}

- (void)countDown;{
   
    
    countsRemaining = countsRemaining -1;
   // datePickerDate.countDownDuration = countsRemaining;
 
    int h, m, s;
    h = (countsRemaining / 3600);
    m = ((NSUInteger)(countsRemaining / 60)) % 60;
    s = ((NSUInteger) countsRemaining) % 60;

    
    remainingTimeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", h, m, s];
    
    if (countsRemaining == 0) {
        [myCountDown invalidate];
        running =NO;
        
        /*NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/-PokeCenter.mp3", [NSBundle mainBundle]]];
         
         NSError *error;
         audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
         audioPlayer.numberOfLoops=1;
         
         [audioPlayer play]; */
    }
}

- (IBAction)startCountDown:(id)sender {
    countsRemaining = datePickerDate.countDownDuration;
    {
        if (running == NO) {
            running = YES;
            myCountDown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        }

        
        
        
    }
}

- (IBAction)stopCountDown:(id)sender {
        running = NO;
        [myCountDown invalidate];
        countsRemaining = datePickerDate.countDownDuration;
        remainingTimeLabel.text = @"00:00:00";
}

@end
