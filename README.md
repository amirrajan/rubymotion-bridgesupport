# BridgeSupport

(Imported from [http://code.metager.de/source/xref/apple/BridgeSupport](http://code.metager.de/source/xref/apple/BridgeSupport).)

BridgeSupport files are XML files that describe the API symbols of frameworks or libraries that cannot be introspected at runtime.

These are generally ANSI C symbols that are non-object-oriented items such as constants, enumerations, structures, and functions but can also include some additional information about classes, methods, and informal protocols.

BridgeSupport files are a major component of the Objective-C bridges (RubyCocoa, PyObjC) and languages (MacRuby) which permit Cocoa development.

BridgeSupport comes with pre-generated files for all the system frameworks, as well as a tool that allows you to generate files for 3rd party frameworks or libraries. The sources are covered under a BSD license.

BridgeSupport has shipped in Mac OS X since version 10.5, Leopard. This project hosts development versions of BridgeSupport. Developers are encouraged to download the sources and report problems.

Most recently, BridgeSupport has been rewritten to use the clang parser and provide more complete coverage of all APIs on the system. Please see the Releases page for more information

## Requirements

- cmake
- subversion
- High Sierra or Mojave
- Xcode 9.2

You can install `cmake` and `subversion` with following command.

```
$ brew install cmake subversion
```

## Build Instructions:

1. Go to http://developer.apple.com/downloads and download Xcode 9.2.
2. Unarchive and move Xcode.app into the Applications directory.
3. Open Xcode 9.2 at least once to accept any EULAs and install additional components.
4. From the terminal run: `sudo xcode-select --install`, and `sudo xcode-select --reset`.
5. Clone this repo.
6. Using terminal, `cd` into the cloned repo.
7. Using terminal, run `make clean`.
8. Using terminal, run `make`.

## Using the Metadata Generator

The metadata generator, as known as gen_bridge_metadata, is documented in a manual page. After having installed the project in your system, you can display the documentation:

```
$ man gen_bridge_metadata
```

## About the BridgeSupport Format

Likewise the generator, the BridgeSupport XML format is documented in a manual page.

```
$ man BridgeSupport
```

There is also a DTD file available, that should be installed as /System/Library/DTDs/BridgeSupport.dtd.
