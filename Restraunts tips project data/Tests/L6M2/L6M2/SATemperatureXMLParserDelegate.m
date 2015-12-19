//
//  SATemperatureXMLParserDelegate.m
//  L6M2
//
//  Created by Alexey on 11/20/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SATemperatureXMLParserDelegate.h"

@implementation SATemperatureXMLParserDelegate

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    _temperatures = [[NSMutableDictionary alloc] init];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"datetime"]) {
        _datetimeFlag = YES;
    }
    if ([elementName isEqualToString:@"temperature"]) {
        _temperatureFlag = YES;
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_datetimeFlag) {
        _datetime = string;
    }
    if (_temperatureFlag) {
        [_temperatures setObject:[NSNumber numberWithDouble:[string doubleValue]] forKey:_datetime];
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"datetime"]) {
        _datetimeFlag = NO;
    }
    if ([elementName isEqualToString:@"temperature"]) {
        _temperatureFlag = NO;
    }
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    _temperatures = nil;
}

@end
