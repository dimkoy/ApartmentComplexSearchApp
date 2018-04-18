//
//  FilterView.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "FilterView.h"
#import "FilterViewDelegate.h"

@interface FilterView ()

@property (weak, nonatomic) IBOutlet UILabel *apartmentCountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *filterSegmentControl;

@end

@implementation FilterView

- (void)setApartmentCount:(NSInteger)apartmentCount
{
    if (_apartmentCount != apartmentCount)
    {
        self.apartmentCountLabel.text = [NSString stringWithFormat:@"%@ объектов:", @(apartmentCount)];
    }
}
- (IBAction)filterApplied:(UISegmentedControl *)sender
{
    [self.delegate filterViewFilterChangedTo:sender.selectedSegmentIndex];
}

@end
