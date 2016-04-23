module Main where

import BuildMaze (getMazeMap,setMazeMap,getReferenceMap)
import Data.Matrix
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)

playFlow (h:t) = do
-- TODO: Clean all screen before print Maze
  printMaze
  printMenu
  choise <- readChoice
  let increment = menuAction choise
  let position = h
  when (increment == (-1,-1)) $ main

  let first = (fst position) + (fst increment)
  let second = (snd position) + (snd increment)
  let newPosition = (fromInteger first ,fromInteger second)
-- TODO: Make validation of movement
-- TODO2: Refactor this function

-- insert player in Map
  print newPosition
  mazeMap <- getMazeMap
  let newMazeMap = setElem 4 newPosition mazeMap

-- put old value back
  let oldPosition = (fromInteger (fst position) ,fromInteger (snd position))
  referenceMap <- getReferenceMap
  let oldElem = getElem (fromInteger (fst position)) (fromInteger (snd position)) referenceMap
  let reconfiguredMazeMap = setElem oldElem oldPosition newMazeMap

-- save map
  setMazeMap reconfiguredMazeMap
  playFlow [(first,second)]

main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  -- TODO: Put player in start point
  if choice == "1"
  -- TODO: Change [(1,1)] for [startPoint]
  then playFlow [(1,1)]
  else exitSuccess
  main

printMaze =  do
  mazeMap <- getMazeMap
  print mazeMap

printMenu = putStr "Enter the coordinate: \n(m) - Return\n"

readChoice = hSetBuffering stdin NoBuffering >> hSetEcho stdin False >> getChar

menuAction direction = isValid direction
