//
//  ViewController.m
//  Timer
//
//  Created by Brian Dinh on 7/12/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "ViewController.h"
#import "MyTimer.h"
@interface ViewController ()
{
    NSMutableArray *timesArray;
    __weak IBOutlet UIButton *startButton;
    __weak IBOutlet UIButton *pauseButton;
    __weak IBOutlet UIButton *stopButton;
    __weak IBOutlet UILabel *mSecondsDisplay;
    __weak IBOutlet UILabel *secondsDisplay;
    __weak IBOutlet UILabel *minutesDisplay;
    int mSeconds;
    int seconds;
    int minutes;
    NSTimer *_myTimer;
    BOOL running;
    MyTimer *mySecondView;
    __weak IBOutlet UILabel *stopWatchLabel;
    __weak IBOutlet UITableView *savedTimes;
    __weak IBOutlet UILabel *saved1;
    __weak IBOutlet UILabel *saved2;
    __weak IBOutlet UILabel *saved3;
    __weak IBOutlet UILabel *saved4;

}
- (IBAction)startTimer:(id)sender;
- (IBAction)pauseTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (IBAction)toCountDown:(id)sender;
- (IBAction)saveTime:(id)sender;
- (IBAction)clearTime:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad


{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    running = false;
    mSeconds = 0;
    seconds = 0;
    minutes = 0;
    [stopWatchLabel setFont:[UIFont fontWithName:@"Quicksand" size:50]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countUpMSeconds {
    if(running == false) return;
    
    mSeconds = mSeconds + 1;
    
    if (mSeconds == 100) {
        seconds++;
        mSeconds = 0;
    }
    if (seconds == 60) {
        minutes++;
        seconds = 0;
    }
    
    
    secondsDisplay.text = [NSString stringWithFormat:@":%02i", seconds];
    minutesDisplay.text = [NSString stringWithFormat:@"%02i", minutes];
    
    mSecondsDisplay.text = [NSString stringWithFormat:@".%02i", mSeconds];
    
}

- (IBAction)startTimer:(id)sender {
    if (running == false) {
        running = true;
        _myTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(countUpMSeconds) userInfo:nil repeats:YES];
    }
}

- (IBAction)pauseTimer:(id)sender {
    running = false;
    [_myTimer invalidate];
}

- (IBAction)stopTimer:(id)sender {
    running = false;
    [_myTimer invalidate];
    mSeconds = 0;
    seconds = 0;
    minutes = 0;
    mSecondsDisplay.text = @".00";
    secondsDisplay.text =@":00";
    minutesDisplay.text=@"00";
    
}

- (IBAction)toCountDown:(id)sender {
    running = false;
    [_myTimer invalidate];
    mySecondView=[[MyTimer alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:mySecondView.view];
    
}

- (IBAction)saveTime:(id)sender {
    if ([saved1.text isEqual: @"00:00.00"]) {
        saved1.text = [NSString stringWithFormat:@"%02i:%02i.%02i",minutes, seconds, mSeconds];
    }
    else if  ([saved2.text isEqual: @"00:00.00"]) {
        saved2.text = [NSString stringWithFormat:@"%02i:%02i.%02i",minutes, seconds, mSeconds];
    }
    else if  ([saved3.text isEqual: @"00:00.00"]) {
        saved3.text = [NSString stringWithFormat:@"%02i:%02i.%02i",minutes, seconds, mSeconds];
    }
    else if  ([saved4.text isEqual: @"00:00.00"]) {
        saved4.text = [NSString stringWithFormat:@"%02i:%02i.%02i",minutes, seconds, mSeconds];
    }
    

}

- (IBAction)clearTime:(id)sender {
    saved1.text = [NSString stringWithFormat:@"00:00.00"];
    saved2.text = [NSString stringWithFormat:@"00:00.00"];
    saved3.text = [NSString stringWithFormat:@"00:00.00"];
    saved4.text = [NSString stringWithFormat:@"00:00.00"];
    
}

@end
