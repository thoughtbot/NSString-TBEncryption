# NSString+TBEncryption #

TBEncryption is a _super_ light weight category for encrypting strings with
different encryption methods. Currently, we support the following encryption
strategies:

- MD5
- SHA-1
- Base64
- XOR

## Installation ##

We recommend installing with [CocoaPods][]

    pod 'NSString+TBEncryption', '~> 1.0'

Alternatively, you can just copy the category from the `Source` directory into
your project.

[CocoaPods]: http://cocoapods.org

## Usage ##

The category methods are all prefixed with `tb_`. This is the best practice
for categories on classes you don't own, but it also means that all of the
TBEncryption methods will sort together.

The MD5, SHA-1, and Base64 methods are all pretty straightforward. The XOR
hashing method takes an additional secret key argument. This is the string
that will be XOR'd together with the string to create the hash. This key can
be of any length (we loop back through the key if it's shorter than the
string) If you use this method a lot, you might even create your own XOR
method that wraps this one and always passes in the proper key.
