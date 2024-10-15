import os
{.compile: "klib/kthread.c".}
{.passC: "-I" & currentSourcePath().parentDir().}

# kt_for()
type KtForFn* = proc (data: pointer, index: clong, thread_id: cint){.cdecl.}
proc kt_for*(n_threads: cint, fn: ptr KtForFn, data: pointer, n_works: clong) {.cdecl, importc: "kt_for", header: "klib/kthread.h".}

# kt_pipeline()
type KtPipelineFn* = proc (shared_data: pointer, step: cint, in_data: pointer){.cdecl.}
proc kt_pipeline*(n_threads: cint, fn: ptr KtPipelineFn, shared_data: pointer, n_steps: cint) {.cdecl, importc: "kt_pipeline", header: "klib/kthread.h".}

# kt_for() with thread pool
type ThreadPool* = pointer
proc kt_forpool_init*(n_threads: cint): ThreadPool{.cdecl, importc: "kt_forpool_init", header: "klib/kthread.h".}
proc kt_forpool_destroy*(pool: ThreadPool) {.cdecl, importc: "kt_forpool_destroy", header: "klib/kthread.h".}
proc kt_forpool*(pool: ThreadPool, fn: ptr KtForFn, data: pointer, n_works: clong) {.cdecl, importc: "kt_forpool", header: "klib/kthread.h".}
