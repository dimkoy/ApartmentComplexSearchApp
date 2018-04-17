//
//  DataRequestDelegate.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataRequestProtocol;

@protocol DataRequestDelegate <NSObject>

- (void)dataRequest:(id<DataRequestProtocol>)request
  didFinishWithData:(id)data;

@end
