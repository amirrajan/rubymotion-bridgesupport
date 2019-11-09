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

- Install Xcode 10.3, it is strongly recommended that you do not
  install Xcode from the App Store and instead use the archived
  images provided in [Apple's Developer Portal Download Archive].
- Install Xcode at `/Applications/Xcode.app` (if you have another
  version of Xcode installed there, you can just rename it
  temporarily).
- After installing Xcode, you _must_ double click Xcode and open it
  at least once to accept EULAs.
- Open Terminal and run `sudo xcode-select --install`
  then `sudo xcode-selectt --reset`.
- Install [brew] and run the following commands:

```
brew install gcc
brew install make
brew install cmake
brew install rbenv
```

NOTE: It is strongly recommended that you use `rbenv` instead of `rvm`
      specifically because of:

>So, how do these tools get the job done? This is where things get a
>little scary with RVM. RVM overrides the cd shell command in order to
>load the current Ruby environment variables. Not only can the
>override cause unexpected behavior, but it also means that rubies and
>gemsets are loaded when switching directories.

https://metova.com/choosing-a-ruby-version-management-tool-rbenv-vs-rvm/

- After `rbenv` is installed run (which can be used for trouble
  shooting if `system` Ruby fails for any reason):

```
rbenv install 2.3.7
```

NOTE: The version that is used within the repo _must_ be `system`
Ruby. Do not change the `.ruby-version` file.

- Download the Starter License for [RubyMotion].

- Clone this repo and `cd` into the directory and run:

```
sudo gem install xml-simple
sudo gem install rake
sudo gem install minitest
sudo gem install nokogiri
```

(the `sudo` is required for the commands above because we are using `system` ruby)

- Run `make clean` followed by `make` (the initial compilation will take about an hour given
  that `LLVM` is compiled from source).

- Then run:

```
make install DESTDIR=./RubyMotion/lib/BridgeSupport3
```

- Once installed, run the following command to perform a precursory test:

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
