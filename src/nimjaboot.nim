import cligen, os, logging

proc stat(dir: string): int =
  discard

proc dyn(dir, name: string): int =
  ## Initialize a nimja project with hot code reloading.
  if not dirExists(dir):
    info "Creating: " & dir
    createDir(dir)
  copyDir(getAppDir() / "nimjaboot" / "dyn" / "public", dir / "public")
  copyDir(getAppDir() / "nimjaboot" / "dyn" / "templates", dir / "templates")

  # copyFile(getAppDir() / "nimjaboot" / "dyn" / "hcrex.nims", dir / "name.nims")
  copyFile(getAppDir() / "nimjaboot" / "dyn" / "hcrex.nims", dir / name & ".nims")
  copyFile(getAppDir() / "nimjaboot" / "dyn" / "exjester.nim", dir / name & ".nim")
  # copyFile(getAppDir() / "nimjaboot" / "dyn" / "exjester.nims", dir / name & ".nims")

  copyFile(getAppDir() / "nimjaboot" / "dyn" / "tmpls.nims", dir / "tmpls.nims")
  copyFile(getAppDir() / "nimjaboot" / "dyn" / "tmpls.nim", dir / "tmpls.nim")

  copyFile(getAppDir() / "nimjaboot" / "dyn" / "shared.nim", dir / "shared.nim")



when isMainModule:
  dispatchMulti([stat], [dyn])