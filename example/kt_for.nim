import klib_nim/kthread

var a = [1, 2, 3, 4]

proc squared(data: pointer, index: clong, thread_id: cint) {.cdecl.} =
    var arr = cast[ptr array[4, int]](data)
    arr[][index.int] = arr[][index.int] * arr[][index.int]

    echo "thread_id: ", thread_id, ", array_index: ", index, ", value: ", arr[][index.int]
    
kt_for(2, cast[ptr KtForFn](squared), a.addr, a.len.clong)