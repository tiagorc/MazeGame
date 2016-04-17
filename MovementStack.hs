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

--mapMovement :: Char -> String
--mapMovement direction (EmptyStack) = MovementStack [d]
--mapMovement direction (MovementStack []) = MovementStack [d]
mapMovement direction
  | direction == 'w' = putStrLn "\nfoi pra cima"
  | direction == 's' = putStrLn "\nfoi pra baixo"
  | direction == 'a' = putStrLn "\nfoi para a esquerda"
  | direction == 'd' = putStrLn "\nfoi para a direita"
  | otherwise = error "\nMovimento Invalido!"
