//
//  YLHttpStatusCodeDefine.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#ifndef YLHttpStatusCodeDefine_h
#define YLHttpStatusCodeDefine_h

/**
 http状态消息
 http://www.w3school.com.cn/tags/html_ref_httpmessages.asp
 https://www.jianshu.com/p/abc347ca37f5
 */
typedef NS_ENUM(NSUInteger, ATHttpStatusCodeType) {
    //1xx: 信息
    ATHttpStatusCodeType_100 = 100,//!<服务器仅接收到部分请求，但是一旦服务器并没有拒绝该请求，客户端应该继续发送其余的请求。
    ATHttpStatusCodeType_101 = 101,//!<服务器转换协议：服务器将遵从客户的请求转换到另外一种协议。
    //2xx: 成功
    ATHttpStatusCodeType_200 = 200,//!<请求成功（其后是对GET和POST请求的应答文档。）
    ATHttpStatusCodeType_201 = 201,//!<请求被创建完成，同时新的资源被创建。
    ATHttpStatusCodeType_202 = 202,//!<供处理的请求已被接受，但是处理未完成。
    ATHttpStatusCodeType_203 = 203,//!<文档已经正常地返回，但一些应答头可能不正确，因为使用的是文档的拷贝。
    ATHttpStatusCodeType_204 = 204,//!<没有新文档。浏览器应该继续显示原来的文档。如果用户定期地刷新页面，而Servlet可以确定用户文档足够新，这个状态代码是很有用的。
    ATHttpStatusCodeType_205 = 205,//!<没有新文档。但浏览器应该重置它所显示的内容。用来强制浏览器清除表单输入内容。
    ATHttpStatusCodeType_206 = 206,//!<客户发送了一个带有Range头的GET请求，服务器完成了它。
    //3xx: 重定向
    ATHttpStatusCodeType_300 = 300,//!<多重选择。链接列表。用户可以选择某链接到达目的地。最多允许五个地址。
    ATHttpStatusCodeType_301 = 301,//!<所请求的页面已经转移至新的url。
    ATHttpStatusCodeType_302 = 302,//!<所请求的页面已经临时转移至新的url。
    ATHttpStatusCodeType_303 = 303,//!<所请求的页面可在别的url下被找到。
    ATHttpStatusCodeType_304 = 304,//!<未按预期修改文档。客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓冲的文档还可以继续使用。
    ATHttpStatusCodeType_305 = 305,//!<客户请求的文档应该通过Location头所指明的代理服务器提取。
    ATHttpStatusCodeType_306 = 306,//!<此代码被用于前一版本。目前已不再使用，但是代码依然被保留。
    ATHttpStatusCodeType_307 = 307,//!<被请求的页面已经临时移至新的url。
    //4xx: 客户端错误
    ATHttpStatusCodeType_400 = 400,//!<服务器未能理解请求。
    ATHttpStatusCodeType_401 = 401,//!<被请求的页面需要用户名和密码。
    ATHttpStatusCodeType_402 = 402,//!<此代码尚无法使用。
    ATHttpStatusCodeType_403 = 403,//!<对被请求页面的访问被禁止。
    ATHttpStatusCodeType_404 = 404,//!<服务器无法找到被请求的页面。
    ATHttpStatusCodeType_405 = 405,//!<请求中指定的方法不被允许。
    ATHttpStatusCodeType_406 = 406,//!<服务器生成的响应无法被客户端所接受。
    ATHttpStatusCodeType_407 = 407,//!<用户必须首先使用代理服务器进行验证，这样请求才会被处理。
    ATHttpStatusCodeType_408 = 408,//!<请求超出了服务器的等待时间。
    ATHttpStatusCodeType_409 = 409,//!<由于冲突，请求无法被完成。
    ATHttpStatusCodeType_410 = 410,//!<被请求的页面不可用。
    ATHttpStatusCodeType_411 = 411,//!<"Content-Length" 未被定义。如果无此内容，服务器不会接受请求。
    ATHttpStatusCodeType_412 = 412,//!<请求中的前提条件被服务器评估为失败。
    ATHttpStatusCodeType_413 = 413,//!<由于所请求的实体的太大，服务器不会接受请求。
    ATHttpStatusCodeType_414 = 414,//!<由于url太长，服务器不会接受请求。当post请求被转换为带有很长的查询信息的get请求时，就会发生这种情况。
    ATHttpStatusCodeType_415 = 415,//!<由于媒介类型不被支持，服务器不会接受请求。
    ATHttpStatusCodeType_416 = 416,//!<服务器不能满足客户在请求中指定的Range头
    ATHttpStatusCodeType_417 = 417,//!<期望失败
    //5xx: 服务器错误
    ATHttpStatusCodeType_500 = 500,//!<请求未完成。服务器遇到不可预知的情况。
    ATHttpStatusCodeType_501 = 501,//!<请求未完成。服务器不支持所请求的功能。
    ATHttpStatusCodeType_502 = 502,//!<请求未完成。服务器从上游服务器收到一个无效的响应。
    ATHttpStatusCodeType_503 = 503,//!<请求未完成。服务器临时过载或当机。
    ATHttpStatusCodeType_504 = 504,//!<网关超时。
    ATHttpStatusCodeType_505 = 505,//!<服务器不支持请求中指明的HTTP协议版本。
};

#endif /* YLHttpStatusCodeDefine_h */
