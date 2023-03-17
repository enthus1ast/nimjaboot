# Package

version       = "0.1.0"
author        = "David Krause"
description   = "bootstraps nimja hot code reloading projects"
license       = "MIT"
srcDir        = "src"
bin           = @["nimjaboot"]


# Dependencies

requires "nim >= 1.9.1"
requires "nimja"
requires "cligen"
