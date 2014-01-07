//
//  NSString+TBEncryption.m
//  NSStringEncryption
//
//  Created by Gordon Fontenot on 1/7/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

#import "NSString+TBEncryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TBEncryption)

- (NSString *)tb_MD5String
{
    const char *ptr = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }

    return [output copy];
}

@end
