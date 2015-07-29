import  Test.HTestU
import  Test.HTestU.Streaming

import System.Random.SplitMix

main = fmap (\g -> runBatteryToResults nextStreamFromGen g c_bigCrush) newSplitMix64 >>= print
