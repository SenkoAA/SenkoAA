//
//  Restraunt.m
//  ExampleRestraunt
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Restraunt.h"

@implementation Restraunt

- (BOOL)isValidInitialValue:(NSString *)initialValue {
    if (initialValue == nil || [initialValue length] == 0) {
        return NO;
    } else {
        NSArray *tokens = [initialValue componentsSeparatedByString:separatedString];
        if ([tokens count] > 1) {
            return NO;
        } else {
            return YES;
        }
    }
}

- (id)initWithCountry:(NSString *)country andCity:(NSString *)city andStreet:(NSString *)street andHomeNumber:(NSString *)homeNumber andRestrauntName:(NSString *)restrauntName andComment:(NSString *)comment {
    self = [super init];
    if (self) {
        if ([self isValidInitialValue:country] && [self isValidInitialValue:city] && [self isValidInitialValue:street] && [self isValidInitialValue:homeNumber] && [self isValidInitialValue:restrauntName]) {
            _country = country;
            _city = city;
            _street = street;
            _homeNumber = homeNumber;
            _restrauntName = restrauntName;
            _comment = comment;
        } else {
            return nil;
        }
    }
    return self;
}

- (id)initWithRestrauntKey:(NSString *)restrauntKey andComment:(NSString *)comment {
    self = [super init];
    if (self) {
        NSArray *initialValues = [restrauntKey componentsSeparatedByString:separatedString];
        if ([initialValues count] == 5) {
            _country = initialValues[0];
            _city = initialValues[1];
            _street = initialValues[2];
            _homeNumber = initialValues[3];
            _restrauntName = initialValues[4];
            _comment = comment;
        } else {
            return nil;
        }
    }
    return self;
}

- (NSString *)createRestrauntKey {
    NSMutableString *restrauntKey = [[NSMutableString alloc] init];
    [restrauntKey appendString:_country];
    [restrauntKey appendString:separatedString];
    [restrauntKey appendString:_city];
    [restrauntKey appendString:separatedString];
    [restrauntKey appendString:_street];
    [restrauntKey appendString:separatedString];
    [restrauntKey appendString:_homeNumber];
    [restrauntKey appendString:separatedString];
    [restrauntKey appendString:_restrauntName];
    return restrauntKey;
}

- (NSString *)createRestrauntAddress {
    NSMutableString *restrauntAddress = [[NSMutableString alloc] init];
    NSString *addressSeparatedString = @", ";
    [restrauntAddress appendString:_country];
    [restrauntAddress appendString:addressSeparatedString];
    [restrauntAddress appendString:_city];
    [restrauntAddress appendString:addressSeparatedString];
    [restrauntAddress appendString:_street];
    [restrauntAddress appendString:addressSeparatedString];
    [restrauntAddress appendString:_homeNumber];
    return restrauntAddress;
}

+ (NSDictionary *)createDictionaryByRestrauntKey:(NSString *)restrauntKey {
    NSArray *values = [restrauntKey componentsSeparatedByString:separatedString];
    if ([values count] == 5) {
        NSArray *keys = @[@"Country", @"City", @"Street", @"HomeNumber", @"RestrauntName"];
        return [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    } else {
        return nil;
    }
}

@end
