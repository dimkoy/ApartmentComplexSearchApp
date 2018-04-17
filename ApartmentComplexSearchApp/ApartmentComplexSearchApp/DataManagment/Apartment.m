//
//  Apartment.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "Apartment.h"

@interface Apartment()

@property (nonatomic, strong) NSDictionary<Ignore> *nearestSubway;

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
