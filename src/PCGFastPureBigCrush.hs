module Main where

import Control.Monad (join)

import Test.HTestU
import Test.HTestU.Streaming
import System.Random.PCG.Fast.Pure

gen = join $ fmap save create

main = fmap (\g -> runBatteryToResults nextStreamFromGen g c_bigCrush) gen >>= print
