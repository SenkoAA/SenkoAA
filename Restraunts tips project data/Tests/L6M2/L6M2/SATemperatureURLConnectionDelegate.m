//
//  SATemperatureURLConnectionDelegate.m
//  L6M2
//
//  Created by Alexey on 11/19/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "SATemperatureURLConnectionDelegate.h"

@implementation SATemperatureURLConnectionDelegate

-(id)initWithTableViewController:(UIViewController *)tableViewController {
    self = [super init];
    if (self) {
        _tableViewController = tableViewController;
    }
    return self;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
    //NSLog(@"DidReceiveResponse %@", _responseData);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
    //NSLog(@"DidReceiveData %@", _responseData);
}

-(NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    //NSLog(@"DidRec");
    return nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //parsing
    //NSLog(@"DidFinish %@", _responseData);
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:_responseData];
    SATemperatureXMLParserDelegate *delegate = [[SATemperatureXMLParserDelegate alloc] init];
    [parser setDelegate:delegate];
    BOOL isParsed = [parser parse];
    if (isParsed) {
        _temperatures = [delegate temperatures];
        if (_temperatures != nil) {
            NSLog(@"Parsing success 22222222!");
            [_temperatures enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                NSLog(@"%@ = %@", key, obj);
            }];
            //[_tableView reloadData];
            [(ViewController *)_tableViewController setTemperatures:_temperatures];
            [[(ViewController *)_tableViewController tableView] reloadData];
        }
    } else {
        NSLog(@"Parser error: %@", [parser parserError]);
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //NSLog(@"FailWithError: %@", error);
    
}

@end
