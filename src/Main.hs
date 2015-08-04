module Main where

import Control.Monad (join)

import  Test.HTestU
import  Test.HTestU.Streaming

import System.Random
import System.Random.TF.Init
import System.Random.PCG.Fast.Pure
import System.Random.SplitMix

runGen name genAction = do
  putStr $ name ++ ": "
  gen <- genAction
  let results = runBatteryToResults nextStreamFromGen gen c_smallCrush
  print results

runStdGen = runGen "StdGen" newStdGen
runTFRandom = runGen "TFRandom" newTFGen
runPCGRandom = runGen "PCGRandom" $ join $ fmap save create
runSplitMix = runGen "SplitMix" newSplitMix64

main = runStdGen >> runTFRandom >> runPCGRandom >> runSplitMix
