import Test.Hspec (describe, hspec, it, shouldBe)
import MidTerm2023 (BQueue(..), Queue(..), binaryProduct, fromList, empty, enqueue, dequeue)

main :: IO ()
main = hspec $ do
  describe "binaryProduct" $ do
    it "multiplies two binary numbers" $ do
      binaryProduct "10" "11" `shouldBe` "110"
    it "multiplies two binary numbers" $ do
      binaryProduct "101" "11" `shouldBe` "1111"
    it "multiplies two binary numbers" $ do
      binaryProduct "101" "0" `shouldBe` "0"
    it "multiplies two binary numbers" $ do
      binaryProduct "101" "1" `shouldBe` "101"

  describe "BQueue" $ do
    it "empty" $ do
      (empty:: BQueue Int) `shouldBe` BQueue { front = [], back = [] }
    it "enqueue" $ do
      enqueue 1 (BQueue [2, 3] [4, 5]) `shouldBe` BQueue { front = [2, 3], back = [1, 4, 5] }
    it "dequeue" $ do
      dequeue (BQueue [1, 2] [3, 4]) `shouldBe` (1, BQueue { front = [2], back = [3, 4] })
    it "fromList" $ do
      fromList [1, 2, 3] `shouldBe` BQueue { front = [1, 2, 3], back = [] }

  describe "Queue" $ do
    it "empty" $ do
      (empty' :: BQueue Int) `shouldBe` BQueue { front = [], back = [] }
    it "enqueue" $ do
      enqueue' 1 (BQueue [2, 3] [4, 5]) `shouldBe` BQueue { front = [2, 3], back = [1, 4, 5] }
    it "dequeue" $ do
      dequeue' (BQueue [1, 2] [3, 4]) `shouldBe` (1, BQueue { front = [2], back = [3, 4] })
    it "fromList" $ do
      fromList' [1, 2, 3] `shouldBe` BQueue { front = [1, 2, 3], back = [] }

  describe "Show BQueue" $ do
    it "shows a BQueue" $ do
      show (BQueue [1, 2, 3] [4, 5, 6]) `shouldBe` "[4,5,6,3,2,1]"
      show (BQueue [1, 2, 3] []) `shouldBe` "[3,2,1]"
      show (BQueue [] [4, 5, 6]) `shouldBe` "[4,5,6]"

  describe "Monad tests" $ do
    it "should work" $ do
      pending
      (Pair 1 2) >>= (\x -> Pair (x + 1) (x + 2)) `shouldBe` Pair 2 3
      (Pair 1 2) >>= (\x -> Pair (x + 1) (x + 2)) >>= (\x -> Pair (x + 1) (x + 2)) `shouldBe` Pair 3 4
      (Pair 1 2) >>= (\x -> Pair (x + 1) (x + 2)) >>= (\x -> Pair (x + 1) (x + 2)) >>= (\x -> Pair (x + 1) (x + 2)) `shouldBe` Pair 4 5


