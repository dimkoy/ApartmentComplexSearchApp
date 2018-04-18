//
//  ApartmentPrice.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "JSONModel.h"

@interface ApartmentPrice : JSONModel

@property (nonatomic, assign) NSInteger room;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, strong) NSString *rooms;

@end
