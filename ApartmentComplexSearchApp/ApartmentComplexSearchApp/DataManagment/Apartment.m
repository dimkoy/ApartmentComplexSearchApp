//
//  Apartment.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "Apartment.h"
#import "ApartmentPrice.h"

@interface Apartment()

@property (nonatomic, strong) NSDictionary<Ignore> *nearestSubway;
@property (nonatomic, strong) NSArray<Ignore> *prices;

@end

@implementation Apartment

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"apartmentID":@"id"}];
}

- (NSString<Ignore> *)state
{
    return [self.region valueForKey:@"name"];
}

- (NSString<Ignore> *)nearestSubwayName
{
    if (!self.nearestSubway)
    {
        self.nearestSubway = self.subways.firstObject;
        
        for (NSDictionary *subway in self.subways)
        {
            if ([self.nearestSubway valueForKey:@"distance_timing"] > [subway valueForKey:@"distance_timing"])
            {
                self.nearestSubway = subway;
            }
        }
    }
            
    return [self.nearestSubway valueForKey:@"name"];
}

- (NSString<Ignore> *)subwayDistanceTiming
{
    if (!self.nearestSubway)
    {
        self.nearestSubway = self.subways.firstObject;
        
        for (NSDictionary *subway in self.subways)
        {
            if ([self.nearestSubway valueForKey:@"distance_timing"] > [subway valueForKey:@"distance_timing"])
            {
                self.nearestSubway = subway;
            }
        }
    }
    
    return [NSString stringWithFormat:@"%@ мин.", [self.nearestSubway valueForKey:@"distance_timing"]];
}

- (NSString<Ignore> *)builderName
{
    return [self.builder valueForKey:@"name"];
}

- (NSArray<Ignore> *)filteredPrices
{
    NSMutableArray *prices = [NSMutableArray arrayWithCapacity:self.min_prices.count];
    
    for (NSDictionary *object in self.min_prices)
    {
        NSError *error = nil;
        ApartmentPrice *apartment = [[ApartmentPrice alloc] initWithDictionary:object error:&error];
        
        [prices addObject:apartment];
    }
    
    self.prices = [NSArray arrayWithArray:prices];
    
    NSMutableArray *pricesForRemove = [NSMutableArray array];
    
    for (ApartmentPrice *currentPrice in self.prices)
    {
        for (ApartmentPrice *comparePrice in prices)
        {
            if ([[currentPrice.rooms substringToIndex:1] isEqualToString:[comparePrice.rooms substringToIndex:1]])
            {
                if (comparePrice.price > currentPrice.price)
                {
                    [pricesForRemove addObject:comparePrice];
                }
            }
        }
    }
    
    [prices removeObjectsInArray:pricesForRemove];
    
    return [NSArray arrayWithArray:prices];
}

#pragma mark - Private (Override methods)

- (BOOL)isEqual:(id)other
{
    if ([super isEqual:other])
    {
        return YES;
    }
    
    return [self isEqualToApartment:other];
}

- (BOOL)isEqualToApartment:(Apartment *)apartment
{
    if (_apartmentID == apartment.apartmentID)
    {
        return YES;
    }
    return NO;
}

@end
