module MovementsStack (MovementsStack, backToBeginning, addNewMovement, removeMovement, convertListToStack) where

import Position

data MovementsStack p = EmptyStack | MovementsStack [p]
  deriving (Eq, Show)

backToBeginning :: MovementsStack p -> MovementsStack p
backToBeginning _ = EmptyStack

addNewMovement :: p -> MovementsStack p -> MovementsStack p
addNewMovement valor (EmptyStack) = MovementsStack[valor]
addNewMovement valor (MovementsStack []) = MovementsStack[valor]
addNewMovement valor (MovementsStack complement) = MovementsStack(valor:complement)

removeMovement :: MovementsStack p -> MovementsStack p
removeMovement (EmptyStack) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack []) = error "Voce ja esta no inicio do jogo"
removeMovement (MovementsStack(x:y)) = MovementsStack y

convertListToStack :: [p] -> MovementsStack p
convertListToStack list = MovementsStack list
