//
//  ApartmentTableViewCell.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 17/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Apartment;

@interface ApartmentTableViewCell : UITableViewCell

- (void)fillWithApartment:(Apartment *)apartment;

@end
