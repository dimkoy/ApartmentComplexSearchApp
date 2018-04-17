//
//  ApartmentListRequest.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataRequestProtocol.h"

@interface ApartmentListRequest : NSOperation <DataRequestProtocol>

+ (ApartmentListRequest *)initWithShowType:(NSString *)type
                                     count:(NSInteger)count
                                    offset:(NSInteger)offset
                                     cache:(BOOL)withCache
                                 priceFrom:(NSInteger)priceFrom
                                   priceTo:(NSInteger)priceTo;

- (void)start;

@end
