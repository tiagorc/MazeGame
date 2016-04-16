module GameOver(setTimer) where

import Data.Time
import System.IO

configTimerWith time nowTime = addUTCTime (realToFrac (time*60)) nowTime

setTimer = do
  putStr "Informe tempo de jogo(minutos):"
  timeGame <- readLn::IO Integer
  do{putStr "Tempo setado: ";print timeGame;}

  currentTime <- getCurrentTime
  let time = configTimerWith timeGame currentTime

  do{putStr "Timer setted with success\n"}
  return time
