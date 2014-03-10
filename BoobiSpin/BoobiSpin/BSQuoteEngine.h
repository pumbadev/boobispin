//
//  BSQuoteEngine.h
//  BoobiSpin
//
//  Created by Sumeet Kumar on 3/7/14.
//  Copyright (c) 2014 Sumeet Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSQuoteEngine : NSObject

@property (strong, nonatomic) NSArray *quoteLines;

+(BSQuoteEngine *) makeQuoteEngineWithURL:(NSURL *)url;

@end
