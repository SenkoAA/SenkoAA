//
//  CurrenciesXMLParserDelegate.m
//  ExampleTips
//
//  Created by Alexey on 12/23/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CurrenciesXMLParserDelegate.h"

@implementation CurrenciesXMLParserDelegate

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    _courses = [[NSMutableDictionary alloc] init];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"CharCode"]) {
        _charCodeFlag = YES;
    }
    if ([elementName isEqualToString:@"Rate"]) {
        _rateFlag = YES;
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_charCodeFlag) {
        _charCode = string;
        
    }
    if (_rateFlag) {
        [_courses setObject:[NSNumber numberWithDouble:[string doubleValue]] forKey:_charCode];
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"CharCode"]) {
        _charCodeFlag = NO;
    }
    if ([elementName isEqualToString:@"Rate"]) {
        _rateFlag = NO;
    }
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    if (_courses != nil) {
        [_courses setObject:[NSNumber numberWithDouble:1.0] forKey:@"BYR"];
    }
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    _courses = nil;
}

@end
