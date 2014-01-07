#import <Foundation/Foundation.h>

SpecBegin(NSString)

it(@"fails", ^{
    expect("foo").to.equal(@"bar");
});

SpecEnd
