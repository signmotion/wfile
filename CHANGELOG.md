# Changelog

All notable changes to the project `WFile` will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 0.4.4

- Updated a curated list in `README`.
- Added a link to [CodeTriangle](https://codetriage.com) in `README`.
- Included **Whats New** section in `README`.
- Provided emojis to some sections in `README`.
- Added a quality code badge to `README`. Thanks [CodeFactor](https://codefactor.io).
- Replaced supported platforms and SDKs to dynamic badges. Thanks [Badgen](https://badgen.net/pub).

## 0.4.3

- Added **Rationale** section to `README`. Thanks [s00prtr00pr](https://reddit.com/user/s00prtr00pr).
- Included supported file formats to `README`.

## 0.4.2

- `README`. Added supported platforms, SDKs, better badges, a link to tests, and a help guide for a first-time contribution to open-source.
- Fixed Windows delimiter path to file not being detected in Linux.

## 0.4.1

- Added CI.
- Provided badges to `README`.
- Upgraded dependencies.

## 0.4.0

- Introduced key-value brokers: `ImageFilesystemBroker`, `TextFilesystemBroker`, `XmlFilesystemBroker`, `FilesystemBroker<T>` and `Broker<K, T>`.
- Introduced `readAsJsonListListT()`, `delete()`.
- Keeping `createPathIfNotExists` into `WFile`.
- Added `example/README` with resourses for learning.
- Updated `README`.
- Upgraded dependencies.

## 0.3.3

- Fixed a wrong composite path for `writeAs*()` and `readAsImage()`.
- Updated `README`.
- Upgraded dependencies.

## 0.3.2

- Added examples to `README`.

## 0.3.1

- Fixed an incorrect result path when a prefix available.
- Extended a range for a granted version of the package `path`. Reason: avoid conflicts with other packages.

## 0.3.0

- Replaced `String path` to `dynamic path`. Reason: this way we can use `String` and `List` for build a path.
- Switching the behaviour of `WFile` between returning `null` or throwing an exception when a reading file not found.
- Introduced `WFile.readOrDefaults<T>()`.
- Introduced extensions: `pathHead`, `pathAfterHead`, `pathWithoutTail`, `listToPath`, `listToNPath`.
- Introduced a predefined path separator `npathSeparator` and system path separator `spathSeparator`.
- Shorted names for checking exist files and directories.
- `WFile.readAsImage()` returns `null` instead of an empty image when a file not found.
- Reinforced tests.
- Updated `README`.

## 0.2.0

- Introduced a read and write file as XML. Thanks <https://pub.dev/packages/xml>.

## 0.1.0

- Initial release.
