//
//  MyLog.h
//  CustomLogsDemo
//
//  Created by Melany Gulianovych on 12/11/16.
//  Copyright © 2016 Melany Gulianovych. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

#undef DDLogError
#undef DDLogWarn
#undef DDLogInfo
#undef DDLogDebug
#undef DDLogVerbose

// Now define everything how we want it

#define LOG_FLAG_FATAL   (1 << 0)  // 0...000001
#define LOG_FLAG_ERROR   (1 << 1)  // 0...000010
#define LOG_FLAG_WARN    (1 << 2)  // 0...000100
#define LOG_FLAG_NOTICE  (1 << 3)  // 0...001000
#define LOG_FLAG_INFO    (1 << 4)  // 0...010000
#define LOG_FLAG_DEBUG   (1 << 5)  // 0...100000
#define LOG_FLAG_SHOP   (1 << 6)  // 0...100000
#define LOG_FLAG_ITEM   (1 << 7)  // 0...100000
#define LOG_FLAG_DATABASE   (1 << 8)  // 0...100000

#define LOG_LEVEL_FATAL   (LOG_FLAG_FATAL)                     // 0...000001
#define LOG_LEVEL_ERROR   (LOG_FLAG_ERROR  | LOG_LEVEL_FATAL ) // 0...000011
#define LOG_LEVEL_WARN    (LOG_FLAG_WARN   | LOG_LEVEL_ERROR ) // 0...000111
#define LOG_LEVEL_NOTICE  (LOG_FLAG_NOTICE | LOG_LEVEL_WARN  ) // 0...001111
#define LOG_LEVEL_INFO    (LOG_FLAG_INFO   | LOG_LEVEL_NOTICE) // 0...011111
#define LOG_LEVEL_DEBUG   (LOG_FLAG_DEBUG  | LOG_LEVEL_INFO  ) // 0...111111
#define LOG_LEVEL_SHOP    (LOG_FLAG_SHOP   | LOG_FLAG_WARN) // 0...011111
#define LOG_LEVEL_ITEM   (LOG_FLAG_ITEM  | LOG_FLAG_WARN  ) // 0...111111
#define LOG_LEVEL_DATABASE   (LOG_FLAG_DATABASE  | LOG_FLAG_WARN  ) // 0...111111



#define DDLogFatal(frmt, ...)   LOG_MAYBE(NO,  ddLogLevel, LOG_FLAG_FATAL,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogError(frmt, ...)   LOG_MAYBE(NO,  ddLogLevel, LOG_FLAG_ERROR,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogWarn(frmt, ...)    LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_WARN,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogNotice(frmt, ...)  LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_NOTICE, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogInfo(frmt, ...)    LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_INFO,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogDebug(frmt, ...)   LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_DEBUG,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogShop(frmt, ...)   LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_SHOP,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogItem(frmt, ...)   LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_ITEM,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define DDLogDataBase(frmt, ...)   LOG_MAYBE(YES, ddLogLevel, LOG_FLAG_DATABASE,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
