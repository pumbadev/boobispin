//
//  BSViewController.h
//  BoobiSpin
//
//  Created by Sumeet Kumar on 3/5/14.
//  Copyright (c) 2014 Sumeet Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVAudioPlayer;

@class BSQuoteEngine;

@interface BSViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)spinWheel:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *bsPicker;
@property (strong, nonatomic) NSMutableArray *componentItemsOne;
@property (strong, nonatomic) BSQuoteEngine *quoteEngine;
@property (strong, nonatomic) IBOutlet UITextView *quoteTextView;
@property (strong, nonatomic) NSMutableSet *shownQuotes;
@property (strong, nonatomic) IBOutlet UILabel *quoteShownLabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *spinButton;

-(void)showButton;

@end
