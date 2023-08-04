# About

RubyMotion BridgeSupport is a Ruby C Extension that is used to
generate xml metadata for C and Objective C header files. The metadata
is used for AOT compilation of Foreign Function Interfaces used within
[RubyMotion]. Variants of this C Extension are also used by Apple's
Interface Builder (located at `/System/Library/BridgeSupport/` on MacOS),
[PyObjC], and [FUSE].

This is a hard fork of Apple's Version with the following
enhancements:

- `gen_bridge_metadata` takes in a `--headers` switch which is a collection
  of header files. This allows the generation of xml metadata for
  very large codebases without approaching the limits on number of
  characters that can be sent to the CLI.
- The clang target for the C Extension is in lock step with the clang
  version that Apple ships with Xcode (they are usually a version or
  two behind LLVM.org).
- This version also supports the generation of xml metadata for Java
  and JNI (which currently isn't in the repository, but will be
  extracted from RubyMotion and placed here, eventually).
- Contains compilation updates to fix Segfault issues on Mojave when
  compiled against system Ruby.

# How to Build
- Assumses you are on MacOS 13.4.1
- Install Xcode 14.3.1
- Install [brew](http://brew.sh) and run the following commands:
```
brew install gcc
brew install make
brew install cmake
```
- Install Xcode 10.3, it is strongly recommended that you do not
  install Xcode from the App Store and instead use the archived
  images provided in [Apple's Developer Portal Download Archive].
- Install Xcode at `/Applications/Xcode.app` (if you have another
  version of Xcode installed there, you can just rename it
  temporarily).
- After installing Xcode, you _must_ double click Xcode and open it
  at least once to accept EULAs.
- Open Terminal and run:
```
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
sudo xcode-select --reset
```

NOTE: The version that is used within the repo _must_ be `system`
Ruby. Do not change the `.ruby-version` file.

- Download the Starter License for [RubyMotion] (if you want to test an update).

- Clone this repo and `cd` into the directory and run:

```
ruby --version # should be: ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22]
sudo gem install xml-simple
sudo gem install rake
sudo gem install minitest
sudo gem install nokogiri -v 1.13.10
```

NOTE: the `sudo` is required for the commands above because we are using `system` ruby.

- Run:

```
make clean
make
make install DESTDIR=./RubyMotion/lib/BridgeSupport3
```

NOTE: compilation will take a while (30 min+).

- Once compiled and installed, run the following command to perform a precursory test:

```
cd test
sh ./sample.sh
cat ./sample.bridgesupport
```

If the command above runs without errors, your environment is set up correctly.

- You can run the test suite using the following command:

```
cd test
rake test
```

- Optionally you can run `sudo make install DESTDIR=/Library/RubyMotion/lib/BridgeSupport3`
  if you want to test any patches against your own RubyMotion projects.

- All the source code for BridgeSupport is located under the `./swig`
  directory. You can change the source code there and then run the
  following to build, install, and test your changes:

```
make rebuild
make install DESTDIR=./RubyMotion/lib/BridgeSupport3
cd test
rake test
```

[RubyMotion]: http://rubymotion.com
[PyObjC]: https://pyobjc.readthedocs.io/en/latest/index.html
[FUSE]: https://osxfuse.github.io/
[Apple's Developer Portal Download Archive]: http://developer.apple.com/downloads
[brew]: http://brew.sh
