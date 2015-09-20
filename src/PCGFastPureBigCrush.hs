module Main(main) where

import Control.Monad (join)

import Test.HTestU (runBatteryToResults, c_bigCrush)
import Test.HTestU.Streaming (nextStreamFromGen, leftSplitStreamFromGen)
import System.Random.PCG.Fast.Pure (save, create)

gen = join $ fmap save create

-- | Runs BigCrush on the instance of PCGRandom
main = do
  g <- gen
  let nextResults = runBatteryToResults nextStreamFromGen g c_bigCrush
  print nextResults
  g' <- gen
  let splitResults = runBatteryToResults leftSplitStreamFromGen g c_bigCrush
  print splitResults
