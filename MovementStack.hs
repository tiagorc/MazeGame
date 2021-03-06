module MovementStack (MovementsStack, backToBeginning, addNewMovement, removeMovement, convertListToStack, mapMovement) where

data MovementsStack position = EmptyStack | MovementsStack [position]
  deriving (Eq, Show)

backToBeginning :: MovementsStack position -> MovementsStack position
backToBeginning _ = EmptyStack

addNewMovement :: (Int,Int) -> MovementsStack (Int,Int) -> MovementsStack (Int,Int)
addNewMovement value (EmptyStack) = MovementsStack[value]
addNewMovement value (MovementsStack []) = MovementsStack[value]
addNewMovement value (MovementsStack complement) = MovementsStack(value:complement)

removeMovement :: MovementsStack (Int,Int) -> MovementsStack (Int,Int)
removeMovement (EmptyStack) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack []) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack(x:y)) = MovementsStack y

convertListToStack :: [position] -> MovementsStack position
convertListToStack list = MovementsStack list

mapMovement :: Char -> (Integer,Integer)
--mapMovement direction (EmptyStack) = MovementStack [d]
--mapMovement direction (MovementStack []) = MovementStack [d]
mapMovement direction
  | direction == 'w' = (-1,0)
  | direction == 's' = (1,0)
  | direction == 'a' = (0,-1)
  | direction == 'd' = (0,1)
  | direction == 'm' = (-1,-1)
  | otherwise = (0,0)
