import  HTestU
import  HTestU.Streaming

import SplitMix

main = fmap (\g -> runBatteryToResults nextStreamFromGen g c_bigCrush) newSplitMix64 >>= print
