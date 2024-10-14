# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import std/unittest

import klib_nim/kthread

test "kt_for":
    var a = [1, 2, 3, 4]
    proc squared(data: pointer, index: clong, thread_id: cint) {.cdecl.} =
        var arr = cast[ptr array[4, int]](data)
        arr[][index.int] = arr[][index.int] * arr[][index.int]
    
    kt_for(2, cast[ptr KtForFn](squared), a.addr, a.len.clong)
    check(a == [1, 4, 9, 16])
