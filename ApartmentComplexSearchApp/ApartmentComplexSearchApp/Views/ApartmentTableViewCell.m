//
//  ApartmentTableViewCell.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 17/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "ApartmentTableViewCell.h"
#import "Apartment.h"
#import "ApartmentPrice.h"

@interface ApartmentTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *apartmentImageView;
@property (weak, nonatomic) IBOutlet UILabel *apartmentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deadlineLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *metroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *metroDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *builderNameLabel;

// TODO: (Ch) Need to create separate self configurated view. View have only one property NSArray of prices.
@property (weak, nonatomic) IBOutlet UILabel *zeroRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *zeroRoomPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneRoomPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoRoomPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeRoomPriceLabel;

@end

@implementation ApartmentTableViewCell

- (void)fillWithApartment:(Apartment *)apartment
{
    self.apartmentImageView.image = apartment.apartmentImage;
    self.apartmentNameLabel.text = apartment.name;
    self.deadlineLabel.text = [NSString stringWithFormat:@"Срок сдачи: %@", apartment.deadline];
    self.stateNameLabel.text = apartment.state;
    self.metroNameLabel.text = apartment.nearestSubwayName;
    self.metroDistanceLabel.text = apartment.subwayDistanceTiming;
    self.builderNameLabel.text = apartment.builderName;
    
    for (ApartmentPrice *price in apartment.filteredPrices)
    {
        if ([[price.rooms substringToIndex:1] isEqualToString:@"С"])
        {
            self.zeroRoomLabel.text = @"Ст";
            self.zeroRoomPriceLabel.text = [NSString stringWithFormat:@"от %@ руб.", @(price.price)];
        }
        else if ([[price.rooms substringToIndex:1] isEqualToString:@"1"])
        {
            self.oneRoomLabel.text = @"1-к.кв";
            self.oneRoomPriceLabel.text = [NSString stringWithFormat:@"от %@ руб.", @(price.price)];
        }
        else if ([[price.rooms substringToIndex:1] isEqualToString:@"2"])
        {
            self.twoRoomLabel.text = @"2-к.кв";
            self.twoRoomPriceLabel.text = [NSString stringWithFormat:@"от %@ руб.", @(price.price)];
        }
        else if ([[price.rooms substringToIndex:1] isEqualToString:@"3"])
        {
            self.threeRoomLabel.text = @"3-к.кв";
            self.threeRoomPriceLabel.text = [NSString stringWithFormat:@"от %@ руб.", @(price.price)];
        }
    }
}

@end
