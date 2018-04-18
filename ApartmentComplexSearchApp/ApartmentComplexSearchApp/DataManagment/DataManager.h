//
//  DataManager.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataManagerDelegate;

@interface DataManager : NSObject

- (void)loadDataWithCount:(NSInteger)count
                   offset:(NSInteger)offset
                priceFrom:(NSInteger)priceFrom
                  priceTo:(NSInteger)priceTo;

- (NSArray *)filterByPrice;
- (NSArray *)filterByState;
- (NSArray *)filterByMetro;

@property (nonatomic, weak) id<DataManagerDelegate> delegate;

@end
