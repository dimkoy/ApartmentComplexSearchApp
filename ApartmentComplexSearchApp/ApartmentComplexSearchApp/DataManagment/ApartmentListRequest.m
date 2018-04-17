//
//  ApartmentListRequest.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "ApartmentListRequest.h"
#import "DataRequestDelegate.h"
#import "Apartment.h"
#import "DataResponse.h"

@interface ApartmentListRequest ()

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) BOOL withCache;
@property (nonatomic, assign) NSInteger priceFrom;
@property (nonatomic, assign) NSInteger priceTo;

@property(atomic, assign, readwrite, getter=isExecuting) BOOL executing;
@property(atomic, assign, readwrite, getter=isFinished) BOOL finished;
@property(atomic, assign, readwrite, getter=isCancelled) BOOL cancelled;

@end

@implementation ApartmentListRequest

@synthesize delegate, executing, finished, cancelled;

+ (BOOL)automaticallyNotifiesObserversForKey
{
    return true;
}

+ (NSSet *)keyPathsForValuesAffectingIsCancelled
{
    NSSet *result = [NSSet setWithObject:@"cancelled"];
    return result;
}

+ (NSSet *)keyPathsForValuesAffectingIsExecuting
{
    NSSet *result = [NSSet setWithObject:@"executing"];
    return result;
}

+ (NSSet *)keyPathsForValuesAffectingIsFinished
{
    NSSet *result = [NSSet setWithObject:@"finished"];
    return result;
}

+ (ApartmentListRequest *)initWithShowType:(NSString *)type
                                     count:(NSInteger)count
                                    offset:(NSInteger)offset
                                     cache:(BOOL)withCache
                                 priceFrom:(NSInteger)priceFrom
                                   priceTo:(NSInteger)priceTo
{
    ApartmentListRequest *request = [[ApartmentListRequest alloc] init];
    request.type = type;
    request.count = count;
    request.offset = offset;
    request.withCache = withCache;
    request.priceFrom = priceFrom;
    request.priceTo = priceTo;
    request.url = @"http://api.trend-dev.ru/v3_1/blocks/search/?show_type=%@&count=%@&offset=%@&cache=%@&price_from=%@&price_to=%@";
    
    return request;
}

- (void)start
{
    self.executing = true;
    NSString *cache = self.withCache ? @"true" : @"false";
    NSString *urlRequest = [NSString stringWithFormat:self.url, self.type, @(self.count), @(self.offset),  cache, @(self.priceFrom), @(self.priceTo)];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlRequest]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    
    if (![self isCancelled])
    {
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              if (error)
                                              {
                                                  NSLog(@"%@", error);
                                              }
                                              else
                                              {
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      [self finishedRequestWithData:data];
                                                      self.executing = false;
                                                      self.finished = true;
                                                  });
                                              }
                                          }];
        [dataTask resume];
    }
    else
    {
        self.executing = false;
        self.finished = false;
    }
}

- (void)finishedRequestWithData:(NSData *)data
{
    DataResponse *response = [[DataResponse alloc] initWithData:data error:nil];
    
    NSArray *requestData = [response.data valueForKey:@"results"];
    NSMutableArray *apartments = [NSMutableArray arrayWithCapacity:requestData.count];
    
    for (NSDictionary *object in requestData)
    {
        NSError *error = nil;
        Apartment *apartment = [[Apartment alloc] initWithDictionary:object error:&error];
        
        NSLog(@"%@", error);
        if (apartment)
        {
            [apartments addObject:apartment];
        }
    }
   
    [self.delegate dataRequest:self didFinishWithData:[NSArray arrayWithArray:apartments]];
}

@end
