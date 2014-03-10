//
//  BSViewController.m
//  BoobiSpin
//
//  Created by Sumeet Kumar on 3/5/14.
//  Copyright (c) 2014 Sumeet Kumar. All rights reserved.
//

#import "BSViewController.h"
#import "BSQuoteEngine.h"
@import AVFoundation;


#define urlString @"http://www.kumarsxray.com/quotes"


@interface BSViewController ()

@end

@implementation BSViewController



#pragma mark View
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL* sndurl = [[NSBundle mainBundle] URLForResource:@"zara" withExtension:@"mp3"];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:sndurl error:&error];
    [self.audioPlayer setNumberOfLoops:-1];
    [self.audioPlayer play];
    self.quoteShownLabel.text = @"";
    self.componentItemsOne = [NSMutableArray new];
    self.shownQuotes = [NSMutableSet new];
    
    
    for (int i = 1; i<=7; i++) {
        NSString *imageString =  [NSString stringWithFormat:@"jyoti%i.jpg",i];
        UIImage *jyotiImage = [UIImage imageNamed:imageString];
        [self.componentItemsOne addObject:jyotiImage];
    }
    
    
    [self.bsPicker setDelegate:self];
    [self.bsPicker setDataSource:self];
    [self.bsPicker setShowsSelectionIndicator:NO];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Get quotes
    self.quoteEngine = [BSQuoteEngine makeQuoteEngineWithURL:[NSURL URLWithString:urlString]];
    NSLog(@"%@",[self.quoteEngine quoteLines]);
    self.quoteShownLabel.text = [NSString stringWithFormat:@"0/%i",[self.quoteEngine.quoteLines count]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Data Source
//Data Source Methods (required)
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 6;
}

#pragma mark Delegate
//Delegate Methods
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIImage *image = [self.componentItemsOne objectAtIndex:row];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [imageView setFrame:CGRectMake(0, 0, 92, 100)];
    return imageView;
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 100;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 92;
}



#pragma mark Spin/Win
//Spin Methods
- (IBAction)spinWheel:(id)sender {
   
    
    NSMutableArray *rowTracker = [NSMutableArray new];
    
    for (int i =0; i<=2; i++) {
        int r = arc4random() % 7;
        [self.bsPicker selectRow:r inComponent:i animated:YES];
    }
    
    
    for (NSUInteger n = 0; n<=2; ++n) {
        NSUInteger selectedRow = [self.bsPicker selectedRowInComponent:n];
        NSNumber *numberForArray = [NSNumber numberWithInteger:selectedRow];
        [rowTracker addObject:numberForArray];
    }
    
    NSLog(@"%@",rowTracker);
    
    if ([rowTracker objectAtIndex:0] == [rowTracker objectAtIndex:1] && [rowTracker objectAtIndex:0] == [rowTracker objectAtIndex:2]) {
        
        [self.spinButton setHidden:YES];
        
        
        //[self animate];
        
        int randomQuote = arc4random() % [self.quoteEngine.quoteLines count];
        self.quoteTextView.text = [self.quoteEngine.quoteLines objectAtIndex:randomQuote];
        
        [self.shownQuotes addObject:[NSNumber numberWithInt:randomQuote]];
        self.quoteShownLabel.text = [NSString stringWithFormat:@"%i/%i",[self.shownQuotes count],[self.quoteEngine.quoteLines count]];
        [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(showButton) userInfo:nil repeats:NO];
       
        
        NSLog(@"success");
    }
    
    
    
}

#pragma mark Animations/Hide

-(void) animate {
    [UIView animateWithDuration:(2.0) delay:0 options:(UIViewAnimationOptionAutoreverse)animations:^{
        
        self.bsPicker.frame = CGRectMake(15, 240, 291, 162);
    } completion:^(BOOL finished) {
        self.bsPicker.frame = CGRectMake(15, 128, 291, 162);
    }];
    
}

-(void) showButton {
    
    NSLog(@"in show button")    ;
    
    [self.spinButton setHidden:NO];
    
}

@end
