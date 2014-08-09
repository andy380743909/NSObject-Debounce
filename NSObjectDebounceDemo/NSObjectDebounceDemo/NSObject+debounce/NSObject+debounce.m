//
//  NSObject+debounce.m
//  NSObjectDebounceDemo
//
//  Created by Cui Andy on 14-7-26.
//  Copyright (c) 2014年 Cui Andy. All rights reserved.
//

#import "NSObject+debounce.h"
#import <objc/runtime.h>

@implementation NSObject (debounce)

+(void)debounceForTarget:(id)target action:(SEL)action objectToBeCancelled:(id)oldObject objectToBePerform:(id)newObject delay:(NSTimeInterval)delay{
    
    NSAssert(target != nil, @"target 不能为nil", nil);
    
    // !!! call this method may cancel other actions ,
    //[NSObject cancelPreviousPerformRequestsWithTarget:target];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:target selector:action object:oldObject];
    
    //    [NSObject cancelPreviousPerformRequestsWithTarget:target selector:action object:object];
    //  the Argument [object] may be different with last performrequest,if so,the last perform will not be cancelled. 
    [target performSelector:action withObject:newObject afterDelay:delay];
    
}

+(void)debounceForTarget:(id)target action:(SEL)action object:(id)newObject delay:(NSTimeInterval)delay{
    
    if(target == nil || action == nil){ return;}
    
    // NSString *selectorString = NSStringFromSelector(action);
    // id oldObj = objc_getAssociatedObject(target,[selectorString UTF8String]); // WRONG
    id oldObj = objc_getAssociatedObject(target,action);
    //NSLog(@"oldObj:%@",oldObj);
    [NSObject cancelPreviousPerformRequestsWithTarget:target selector:action object:oldObj];
    
    objc_setAssociatedObject(target, action, newObject, OBJC_ASSOCIATION_ASSIGN);
    
    // NSString *selectorString2 = NSStringFromSelector(action);
    // id newObj = objc_getAssociatedObject(target,[selectorString2 UTF8String]);
    
    //id newObj = objc_getAssociatedObject(target,@selector(action));
    //NSLog(@"newObj:%@",newObj);
    [target performSelector:action withObject:newObject afterDelay:delay];
    
}

-(void)debounceAction:(SEL)action object:(id)newObject delay:(NSTimeInterval)delay{
    [[self class] debounceForTarget:self action:action object:newObject delay:delay];
}

@end
