//
//  BSQuoteEngine.m
//  BoobiSpin
//
//  Created by Sumeet Kumar on 3/7/14.
//  Copyright (c) 2014 Sumeet Kumar. All rights reserved.
//

#import "BSQuoteEngine.h"

@implementation BSQuoteEngine

#pragma mark QuoteEngine

+(BSQuoteEngine *)makeQuoteEngineWithURL:(NSURL *)url {
    BSQuoteEngine *quoteEngine = [BSQuoteEngine new];
    
    quoteEngine.quoteLines = [NSArray arrayWithContentsOfURL:url];
    
    return quoteEngine;
    
}

@end
