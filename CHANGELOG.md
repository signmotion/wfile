# Changelog

All notable changes to the project `WFile` will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 0.3.0

- Replaced `String path` to `dynamic path`. Reason: this way we can use `String` and `List` for build a path.
- Switching the behaviour of `WFile` between returning `null` or throwing an exception when a reading file not found.
- Introduced `WFile.readOrDefaults<T>()`.
- Introduced extensions: `pathHead`, `pathAfterHead`, `pathWithoutTail`, `listToPath`, `listToNPath`.
- Introduced a predefined path separator `npathSeparator` and system path separator `spathSeparator`.
- Shorted names for checking exist files and directories.
- `WFile.readAsImage()` returns `null` instead of an empty image when a file not found.
- Reinforced tests.
- Updated README.

## 0.2.0

- Introduced a read and write file as XML. Thanks <https://pub.dev/packages/xml>.

## 0.1.0

- Initial release.
