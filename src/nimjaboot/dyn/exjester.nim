import nimja/hcrutils # Nimja's hot code reloading utilities
import shared # for the TestObj that is also used in tmpls.nim
import jester, os

# We watch the templates folder for change (and also tmpls.nim implicitly)
var cw {.threadvar.}: ChangeWatcher
cw = newChangeWatcher(@[getAppDir() / "templates/"])
asyncCheck cw.recompile() # if a change is detected we recompile tmpls.nim

settings:
  port = Port(9898)
routes:
  get "/":
    resp dyn(ProcNoParam, "index")

  get "/about":
    resp dyn(ProcNoParam, "about")

  get "/id/@id":
    resp dyn(ProcId, "detail", @"id")


  error Http404:
    # resp Http404, "Looks you took a wrong turn somewhere."
    resp Http404, dyn(ProcError, "error", $Http404, "Page not found.")

  error Exception:
    resp Http500, dyn(ProcError, "error", $Http505, "Something bad happened: " & exception.msg)


