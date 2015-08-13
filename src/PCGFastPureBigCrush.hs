module Main(main) where

import Control.Monad (join)

import Test.HTestU (runBatteryToResults, c_bigCrush)
import Test.HTestU.Streaming (nextStreamFromGen)
import System.Random.PCG.Fast.Pure (save, create)

gen = join $ fmap save create

-- | Runs BigCrush on the instance of PCGRandom
main = fmap (\g -> runBatteryToResults nextStreamFromGen g c_bigCrush) gen >>= print
