module Main where

import BuildMaze (maze)
import System.IO
import System.Exit
import Control.Monad
import ManageMovement (isValid)

sumTuples :: (Integer,Integer) -> (Integer,Integer) -> (Integer,Integer)
sumTuples (x1,y1) (x2,y2) = (x1+x2,y1+y2)

playFlow actualPositionList = do
  printMaze
  printMenu
  choise <- getChar
  let increment = menuAction choise
  let position = actualPositionList !! 0
  if increment == (-1,-1)
  then main
  else do {
--    sumTuples position increment
    playFlow actualPositionList
    }

main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  if choice == "1"
  -- Put a list here in place of (1,1)
  then playFlow [(1,1)]
  else exitSuccess
  main

printMaze = print maze

printMenu = putStr "Enter the coordinate: \n(m) - Return\n"

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
