module Main where

import BuildMaze (maze)
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)


playFlow = do
  printMaze
  printMenu
  choise <- getChar
  let increment = menuAction choise
  if increment == (-1,-1)
  then main
  else playFlow

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

--menuAction :: Maybe Char -> Maybe (Integer,Integer)
--menuAction 'm' = main
menuAction direction = isValid direction


{- menuAction 'p' = putStrLn "\nHello, world!"
menuAction 'm' = main
menuAction 'w' = isValid 'w'
menuAction 's' = isValid 's'
menuAction 'a' = isValid 'a'
menuAction 'd' = isValid 'd'
menuAction _ = isValid 'e' -}
