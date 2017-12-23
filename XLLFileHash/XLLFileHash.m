//
//  XLLFileHash.m
//  XLLFileHashDemo
//
//  Created by 肖乐 on 2017/12/23.
//  Copyright © 2017年 IMMoveMobile. All rights reserved.
//

#import "XLLFileHash.h"
#import <CommonCrypto/CommonDigest.h>

const UInt32 kEUCBlockSize = 4 * 1024 * 1024;

@implementation XLLFileHash

+ (NSString *)fileHashWithFilePath:(NSString *)filePath
{
    @autoreleasepool {
        
        NSError *error = nil;
        int dataLength = [[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error][NSFileSize] intValue];
        int count = (dataLength + kEUCBlockSize - 1) / kEUCBlockSize;
        
        NSMutableData *retData = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH + 1];
        UInt8 *ret = [retData mutableBytes];
        
        NSMutableData *blocksSha1 = nil;
        UInt8 *pblocksSha1 = ret + 1;
        
        if (count > 1)
        {
            blocksSha1 = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH * count];
            pblocksSha1 = [blocksSha1 mutableBytes];
        }
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        for (int i = 0; i < count; i++)
        {
            int offset = i * kEUCBlockSize;
            int size = (dataLength - offset) > kEUCBlockSize?kEUCBlockSize:(dataLength - offset);
            [fileHandle seekToFileOffset:offset];
            NSData *blockData = [fileHandle readDataOfLength:(unsigned int)size];
            CC_SHA1([blockData bytes], (CC_LONG)size, pblocksSha1 + i * CC_SHA1_DIGEST_LENGTH);
        }
        if (count == 1)
        {
            ret[0] = 0x16;
        } else {
            ret[0] = 0x96;
            CC_SHA1(pblocksSha1, (CC_LONG)CC_SHA1_DIGEST_LENGTH * count, ret + 1);
        }
        // retData就是sha1编码后的二进制
        NSString *base64Str = [retData base64EncodedStringWithOptions:0];
        NSMutableString *safeBase64Str = [[NSMutableString alloc] initWithString:base64Str];
        // 对base64做safe处理
        safeBase64Str = (NSMutableString *)[safeBase64Str stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
        safeBase64Str = (NSMutableString *)[safeBase64Str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
        safeBase64Str = (NSMutableString *)[safeBase64Str stringByReplacingOccurrencesOfString:@"=" withString:@""];
        return safeBase64Str;
    }
}

@end
