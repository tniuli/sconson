// copyright:
//            (C) SINA Inc.
//
//      file: log.h
//      desc:
//    author:
//     email:
//      date:
//
//    change:


#ifndef EXAMPLE_COMMON_LOG_H_
#define EXAMPLE_COMMON_LOG_H_

#include <sharelib/util/log.h>


enum LogTraceFlag {
  LOG_TRACE_FLAG_OFF,
  LOG_TRACE_FLAG_ON
};

static const std::string kLoggerName = "example";

#define EXAMPLE_LOG_DEBUG(format, args...)    \
  LOG(LOG_LEVEL_DEBUG, sharelib::Log4cppWrapper::GetLog(kLoggerName),format, ##args)

#define EXAMPLE_LOG_INFO(format, args...)    \
  LOG(LOG_LEVEL_INFO, sharelib::Log4cppWrapper::GetLog(kLoggerName),  format, ##args)

#define EXAMPLE_LOG_NOTICE(format, args...)    \
  LOG(LOG_LEVEL_NOTICE, sharelib::Log4cppWrapper::GetLog(kLoggerName), format, ##args)

#define EXAMPLE_LOG_WARN(format, args...)     \
  LOG(LOG_LEVEL_WARN, sharelib::Log4cppWrapper::GetLog(kLoggerName), format, ##args)

#define EXAMPLE_LOG_ERROR(format, args...)    \
  LOG(LOG_LEVEL_ERROR, sharelib::Log4cppWrapper::GetLog(kLoggerName), format, ##args)

#define EXAMPLE_LOG_TRACE(trace_flag, format,...)  \
  if (trace_flag == LOG_TRACE_FLAG_ON) {  \
    EXAMPLE_LOG_NOTICE(format, ##__VA_ARGS__);  \
  } \
  else {  \
    EXAMPLE_LOG_DEBUG(format, ##__VA_ARGS__); \
  }

#define EXAMPLE_LOG_TRACEON(format, ...)  \
  EXAMPLE_LOG_TRACE(LOG_TRACE_FLAG_ON, format, ##__VA_ARGS__)


#endif  // EXAMPLE_COMMON_LOG_H_
