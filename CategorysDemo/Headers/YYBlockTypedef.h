//
//  YYBlockTypedef.h
//  CategorysDemo
//
//  Created by eyoung on 2018/4/3.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#ifndef YYBlockTypedef_h
#define YYBlockTypedef_h

typedef void(^YYBlock)(void);
typedef void(^YYBlockBlock)(YYBlock block);
typedef void(^YYBlockObject)(id obj);
typedef void(^YYBlockInteger)(NSInteger integerpara);
typedef void(^YYBlockFloat)(CGFloat floatpara);


#endif /* YYBlockTypedef_h */
