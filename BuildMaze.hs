module BuildMaze(getMazeMap) where

import Data.Matrix
import Data.Char (digitToInt)
import Data.List.Split

-- 0 => caminho livre
-- 1 => Obstaculo
-- 2 => ponto inicial
-- 3 => ponto final
maze intList = fromList 3 4 intList

getMazeMap = do
  intList <- getIntMap
  let mazeMap = maze intList
  return mazeMap

startPoint = (2,1)
endPoint = (3,4)

cvrStrToInt str = read str::Int

cvrStrListToIntList [] returnList = returnList
cvrStrListToIntList (h:t) returnList =  do
  let newInt = cvrStrToInt h
  let newList = returnList ++ [newInt]
  cvrStrListToIntList t newList

getIntMap = do
  str <- readFile ".maze"
  let strList = init (splitOneOf "\n " str)
  let map = cvrStrListToIntList strList []
  return map
