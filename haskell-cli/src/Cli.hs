module Cli where

import Data.Text (Text)
import GHC.Generics (Generic)

import qualified Options.Generic as Options


data Config = Config
  { number :: Int
  , string :: Text
  } deriving (Generic, Show)

instance Options.ParseRecord Config

main :: IO ()
main = do
  config :: Config <- Options.getRecord "cli"
  print config
