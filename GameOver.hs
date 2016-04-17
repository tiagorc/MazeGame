module GameOver(setTimer) where

import Data.Time
import System.IO
import Control.Monad

configTimerWith time nowTime = addUTCTime (realToFrac (time*60)) nowTime

setTimer = do
  putStr "Informe tempo de jogo(minutos):"
  timeGame <- readLn::IO Integer
  do{putStr "Tempo setado: ";print timeGame;}

  currentTime <- getCurrentTime
  let time = configTimerWith timeGame currentTime

  do{putStr "Timer setted with success\n"}
  saveTime (show time)

--  getCurrentTime >>= \currentTime -> configTimerWith timeGame currentTime

saveTime time = writeFile ".time" time

compareTime = do
  savedTime <- (readFile ".time")
  currentTime <- getCurrentTime
  if (show savedTime) == show currentTime
  then putStr "Time Over\n"
  else putStr "Time not Over\n"
  do {putStr "Saved Time: "; print savedTime;}
  do {putStr "Now Time: "; print (show currentTime);}

doubleX x = if x > 100 then x else x*2
