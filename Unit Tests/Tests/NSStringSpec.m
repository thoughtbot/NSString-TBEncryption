#import "NSString+TBEncryption.h"

SpecBegin(NSString)

describe(@"MD5 Encryption", ^{
    it(@"Converts a string to an MD5 representation", ^{
        NSString *md5 = [@"thoughtbot" tb_MD5String];
        NSString *md5Actual = @"81caded18444fc3b60e56622f927bcce";
        expect(md5).to.equal(md5Actual);
    });
});

SpecEnd
