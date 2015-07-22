import HTestU
import System.Random.PCG.Fast.Pure
import System.IO.Unsafe (unsafePerformIO)

gen = unsafePerformIO create
{-# NOINLINE gen #-}

main = print $ toResults $ runBatteryOnStream (uniform gen) c_bigCrush
