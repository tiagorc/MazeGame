module Main where

import BuildMaze (maze)
import System.IO
import System.Exit
import Control.Monad

main = do
  putStrLn "\n1 - Play"
  putStrLn "2 - Quit\n"
  choice <- getLine
  if choice == "1"
  then forever (printMenu >> readChoice >>= menuAction)
  else exitSuccess

printMenu = putStr "Enter the coordinate: \n(m) - Return"

readChoice = hSetBuffering stdin NoBuffering >> hSetEcho stdin False >> getChar

menuAction 'p' = putStrLn "\nHello, world!"
menuAction 'm' = main
menuAction _ = hPutStrLn stderr "\nInvalid choice."
