module Lib where

parseArguments :: [String] -> Maybe FilePath
parseArguments [filePath] = Just filePath
parseArguments _ = Nothing

-- fromMaybe :: a -> Maybe a -> a
-- fromMaybe _ (Just v) = v
-- fromMaybe v Nothing = v

