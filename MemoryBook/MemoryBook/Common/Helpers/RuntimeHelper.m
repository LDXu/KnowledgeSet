//
//  RuntimeHelper.m
//  MemoryBook
//
//  Created by Samson Tseng on 16/5/26.
//  Copyright © 2016年 Samson Tseng. All rights reserved.
//

#import "RuntimeHelper.h"

@implementation RuntimeHelper

+ (BOOL)key:(NSString *)key isPropertyOfClass:(Class)cls{
    BOOL isProperty = NO;
    objc_property_t property = class_getProperty(cls,[key cStringUsingEncoding:NSUTF8StringEncoding]);
    if(property != NULL){
        isProperty = YES;
    }
    return isProperty;
}

+ (NSArray *)getPropertyListOfClass:(Class)cls{
    
    unsigned int outCount;
    objc_property_t *plist = class_copyPropertyList(cls, &outCount);
    if(outCount == 0){
        return nil;
    }
    NSMutableArray *propertyList = [[NSMutableArray alloc] init];
    for(int i = 0 ; i < outCount ; i++){
        objc_property_t o_property = plist[i];
        // objc_property_t是一个结构,将其转换成字符
        const char *c_property = property_getName(o_property);
        NSString *key = [NSString stringWithUTF8String:c_property];
        NSLog(@"property name[%d]:%@",i,key);
        [propertyList addObject:key];
    }
    return propertyList;
}

@end