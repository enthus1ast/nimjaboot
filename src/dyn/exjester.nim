import nimja/hcrutils # Nimja's hot code reloading utilities
import shared # for the TestObj that is also used in tmpls.nim
import jester, os
type
    # You must declare the proc definition from your tmpls.nim here as well.
    ProcNoParam = proc (): string {.gcsafe, stdcall.}
    ProcTestObj = proc (to: TestObj): string {.gcsafe, stdcall.}
    ProcId = proc (id: string): string {.gcsafe, stdcall.}
    ProcError = proc (errorCode, errorMsg: string): string {.gcsafe, stdcall.}
    ProcSeq = proc (a: seq[string]): string {.gcsafe, stdcall.}
    ProcIS = proc (ii: int, ss: string): string {.gcsafe, stdcall.}

# We watch the templates folder for change (and also tmpls.nim implicitly)
var cw {.threadvar.}: ChangeWatcher
cw = newChangeWatcher(@[getAppDir() / "templates/"])
asyncCheck cw.recompile() # if a change is detected we recompile tmpls.nim

var to {.threadvar.}: Testobj
to  = TestObj()
to.foo = "foo!"
settings:
  port = Port(9898)
routes:
  get "/":
    resp dyn(ProcNoParam, "index")

  get "/id/@id":
    resp dyn(ProcId, "detail", @"id")

  get "/about":
    resp dyn(ProcIS, "about", 1234, "foobaa")


  error Http404:
    # resp Http404, "Looks you took a wrong turn somewhere."
    resp Http404, dyn(ProcError, "error", $Http404, "Page not found.")

  error Exception:
    resp Http500, dyn(ProcError, "error", $Http505, "Something bad happened: " & exception.msg)


