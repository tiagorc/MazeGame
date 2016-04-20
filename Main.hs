module Main where

import BuildMaze (getMazeMap)
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)

playFlow (h:t) = do
  printMaze
  printMenu
  choise <- readChoice
  let increment = menuAction choise
  let position = h
  when (increment == (-1,-1)) $ main
  let first = (fst position) + (fst increment)
  let second = (snd position) + (snd increment)
  let tupleFormat = (first,second)
  playFlow [tupleFormat]

main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  if choice == "1"
  -- Put a list here in place of (1,1)
  then playFlow [(1,1)]
  else exitSuccess
  main

printMaze =  do
  mazeMap <- getMazeMap
  print mazeMap

printMenu = putStr "Enter the coordinate: \n(m) - Return\n"

readChoice = hSetBuffering stdin NoBuffering >> hSetEcho stdin False >> getChar

menuAction direction = isValid direction
