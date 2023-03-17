# this file contains you render functions
# is compiled to a shared lib and loaded by your host application
# to keep compilation fast, use this file only for templates.
# this file is also watched by the filewatcher.
# It can also be changed dynamically!
import nimja
import shared # for the TestObj

import std/httpclient
var client = newHttpClient()

proc index*(): string {.exportc, dynlib.} =
  compileTemplateFile(getScriptDir() / "templates/index.nimja")

proc detail*(id: string): string {.exportc, dynlib.} =
  compileTemplateFile(getScriptDir() / "templates/detail.nimja")

proc error*(errorCode, errorMessage: string): string {.exportc, dynlib.} =
  compileTemplateFile(getScriptDir() / "templates/error.nimja")

proc about*(): string {.exportc, dynlib.} =
  compileTemplateFile(getScriptDir() / "templates/about.nimja")
