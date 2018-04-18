//
//  Apartment.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

@import UIKit;

#import "JSONModel.h"
#import "JSONModelLib.h"

@interface Apartment : JSONModel

@property (nonatomic, strong) NSDictionary *builder;
@property (nonatomic, strong) NSString *apartmentID;
@property (nonatomic, assign) NSInteger crm_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSDictionary *region;
@property (nonatomic, strong) NSArray *subways;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *deadline;
@property (nonatomic, strong) NSString *finishing;
@property (nonatomic, assign) NSInteger min_price;
@property (nonatomic, assign) NSInteger apart_count;
@property (nonatomic, strong) NSArray *min_prices;
@property (nonatomic, strong) NSString<Ignore> *labels;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSArray *сontractTypes;
@property (nonatomic, assign) BOOL marked;
@property (nonatomic, strong) NSArray *payment;
@property (nonatomic, strong) NSArray *advantages;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@property (nonatomic, strong) UIImage<Ignore> *apartmentImage;
@property (nonatomic, strong) NSString<Ignore> *state;
@property (nonatomic, strong) NSString<Ignore> *nearestSubwayName;
@property (nonatomic, strong) NSString<Ignore> *subwayDistanceTiming;
@property (nonatomic, strong) NSString<Ignore> *builderName;
@property (nonatomic, strong) NSArray<Ignore> *filteredPrices;

@end
