//
//  BSViewController.h
//  BoobiSpin
//
//  Created by Sumeet Kumar on 3/5/14.
//  Copyright (c) 2014 Sumeet Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)spinWheel:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *bsPicker;
@property (strong, nonatomic) NSMutableArray *componentItemsOne;

@end
