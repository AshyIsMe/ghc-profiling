# GHC Profiling

The idea of this repo is to make it incredibly easy for anyone to start profiling GHC on their machines (osx/linux. No idea about windows...).

## Intended Usage

```
$ stack test
# A bunch of output...

GHC 7.10.3 finished in: 30.8 seconds
GHC 8.0.1 finished in: 45.2 seconds

See results.csv for details...
```

It should be a simple one liner to run a performance comparison between a known LTS version of GHC and the "latest" one.
ie. ghc-7.10 vs ghc-8.0.1.

## What it should do
- Download and build the 2 versions of GHC (either from source or maybe just using stack for now)
- For each GHC version:
  - Clone the repos of some packages from stackage (choose 1 or 2 good testing packages and eventually have an option to run for every single package).
  - Modify stack.yaml to specify the GHC version
  - Run a stack build once to download and build the dependencies (we don't want to profile network performance after all...)
  - Run a stack clean
  - Run a stack build again and collect timing results (in detail with extra GHC options if possible).
- Collate results.csv from the timing outputs above.

If possible this should capture timings for specific compiler passes etc.
It should also be possible to specify a local ghc build to make it easy to make some GHC changes and then profile the results for comparison.

Eventually this could potentially become part of the GHC tests so GHC devs can test for performance improvements/regressions nice and easily.
(Imagine if each GHC commit was accompanied with an autogenerated "Performance Improvement 2%" etc)