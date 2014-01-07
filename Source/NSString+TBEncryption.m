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

- (NSString *)tb_SHA1String
{
    const char *ptr = [self UTF8String];

    unsigned char sha1Buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(ptr, (CC_LONG)strlen(ptr), sha1Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", sha1Buffer[i]];
    }

    return [output copy];
}

- (NSString *)tb_base64String
{
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [stringData base64EncodedStringWithOptions:0];
}

- (NSString *)tb_XORStringWithSecret:(NSString *)secret
{
    NSMutableData *stringData = [[self dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];

    char *stringPtr = [stringData mutableBytes];
    const char *secretPtr = [secretData bytes];
    NSUInteger keyIndex = 0;

    for (NSUInteger i = 0; i < [stringData length]; i++) {
        *stringPtr = *stringPtr ^ *secretPtr;
        NSData *foo = [NSData dataWithBytes:stringPtr length:1];
        NSLog(@"CHAR: %@", foo);
        stringPtr++;
        secretPtr++;

        if (++keyIndex == [secret length]) {
            keyIndex = 0;
            secretPtr = [secretData bytes];
        }
    }

    NSString *result = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    return result;
}

@end
