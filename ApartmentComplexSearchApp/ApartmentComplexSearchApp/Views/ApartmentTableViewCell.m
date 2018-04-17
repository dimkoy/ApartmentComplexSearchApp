//
//  ApartmentTableViewCell.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 17/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "ApartmentTableViewCell.h"
#import "Apartment.h"

@interface ApartmentTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *apartmentImageView;
@property (weak, nonatomic) IBOutlet UILabel *apartmentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deadlineLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *metroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *metroDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *builderNameLabel;


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
}

@end
