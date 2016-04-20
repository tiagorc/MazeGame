module BuildMaze(maze) where

import Data.Matrix
import Data.Char (digitToInt)
import Data.List.Split

-- 0 => caminho livre
-- 1 => Obstaculo
-- 2 => ponto inicial
-- 3 => ponto final
maze = fromList 3 4 [1,0,0,0,2,0,0,0,1,0,0,3]

startPoint = (2,1)
endPoint = (3,4)

cvrtStrListToInt = do
  str <- (readFile ".maze")
  let strList = init (splitOneOf "\n " str)
  let intList = map (read::String->Int) strList
  return intList

{-maze = do
  str <- (readFile ".maze")
  let strList = init (splitOneOf "\n " str)
  print strList
  let intList = map (read::String->Int) strList
  print intList
--  fromList 3 4 (>>= intList)
-}
