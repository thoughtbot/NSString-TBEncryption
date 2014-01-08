//
//  NSString+TBEncryption.h
//  NSString+TBEncryption
//
//  Created by Gordon Fontenot on 1/7/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TBEncryption)

- (NSString *)tb_MD5String;
- (NSString *)tb_SHA1String;
- (NSString *)tb_base64String;
- (NSString *)tb_XORStringWithSecret:(NSString *)secret;

@end
