module Main where

import BuildMaze (maze)
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)

--forever (printMaze >> printMenu >> readChoice >>= menuAction)

printAndGetMenuChoise = do
  printMaze
--  printMenu
  choise <- getChar
  let increment = menuAction choise
  printAndGetMenuChoise


main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  if choice == "1"
  then printAndGetMenuChoise
  else exitSuccess
  main

printMaze = print maze

printMenu = putStr "Enter the coordinate: \n(m) - Return"

readChoice = hSetBuffering stdin NoBuffering >> hSetEcho stdin False >> getChar

--menuAction :: Maybe Char -> Maybe (Integer,Integer)
--menuAction 'm' = main
menuAction direction = isValid direction


--menuAction 'w' = isValid 'w'
--menuAction 's' = isValid 's'
--menuAction 'a' = isValid 'a'
--menuAction 'd' = isValid 'd'
