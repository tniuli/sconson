// copyright:
//            (C) SINA Inc.
//
//      file: define.h
//      desc:
//    author:
//     email:
//      date:
//
//    change:


#ifndef EXAMPLE_COMMON_DEFINE_H_
#define EXAMPLE_COMMON_DEFINE_H_

#define BEGIN_NAMESPACE_EXAMPLE namespace example {
#define END_NAMESPACE_EXAMPLE  }
#define USING_NAMESPACE_EXAMPLE using namespace example;

#define DELETE_AND_SET_NULL(x)        \
  do {                                \
    if(x){                            \
      delete x;                       \
      x = NULL;                       \
    }                                 \
  } while (0)

// Macro defined to avoid copy constructor and operator =
#define DISALLOW_COPY_AND_ASSIGN(TypeName) \
  TypeName(const TypeName &);              \
  void operator = (const TypeName &);      \
   
#endif  // EXAMPLE_COMMON_DEFINE_H_
