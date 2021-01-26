module CliSpec where

import Test.Hspec

spec :: Spec
spec = do
  describe "(+)" $ do
    it "can add two numbers" $ do
      (1 + 1) `shouldBe` (2 :: Int)
