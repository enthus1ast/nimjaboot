import cligen, os, logging

proc stat(dir: string): int =
  discard

proc dyn(dir, name: string): int =
  ## Initialize a nimja project with hot code reloading.
  if not dirExists(dir):
    info "Creating: " & dir
    createDir(dir)
  copyDir(getAppDir() / "dyn" / "public", dir / "public")
  copyDir(getAppDir() / "dyn" / "templates", dir / "templates")

  # copyFile(getAppDir() / "dyn" / "hcrex.nims", dir / "name.nims")
  copyFile(getAppDir() / "dyn" / "hcrex.nims", dir / name & ".nims")
  copyFile(getAppDir() / "dyn" / "exjester.nim", dir / name & ".nim")
  # copyFile(getAppDir() / "dyn" / "exjester.nims", dir / name & ".nims")

  copyFile(getAppDir() / "dyn" / "tmpls.nims", dir / "tmpls.nims")
  copyFile(getAppDir() / "dyn" / "tmpls.nim", dir / "tmpls.nim")

  copyFile(getAppDir() / "dyn" / "shared.nim", dir / "shared.nim")



when isMainModule:
  dispatchMulti([stat], [dyn])