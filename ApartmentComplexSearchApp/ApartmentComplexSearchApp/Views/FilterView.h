//
//  FilterView.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "XibView.h"

typedef NS_ENUM(NSInteger, FilterViewType)
{
    FilterViewTypeByPrice,
    FilterViewTypeByState,
    FilterViewTypeByMetro
};

@protocol FilterViewDelegate;

@interface FilterView : XibView

@property (nonatomic, assign) NSInteger apartmentCount;

@property (nonatomic, weak) id<FilterViewDelegate> delegate;

@end
