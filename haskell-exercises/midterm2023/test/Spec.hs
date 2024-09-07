import Test.Hspec (describe, hspec, it, shouldBe)
import MidTerm2023 (BQueue(..), Queue(..), binaryProduct, fromList, empty, enqueue, dequeue)

main :: IO ()
main = hspec $ do
  describe "binaryProduct" $ do
    it "multiplies two binary numbers" $ do
      binaryProduct "101" "11" `shouldBe` "1111"
      binaryProduct "101" "101" `shouldBe` "11001"
      binaryProduct "101" "1001" `shouldBe` "110001"
      binaryProduct "101" "10001" `shouldBe` "1100001"
      binaryProduct "101" "100001" `shouldBe` "11000001"
      binaryProduct "101" "1000001" `shouldBe` "110000001"
      binaryProduct "101" "10000001" `shouldBe` "1100000001"
      binaryProduct "101" "100000001" `shouldBe` "11000000001"
      binaryProduct "101" "1000000001" `shouldBe` "110000000001"
      binaryProduct "101" "10000000001" `shouldBe` "1100000000001"
      binaryProduct "101" "100000000001" `shouldBe` "11000000000001"
      binaryProduct "101" "1000000000001" `shouldBe` "110000000000001"
      binaryProduct "101" "10000000000001" `shouldBe` "1100000000000001"
      binaryProduct "101" "100000000000001" `shouldBe` "11000000000000001"
      binaryProduct "101" "1000000000000001" `shouldBe` "110000000000000001"
      binaryProduct "101" "10000000000000001" `shouldBe` "1100000000000000001"
      binaryProduct "101" "100000000000000001" `shouldBe` "11000000000000000001"
      binaryProduct "101" "1000000000000000001" `shouldBe` "110000000000000000001"
      binaryProduct "101" "10000000000000000001" `shouldBe` "1100000000000000000001"
      binaryProduct "101" "100000000000000000001" `shouldBe` "11000000000000000000001"
      binaryProduct "101" "1000000000000000000001" `shouldBe` "110000000000000000000001"

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


