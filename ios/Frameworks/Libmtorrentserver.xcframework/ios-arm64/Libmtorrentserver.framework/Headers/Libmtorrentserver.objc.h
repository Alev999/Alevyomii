// Objective-C API for talking to server/binding/mobile Go package.
//   gobind -lang=objc server/binding/mobile
//
// File is generated by gobind. Do not edit.

#ifndef __Libmtorrentserver_H__
#define __Libmtorrentserver_H__

@import Foundation;
#include "ref.h"
#include "Universe.objc.h"


FOUNDATION_EXPORT BOOL LibmtorrentserverStart(NSString* _Nullable mcfg, long* _Nullable ret0_, NSError* _Nullable* _Nullable error);

FOUNDATION_EXPORT void LibmtorrentserverStop(void);

#endif
