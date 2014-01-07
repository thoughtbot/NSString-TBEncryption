#import "NSString+TBEncryption.h"

SpecBegin(NSString)

describe(@"MD5 Encryption", ^{
    it(@"Converts a string to an MD5 representation", ^{
        NSString *md5 = [@"thoughtbot" tb_MD5String];
        NSString *md5Actual = @"81caded18444fc3b60e56622f927bcce";
        expect(md5).to.equal(md5Actual);
    });
});

describe(@"SHA-1 Encryption", ^{
    it(@"Converts a string to a SHA-1 representation", ^{
        NSString *sha1 = [@"thoughtbot" tb_SHA1String];
        NSString *sha1Actual = @"d4e80756452178b68f001fce9190fb8a7cdedc26";
        expect(sha1).to.equal(sha1Actual);
    });
});

describe(@"Base64 Encryption", ^{
    it(@"Converts a string to a Base64 representation", ^{
        NSString *base64 = [@"thoughtbot" tb_base64String];
        NSString *base64Actual = @"dGhvdWdodGJvdA==";
        expect(base64).to.equal(base64Actual);
    });
});

describe(@"XOR Encryption", ^{
    it(@"Converts a string to an XOR encrypted representation", ^{
        NSString *xor = [@"thoughtbot" tb_XORStringWithSecret:@"1234567890"];
        NSString *xorActual = @"455a5c41525e435a5644";
        expect(xor).to.equal(xorActual);
    });
});

SpecEnd
