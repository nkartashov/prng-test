module Main(main) where

import Test.HTestU (runBatteryToResults, c_bigCrush)
import Test.HTestU.Streaming (nextStreamFromGen)

import System.Random.SplitMix (newSplitMix64)

-- | Runs BigCrush on the instance of SplitMix64
main = fmap (\g -> runBatteryToResults nextStreamFromGen g c_bigCrush) newSplitMix64 >>= print
