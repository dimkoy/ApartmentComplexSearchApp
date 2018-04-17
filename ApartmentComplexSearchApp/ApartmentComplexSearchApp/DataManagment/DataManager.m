//
//  DataManager.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "DataManager.h"
#import "ApartmentListRequest.h"
#import "DataRequestDelegate.h"
#import "DataManagerDelegate.h"
#import "Apartment.h"

@interface DataManager () <DataRequestDelegate>

@property (nonatomic, strong) NSMutableArray *apartmentList;

@property (nonatomic, strong) NSOperationQueue *apartmentSearchQueue;

@end

@implementation DataManager

- (instancetype)init
{
    if (self = [super init])
    {
        self.apartmentList = [NSMutableArray array];
        
        self.apartmentSearchQueue = [[NSOperationQueue alloc] init];
        self.apartmentSearchQueue.maxConcurrentOperationCount = 1;
    }
    
    return self;
}

- (void)loadDataWithCount:(NSInteger)count
                   offset:(NSInteger)offset
                priceFrom:(NSInteger)priceFrom
                  priceTo:(NSInteger)priceTo
{
    ApartmentListRequest *request = [ApartmentListRequest initWithShowType:@"list"
                                                                     count:count
                                                                    offset:offset
                                                                     cache:false
                                                                 priceFrom:priceFrom
                                                                   priceTo:priceTo];
    request.delegate = self;
    
    [self.apartmentSearchQueue addOperation:request];
}

#pragma mark - Delegates

- (void)dataRequest:(id<DataRequestProtocol>)request
  didFinishWithData:(id)data
{
    if ([request isKindOfClass:ApartmentListRequest.class])
    {
        [self.apartmentList addObjectsFromArray:(NSArray *)data];
        
        [self.delegate dataManagerDidLoadData:self.apartmentList];
        
        for (Apartment *apartment in (NSArray *)data)
        {
            NSURL *url = [NSURL URLWithString:apartment.image];
            apartment.apartmentImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
        }
    }
}

@end
