module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
--Trie a === Trie<T> in Java
data Trie a = Leaf a | (Trie a) :-: (Trie a) | Nil deriving (Show, Eq)
-- Add the Type definition deriving (Eq, Show)


            
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
toList trie = [getRecList (left trie) [F]] ++ [getRecList (right trie) [T]]
where
   getRecList (Leaf a) list = [(a, list)]
   getRecList trie list =

--contains::Bits -> Trie a -> Bool
--contains [] _ = False
--contains bits trie = (subFind bits trie) /= Nothing

subFind::Bits -> Trie a -> (a, Bits)
subFind list (Leaf a) = (a, list)
subFind [] _ = error "No key"
subFind (b:bs) trie = if(b == F) then subFind bs (left trie) else subFind bs (right trie)
