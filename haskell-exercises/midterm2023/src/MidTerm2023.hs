module MidTerm2023 where

-- Punto 1
binaryProduct::String -> String -> String
binaryProduct "" _ = error "No number provided"
binaryProduct _ "" = error "No number provided"
binaryProduct x "1" = x
--binaryProduct a b = binaryProduct (binaryAdd a a) (binarySubtraction b "1")

--Aux
binaryAdd :: String -> String -> String
binaryAdd a b = reverse (add (reverse a) (reverse b) '0')
  where
    add [] [] carry = if carry == '0' then [] else [carry]
    add (x:xs) [] carry = add (x:xs) [carry] '0'
    add [] (y:ys) carry = add [carry] (y:ys) '0'
    add (x:xs) (y:ys) carry =
      let (sum, newCarry) = fullAdder x y carry
      in sum : add xs ys newCarry

    fullAdder '0' '0' '0' = ('0', '0')
    fullAdder '0' '0' '1' = ('1', '0')
    fullAdder '0' '1' '0' = ('1', '0')
    fullAdder '0' '1' '1' = ('0', '1')
    fullAdder '1' '0' '0' = ('1', '0')
    fullAdder '1' '0' '1' = ('0', '1')
    fullAdder '1' '1' '0' = ('0', '1')
    fullAdder '1' '1' '1' = ('1', '1')

binarySubtraction :: String -> String -> String
binarySubtraction a b = binaryAdd a (binaryAdd (invert b) "1")
  where
    invert = map (\x -> if x == '0' then '1' else '0')

-- Punto 2
data BQueue a = BQueue {front::[a], back::[a]} deriving Eq

empty::BQueue a
empty = BQueue{front = [], back = []}

enqueue :: a -> BQueue a -> BQueue a
enqueue element queue = BQueue{front=  (front queue), back= (element:(back queue))}

dequeue:: BQueue a -> (a, BQueue a)
dequeue (BQueue [] []) = error "Cannot dequeue from an empty queue" -- ?
dequeue (BQueue (x:xs) b) = (x, BQueue xs b)
dequeue (BQueue [] back) = dequeue (BQueue (reverse back) [])

fromList::[a] -> BQueue a
fromList list = BQueue{front=list, back= []}


--Punto 3
class Queue q where
  empty':: q a
  enqueue'::a -> q a -> q a
  dequeue':: q a -> (a, q a)
  fromList'::[a] -> q a

instance Queue BQueue where
  empty' = BQueue{front = [], back = []}
  enqueue' x (BQueue f b) = BQueue f (x:b)
  dequeue' (BQueue [] []) = error "Cannot dequeue from an empty queue" -- ?
  dequeue' (BQueue (x:xs) b) = (x, BQueue xs b)
  dequeue' (BQueue [] back) = dequeue (BQueue (reverse back) [])
  fromList' list = BQueue{front = list, back = []}

-- Punto 4
instance (Show a) => Show (BQueue a) where
  show (BQueue f b) = show (b ++ reverse f)