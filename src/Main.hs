module Main(main) where

import Control.Monad (join)

import  Test.HTestU (runBatteryToResults, c_smallCrush)
import  Test.HTestU.Streaming (RandomStream, nextStreamFromGen, leftSplitStreamFromGen)

import System.Random (RandomGen, newStdGen)
import System.Random.TF.Init
import System.Random.PCG.Fast.Pure
import System.Random.SplitMix

-- | Given a 'name' and an 'genAction' for producing a generator instance and
-- runs smallCrush using a given 'streamer' function
runGen :: RandomGen g => String -> IO g -> (g -> RandomStream) -> IO ()
runGen name genAction streamer = do
  putStr $ name ++ ": "
  gen <- genAction
  let results = runBatteryToResults streamer gen c_smallCrush
  print results

-- Runners for smallCrush on default random number generators
runStdGen = runGen "StdGen" newStdGen
runTFRandom = runGen "TFRandom" newTFGen
runPCGRandom = runGen "PCGRandom" $ join $ fmap save create
runSplitMix = runGen "SplitMix" newSplitMix64

-- | Runs smallCrush on default random number generators using
-- 'nextStreamFromGen' and 'leftSplitStreamFromGen'
main = do
  putStrLn "Next streamer"
  runStdGen nextStreamFromGen
  runTFRandom nextStreamFromGen
  runPCGRandom nextStreamFromGen
  runSplitMix nextStreamFromGen
  putStrLn "Split streamer"
  runStdGen leftSplitStreamFromGen
  runTFRandom leftSplitStreamFromGen
  runPCGRandom leftSplitStreamFromGen
  runSplitMix leftSplitStreamFromGen
