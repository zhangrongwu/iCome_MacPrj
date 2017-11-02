//
//  ICNetworkManager.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/31.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICNetworkManager.h"

@implementation ICNetworkManager

+(instancetype)sharedInstance {
    static dispatch_once_t once;
    static ICNetworkManager *manager;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
-(void)setNetworkHelper {
    [ICNetworkHelper setValue:@"" forHTTPHeaderField:@"token"];
    [ICNetworkHelper setValue:@"" forHTTPHeaderField:@"auth"];
    [ICNetworkHelper setSecurityPolicy:[ICNetworkManager customSecurityPolicy]];
    [ICNetworkHelper setRequestTimeoutInterval:50.f];
}

- (instancetype)init {
    if (self = [super init]) {
        [self setNetworkHelper];
    }
    return self;
}

// https 处理
+ (AFSecurityPolicy*)customSecurityPolicy {
    // 证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = NO;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithObjects:certData, nil];
    return securityPolicy;
}

/** 拼接BASEURL*/
- (NSString *) appendRequestBaseURL:(NSString *)path{
    return [NSString stringWithFormat:@"%@%@",BASEURL,path];
}

- (void)login:(NSDictionary *)param
      success:(HttpSuccessCompletionHandle)success
      failure:(HttpFailureCompletionHandle)failure {
//    NSString *url = [self appendRequestBaseURL:@"icomeapps/ios/dev/version.json"];
    NSString *url = @"https://www.baidu.com";

    [ICNetworkHelper GET:url parameters:param success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
