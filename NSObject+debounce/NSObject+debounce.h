//
//  NSObject+debounce.h
//  NSObjectDebounceDemo
//
//  Created by Cui Andy on 14-7-26.
//  Copyright (c) 2014年 Cui Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (debounce)

+(void)debounceForTarget:(id)target action:(SEL)action object:(id)newObject delay:(NSTimeInterval)delay;

-(void)debounceAction:(SEL)action object:(id)newObject delay:(NSTimeInterval)delay;

// deprecated
+(void)debounceForTarget:(id)target action:(SEL)action objectToBeCancelled:(id)oldObject objectToBePerform:(id)newObject delay:(NSTimeInterval)delay;

@end
