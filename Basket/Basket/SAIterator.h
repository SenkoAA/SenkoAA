//
//  SAIterator.h
//  Basket
//
//  Created by Alexey on 9/18/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAIterator : NSObject

@property NSMutableArray * fruits;
@property int firstId;
@property int lastId;
@property int maxFirstId;
@property int minLastId;
@property bool side;

- (bool)hasNext;
- (id)initWithFruits:(NSMutableArray *)fruits;
- (id)next;

@end
