module Lib where

square :: Int -> Int
square x = x * x

--

type Alphabet = [Char]

lowerAlphabet :: Alphabet
lowerAlphabet = ['a' .. 'z']

upperAlphabet :: Alphabet
upperAlphabet = ['A' .. 'Z']

digits :: Alphabet
digits = ['0' .. '9']

isLower :: Char -> Bool
isLower char = char `elem` lowerAlphabet

isUpper :: Char -> Bool
isUpper char = char `elem` upperAlphabet

isDigit :: Char -> Bool
isDigit char = char `elem` digits

isMisc :: Char -> Bool
-- isMisc char = not (isUpper char || isLower char || isDigit char)
isMisc char = char `notElem` lowerAlphabet ++ upperAlphabet ++ digits -- using list concat

-- listLength :: [a] -> Int
-- listLength [] = 0
-- listLength (x:xs) = 1 + listLength xs

indexOf :: Char -> Alphabet -> Int
indexOf _ [] = undefined
indexOf ch (x : xs) = if x == ch then 0 else 1 + indexOf ch xs

plusOneMaybe :: Maybe Int -> Maybe Int
plusOneMaybe Nothing = Nothing
plusOneMaybe (Just v) = Just (v + 1)

maybeIndexOf :: Char -> [Char] -> Maybe Int
maybeIndexOf _ [] = Nothing
maybeIndexOf ch (x : xs) =
    if x == ch
        then Just 0
        else plusOneMaybe (maybeIndexOf ch xs)

-- Exercise: Writting the (!!) function using pattern matching
elemAt :: [a] -> Int -> a
elemAt [] _ = undefined
elemAt (x : xs) y = if y < 0 then undefined else if y == 0 then x else elemAt xs (y - 1)

charAt :: [Char] -> Int -> Char
charAt = elemAt

listLength :: [a] -> Int
listLength [] = 0
listLength (_ : xs) = 1 + listLength xs

-- lowerAlphabetLength :: Int
-- lowerAlphabetLength = listLength lowerAlphabet

-- upperAlphabetLength :: Int
-- upperAlphabetLength = listLength upperAlphabet

-- digitsLength :: Int
-- digitsLength = listLength digits

-- upperRot :: Int -> Char -> Char
-- upperRot n ch = upperAlphabet !! ((indexOf ch upperAlphabet + n) `mod` upperAlphabetLength)

-- lowerRot :: Int -> Char -> Char
-- lowerRot n ch = lowerAlphabet !! ((indexOf ch lowerAlphabet + n) `mod` lowerAlphabetLength)

alphabetRot :: Alphabet -> Int -> Char -> Char
alphabetRot alphabet n ch = alphabet !! ((indexOf ch alphabet + n) `mod` length alphabet)

upperRot :: Int -> Char -> Char
upperRot = alphabetRot upperAlphabet

lowerRot :: Int -> Char -> Char
lowerRot = alphabetRot lowerAlphabet

digitRot :: Int -> Char -> Char
digitRot = alphabetRot digits

-- rotChar :: Int -> Char -> Char
-- rotChar n ch =
--     if isLower ch
--         then lowerRot n ch
--         else
--             if isUpper ch
--                 then upperRot n ch
--                 else ch

-- using Guards
rotChar :: Int -> Char -> Char
rotChar n ch
    | isLower ch = lowerRot n ch
    | isUpper ch = upperRot n ch
    | isDigit ch = digitRot n ch
    | otherwise = ch

-- caesar :: Int -> String -> String
-- caesar _ [] = []
-- caesar n (x : xs) = rotChar n x : caesar n xs

-- -- transform :: (t -> a) -> [t] -> [a]
-- transform _ [] = []
-- transform fun (x : xs) = fun x : transform fun xs

-- using map
caesar :: Int -> String -> String
caesar n = map (\ch -> rotChar n ch)

rot13 :: String -> String
rot13 = caesar 13

-- Exercise: The ROT135 cipher
rotAlNum :: Char -> Char
rotAlNum ch
    | isDigit ch = rotChar 5 ch
    | otherwise = rotChar 13 ch

rot135 :: String -> String
rot135 = map (\ch -> rotAlNum ch)

-- Exercise: Frequency analysis on string
count :: Char -> String -> Int
count _ [] = 0
count ch (x : xs) = if ch == x then 1 + count ch xs else count ch xs
