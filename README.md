# XLLFileHash
文件哈希算法</br>
如果你能够确认文件 <= 4M，那么 hash = UrlsafeBase64([0x16, sha1(FileContent)])。也就是，文件的内容的 sha1 值（20 个字节），前面加一个 byte（值为 0x16），构成 21 字节的二进制数据，然后对这 21 字节的数据做 urlsafe 的 base64 编码。
如果文件 > 4M，则 hash = UrlsafeBase64([0x96, sha1([sha1(Block1), sha1(Block2), ...])])，其中 Block 是把文件内容切分为 4M 为单位的一个个块，也就是 BlockI = FileContent[I*4M:(I+1)*4M]。</br>
**使用此次框架有效避免了因计算超大文件fileHash而造成一瞬间的内存飙升问题**</br>
**本框架支持cocoapods,podfile文件加入 pod 'XLLFileHash', '~>1.1.4'即可**</br>
![码农共勉](https://github.com/b593771943/XLLFileHash/raw/master/XLLFileHashDemo/timg.jpeg)
