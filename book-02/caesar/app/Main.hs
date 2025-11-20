module Main (main) where

-- main :: IO ()
-- main = do
--   line <- getLine
--   putStrLn line

-- interactiveLines :: Int -> IO ()
-- interactiveLines counter = do
--   line <- getLine
--   if null line
--     then return ()
--     else do
--       putStrLn (show counter ++ ". " ++ line)
--       interactiveLines (counter + 1)

import Data.Char

main :: IO ()
main = do
  line <- getLine
  putStrLn (map toUpper line)
