module BuildMaze(getMazeMap,setMazeMap,getReferenceMap) where

import Data.Matrix
import Data.Char (digitToInt)
import Data.List.Split
import System.Process

-- 0 => caminho livre
-- 1 => Obstaculo
-- 2 => ponto inicial
-- 3 => ponto final
-- 4 => player
maze intList = fromList 3 4 intList

getMazeMap = do
  intList <- getIntMap ".map"
  let mazeMap = maze intList
  return mazeMap

getReferenceMap = do
  intList <- getIntMap ".referenceMap"
  let mazeMap = maze intList
  return mazeMap

startPoint = (2,1)
endPoint = (3,4)

-----

getIntMap fileName= do
  str <- readFile fileName
  let strList = init (splitOneOf "\n " str)
  let map = cvrStrListToIntList strList []
  return map

---

setMazeMap matrix = do
  let intList = cvrMatrixToIntList matrix
  let lines = nrows matrix
  let columns = ncols matrix
  saveMap lines columns intList

---

saveMap lines columns intList = readProcessWithExitCode "./format_maze" [show lines, show columns, show intList, ".maze"] []

{- Convert fuctions -}

cvrStrToInt str = read str::Int
cvrIntToStr int = show int

cvrStrListToIntList [] returnList = returnList
cvrStrListToIntList (h:t) returnList =  do
  let newInt = cvrStrToInt h
  let newList = returnList ++ [newInt]
  cvrStrListToIntList t newList

cvrIntListToStrList [] returnList = returnList
cvrIntListToStrList (h:t) returnList =  do
  let newStr = cvrIntToStr h
  let newList = returnList ++ [newStr]
  cvrIntListToStrList t newList

cvrMatrixToIntList matrix = toList matrix
