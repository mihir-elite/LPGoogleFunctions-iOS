//
//  LPDistance.m
//
//  Created by Luka Penger on 7/3/13.
//  Copyright (c) 2013 Luka Penger. All rights reserved.
//

#import "LPDistance.h"


@implementation LPDistance

- (id)initWithCoder:(NSCoder *)coder
{
	self = [LPDistance new];
    if (self) {
        self.text = [coder decodeObjectForKey:@"text"];
        self.value = [coder decodeIntForKey:@"value"];
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeInt:self.value forKey:@"value"];
}

+ (id)distanceWithObjects:(NSDictionary *)dictionary
{
    LPDistance *new = [LPDistance new];
    
    if (![dictionary isKindOfClass:[NSNull class]]) {
        if (![[dictionary objectForKey:@"text"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"text"]) {
            new.text = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"text"]];
        }
        
        if (![[dictionary objectForKey:@"value"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"value"]) {
            new.value = [[dictionary objectForKey:@"value"] intValue];
        }
    }
    
	return new;
}

- (NSDictionary *)dictionary
{
    NSDictionary *dictionary = [self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"text", @"value", nil]];
    
    return dictionary;
}

- (NSString *)description
{
    return [self dictionary].description;
}

- (id)copyWithZone:(NSZone *)zone
{
    LPDistance *new = [LPDistance new];
    
    [new setText:[self text]];
    [new setValue:[self value]];
    
    return new;
}

@end