//
//  Restraunt.h
//  ExampleRestraunt
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *separatedString = @"|";

@interface Restraunt : NSObject

@property NSString *country;
@property NSString *city;
@property NSString *street;
@property NSString *homeNumber;
@property NSString *restrauntName;
@property NSString *comment;

- (BOOL)isValidInitialValue:(NSString *)initialValue;
- (id)initWithCountry:(NSString *)country andCity:(NSString *)city andStreet:(NSString *)street andHomeNumber:(NSString *)homeNumber andRestrauntName:(NSString *)restrauntName andComment:(NSString *)comment;
- (id)initWithRestrauntKey:(NSString *)restrauntKey andComment:(NSString *)comment;
- (NSString *)createRestrauntKey;
- (NSString *)createRestrauntAddress;
+ (NSDictionary *)createDictionaryByRestrauntKey:(NSString *)restrauntKey;

@end
