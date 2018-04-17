//
//  DataResponse.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 15/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "JSONModel.h"
#import "JSONModelLib.h"

@interface DataResponse : JSONModel

@property (nonatomic, strong) NSString<Ignore> *errors;
@property (nonatomic, strong) NSDictionary *data;

@end
