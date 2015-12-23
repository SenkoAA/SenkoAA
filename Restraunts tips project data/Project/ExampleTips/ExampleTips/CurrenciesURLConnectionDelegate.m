//
//  CurrenciesURLConnectionDelegate.m
//  ExampleTips
//
//  Created by Alexey on 12/23/15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CurrenciesURLConnectionDelegate.h"

@implementation CurrenciesURLConnectionDelegate

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
    CurrenciesXMLParserDelegate *delegate = [[CurrenciesXMLParserDelegate alloc] init];
    [parser setDelegate:delegate];
    BOOL isParsed = [parser parse];
    if (isParsed) {
        _courses = [delegate courses];
        if (_courses != nil) {
            NSLog(@"Parsing success 11111111111111111!");
            [_courses enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                NSLog(@"%@ = %@", key, obj);
            }];
            //[self.tableView reloadData];
            [(CurrenciesTableViewController *)_tableViewController setCourses:_courses];
            [[(CurrenciesTableViewController *)_tableViewController tableView] reloadData];
        }
    } else {
        NSLog(@"Parser error: %@", [parser parserError]);
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //NSLog(@"FailWithError: %@", error);
    
}

@end
