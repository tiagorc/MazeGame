module Main where

import BuildMaze (maze)
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)

playFlow = do {
  printMaze;
  printMenu;
  readChoice >>= isValid;
  playFlow
}

main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  if choice == "1"
  then playFlow
  else exitSuccess
  main

printMaze = print maze

printMenu = putStr "Enter the coordinate: \n(m) - Return"

readChoice = hSetBuffering stdin NoBuffering >> hSetEcho stdin False >> getChar

menuAction 'p' = putStrLn "\nHello, world!"
menuAction 'm' = main
menuAction 'w' = isValid 'w'
menuAction 's' = isValid 's'
menuAction 'a' = isValid 'a'
menuAction 'd' = isValid 'd'
menuAction _ = isValid 'e'
