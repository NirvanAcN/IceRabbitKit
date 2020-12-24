//
//  NSString+mhmCommon.m
//  GCD
//
//  Created by 马浩萌 on 2020/12/24.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import "NSString+mhmCommon.h"

@implementation NSString (mhmCommon)

-(NSArray<NSString *> *)participles {
    NSMutableArray *keyWords=[NSMutableArray new];
    CFStringTokenizerRef ref=CFStringTokenizerCreate(NULL,  (__bridge CFStringRef)self, CFRangeMake(0, self.length),kCFStringTokenizerUnitWord,NULL);
    CFRange range;
    CFStringTokenizerAdvanceToNextToken(ref);
    range=CFStringTokenizerGetCurrentTokenRange(ref);
    NSString *keyWord;
    while (range.length>0)
    {
        keyWord=[self substringWithRange:NSMakeRange(range.location, range.length)];
        [keyWords addObject:keyWord];
        CFStringTokenizerAdvanceToNextToken(ref);
        range=CFStringTokenizerGetCurrentTokenRange(ref);
    }
    CFRelease(ref);
    return [keyWords copy];
}

@end
