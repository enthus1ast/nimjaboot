# import or include this into tmpls and the server, define
type
    # You must declare the proc definition from your tmpls.nim here as well.
    ProcNoParam* = proc (): string {.gcsafe, stdcall.}
    ProcId* = proc (id: string): string {.gcsafe, stdcall.}
    ProcError* = proc (errorCode, errorMsg: string): string {.gcsafe, stdcall.}
