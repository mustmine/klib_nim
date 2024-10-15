import os
{.compile: "klib/kalloc.c".}
{.passC: "-I" & currentSourcePath().parentDir().}

type km_stat_t*{.importc: "km_stat_t", header: "klib/kalloc.h".} = object
    capacity:  csize_t
    available: csize_t
    n_blocks:  csize_t
    n_cores:   csize_t
    largest:   csize_t

type Kmem_t* = pointer

proc kmalloc*(km: Kmem_t, size: csize_t):pointer {.cdecl, importc: "kmalloc", header: "klib/kalloc.h".}
proc krealloc*(km: Kmem_t, src: pointer, size: csize_t):pointer {.cdecl, importc: "krealloc", header: "klib/kalloc.h".}
proc krelocate*(km: Kmem_t, src: pointer, n_bytes: csize_t):pointer {.cdecl, importc: "krelocate", header: "klib/kalloc.h".}
proc kcalloc*(km: Kmem_t, count: csize_t, size: csize_t) {.cdecl, importc: "kcalloc", header: "klib/kalloc.h".}
proc kfree*(km: Kmem_t, src: pointer) {.cdecl, importc: "kfree", header: "klib/kalloc.h".}