import klib_nim/kthread

# simple for with no data operation
proc say() {.cdecl.} = echo "hello"
let echoTiems = 5

kt_for(2, cast[ptr KtForFn](say), nil, echoTiems.clong)


# with  data operation
var a = [1, 2, 3, 4]

proc square(data: pointer, index: clong, thread_id: cint) {.cdecl.} =
    var arr = cast[ptr array[4, int]](data)
    arr[][index.int] = arr[][index.int] * arr[][index.int]

    echo "thread_id: ", thread_id, ", array_index: ", index, ", square_value: ", arr[][index.int]
    
kt_for(2, cast[ptr KtForFn](square), a.addr, a.len.clong)