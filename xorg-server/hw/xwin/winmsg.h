/*
 *Copyright (C) 1994-2000 The XFree86 Project, Inc. All Rights Reserved.
 *
 *Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 *"Software"), to deal in the Software without restriction, including
 *without limitation the rights to use, copy, modify, merge, publish,
 *distribute, sublicense, and/or sell copies of the Software, and to
 *permit persons to whom the Software is furnished to do so, subject to
 *the following conditions:
 *
 *The above copyright notice and this permission notice shall be
 *included in all copies or substantial portions of the Software.
 *
 *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 *MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *NONINFRINGEMENT. IN NO EVENT SHALL THE XFREE86 PROJECT BE LIABLE FOR
 *ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 *CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 *WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 *Except as contained in this notice, the name of the XFree86 Project
 *shall not be used in advertising or otherwise to promote the sale, use
 *or other dealings in this Software without prior written authorization
 *from the XFree86 Project.
 *
 * Authors: Alexander Gottwald	
 */

#ifndef __WIN_MSG_H__
#define __WIN_MSG_H__

#include <X11/Xwindows.h>
#include <X11/Xfuncproto.h>

/*
 * Function prototypes
 */
 
#include "os.h"

#if !defined(_MSC_VER) || defined(_DEBUG)
#define WINDBG
void winDebug (const char *format, ...);
void winDebug4 (const char *format, ...);
void winDebugWin32Message(const char* function, HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam);
#else
#define winDebug(...)
#define winDebug4(...)
#define winDebugWin32Message(...)
#endif

void winW32Error(const char *message);
void winW32ErrorEx(const char *message, DWORD errorcode);

#endif
