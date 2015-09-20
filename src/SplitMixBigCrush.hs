module Main(main) where

import Test.HTestU (runBatteryToResults, c_bigCrush)
import Test.HTestU.Streaming (nextStreamFromGen, leftSplitStreamFromGen)

import System.Random.SplitMix (newSplitMix64)

-- | Runs BigCrush on the instance of SplitMix64
main = do
  g <- newSplitMix64
  let nextResults = runBatteryToResults nextStreamFromGen g c_bigCrush
  print nextResults
  g' <- newSplitMix64
  let splitResults = runBatteryToResults leftSplitStreamFromGen g c_bigCrush
  print splitResults
