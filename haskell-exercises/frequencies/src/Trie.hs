module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a = Leaf a
            | (Trie a) :-: (Trie a) | Nil deriving (Eq, Show, Ord)

-- Bring definition from previous TP

left::Trie a -> Trie a
left Nil = error "Exception: Left of Nil"
left (l :-: _) = l

right::Trie a -> Trie a
right Nil = error "Exception: Right of Nil"
right (_ :-: r) = r

find::Bits -> Trie a -> a
find bits trie = value
  where
    (value, _) = subFind bits trie

decode::Bits -> Trie Char -> String
decode [] _ = ""
decode bits trie = char : (decode bitsLeft trie)
  where
    (char, bitsLeft) = subFind bits trie

toList::Trie a -> [(a, Bits)]
toList Nil = error "Making Nil a List is impossible"
toList (Leaf x) = [(x, [])]
toList trie = _toList trie []

_toList :: Trie a -> Bits -> [(a, Bits)]
_toList (Leaf x) bits = [(x, bits)]
_toList Nil _ = []
_toList (l :-: r) list = leftList ++ rightList
  where
    leftList = _toList l (list++[F])
    rightList = _toList r (list++[T])

--contains::Bits -> Trie a -> Bool
--contains [] _ = False
--contains bits trie = (subFind bits trie) /= Nothing

subFind::Bits -> Trie a -> (a, Bits)
subFind list (Leaf a) = (a, list)
subFind [] _ = error "No key"
subFind (b:bs) trie = if(b == F) then subFind bs (left trie) else subFind bs (right trie)
