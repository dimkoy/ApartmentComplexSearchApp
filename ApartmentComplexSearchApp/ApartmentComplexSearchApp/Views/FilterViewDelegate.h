//
//  FilterViewDelegate.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilterView;

@protocol FilterViewDelegate <NSObject>

- (void)filterViewFilterChangedTo:(FilterViewType)type;

@end
