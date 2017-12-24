# XLLFileHash
文件哈希算法
如果你能够确认文件 <= 4M，那么 hash = UrlsafeBase64([0x16, sha1(FileContent)])。也就是，文件的内容的 sha1 值（20 个字节），前面加一个 byte（值为 0x16），构成 21 字节的二进制数据，然后对这 21 字节的数据做 urlsafe 的 base64 编码。
如果文件 > 4M，则 hash = UrlsafeBase64([0x96, sha1([sha1(Block1), sha1(Block2), ...])])，其中 Block 是把文件内容切分为 4M 为单位的一个个块，也就是 BlockI = FileContent[I*4M:(I+1)*4M]。
使用此次框架有效避免了因计算超大文件fileHash而造成一瞬间的内存飙升问题。
![码农共勉](https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=阿狸图片&hs=2&pn=3&spn=0&di=17282682450&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=295807265%2C552094397&os=2063121345%2C1037641801&simid=4279331588%2C669940809&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=阿狸图片&objurl=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F317bd2a20cf431ad458c16fa4b36acaf2cdd98e7.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fptjkw_z%26e3Bkwt17_z%26e3Bv54AzdH3FrAzdH3Fdab008m890&gsm=0)
