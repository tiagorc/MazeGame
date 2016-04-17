module GameOver(setTimer,isGameOver) where

import Data.Time
import System.IO
import qualified Text.Regex as R

-- private?
configTimerWith time nowTime = addUTCTime (realToFrac (time*60)) nowTime
saveTime time = writeFile ".time" time
loadTime = (readFile ".time")

-- back a list with this format ["hh","mm"]
getTimeFromStringDate stringDate = do
  let listDate = R.splitRegex (R.mkRegex ":") stringDate
  let firstCell = listDate !! 0
  let dateHourList = R.splitRegex (R.mkRegex " ") firstCell
  let hours = dateHourList !! 1
  let minutes = listDate !! 1
  [hours,minutes]

-- gameOverConditions ::(savedHour) (actualHour)
-- gameOverConditions (h1:m1) (h2:m2) = do
--  if (read h1 :: Int) == (read h2 :: Int)
--  then return True
--  print m1

-- Public ?
setTimer = do
  putStr "Informe tempo de jogo(minutos):"
  timeGame <- readLn::IO Integer
  do{putStr "Tempo setado: ";print timeGame;}

  currentTime <- getCurrentTime
  let time = configTimerWith timeGame currentTime

  do{putStr "Timer setted with success\n"}
  saveTime (show time)

isGameOver = do
  savedTime <- loadTime
  let savedTimeList = getTimeFromStringDate savedTime
  currentTime <- getCurrentTime
  let currentTimeList = getTimeFromStringDate (show currentTime)
--  if (savedTimeList ) == show currentTime
--  then putStr "Time Over\n"
--  else putStr "Time not Over\n"
  do {putStr "Saved Time: "; print savedTimeList;}
  do {putStr "Now Time: "; print currentTimeList;}
