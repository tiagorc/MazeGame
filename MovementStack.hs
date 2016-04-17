module MovementsStack (MovementsStack, backToBeginning, addNewMovement, removeMovement, convertListToStack) where

import Position (position)

data MovementsStack position = EmptyStack | MovementsStack [position]
  deriving (Eq, Show)

backToBeginning :: MovementsStack position -> MovementsStack position
backToBeginning _ = EmptyStack

addNewMovement :: position -> MovementsStack position -> MovementsStack position
addNewMovement value (EmptyStack) = MovementsStack[value]
addNewMovement value (MovementsStack []) = MovementsStack[value]
addNewMovement value (MovementsStack complement) = MovementsStack(value:complement)

removeMovement :: MovementsStack position -> MovementsStack position
removeMovement (EmptyStack) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack []) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack(x:y)) = MovementsStack y

convertListToStack :: [position] -> MovementsStack position
convertListToStack list = MovementsStack list
