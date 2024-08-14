module ListsPart2 (Bit(..), bitAt, charToBits, bits, queens) where

import Data.Char(ord)  
import Data.Bits(testBit)
  
data Bit = F | T  deriving (Eq, Show, Enum, Read)
type Bits = [Bit]

bitAt :: Int -> Char -> Bit
bitAt n c = if testBit (ord c) (7-n) then T else F 

charToBits :: Char -> Bits
charToBits ' ' = []
charToBits char = [bitAt i char | i <- [0..7]]


--bits::String -> Bits
--bits "" = []
--bits string = concat result
--    where
--      result = [charToBits (string !! i) | i <- [0..length string - 1]]

bits:: String-> Bits
bits "" = []
bits string = foldr (++) [] (map charToBits string)

type Solution = [Int]

queens::Int -> [Solution]
queens 0 = []
queens n = []