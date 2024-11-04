module Teste where

-- ## First Examples


-- ### Functions basic syntax
-- moreThan :: Int -> Int -> Bool

-- infix notation
-- moreThan x y = x > y

-- prefix notation
-- moreThan x y = (>) x y

-- #### Functions cannot be redeclared
-- u :: Int
-- u = 7

-- u = 6


-- ### Lists
-- > :t [True, False, True]
-- [True, False, True] :: [Bool]


-- #### Concatenation

-- > [1,2] ++ [3,4]
-- [1,2,3,4]

-- prefix notation
-- > (++) [1,2] [3,4]
-- [1,2,3,4]

-- empty array

-- > [1,2] ++ []
-- [1,2]

-- > [] ++ [1,2]
-- [1,2]

-- > "ABCD" + "EFG"
-- "ABCDEFG"

-- #### List Operations

-- > head "ABCDEFG"
-- 'A'

-- > last "ABCDEFG"
-- 'G'

-- > tail "ABCDEFG"
-- "BCDEFG"

-- with empty lists

-- > head []
-- *** Exception: Prelude.head: empty list

-- > last []
-- *** Exception: Prelude.head: empty list

-- > tail []
-- *** Exception: Prelude.head: empty list

-- > reverse "HASKELL"
-- "LLESKAH"

-- > reverse [1, 2, 3]
-- [3,2,1]

-- > reverse []
-- []

-- #### Composing

-- > (head . reverse) "HASKELL"
-- 'L'

-- -- same as
-- > head (reverse "HASKELL")
-- 'L'

-- -- same as
-- > last "HASKELL"
-- 'L'

-- #### Position (!! operator)

-- > [1,2,3,4] !! 2
-- 3

-- > [1,2,3,4] !! 0
-- 1

-- > [1,2,3,4] !! (-2)
-- *** Exception: Prelude.!!: negative index

-- > [] !! 2
-- *** Exception: Prelude.!!: index too large

-- #### Unshift

-- > 3 : [3,4,5,6,-1]
-- [3,3,4,5,6,-1]

-- > 'A' : "BCDE"
-- "ABCDE"

-- > 2 : []
-- [2]

-- > 'A' : []
-- "A"

-- > 3 : 4 : [5,2]
-- [3,4,5,2]

-- > (:) A "BCD"
-- "ABCD"

-- #### Length

-- > length [1,2,3,4]
-- 4

-- > length ['a']
-- 1

-- > length "A"
-- 1

-- > length []
-- 0

-- #### List compression

-- doubleList :: [Int] -> [Int]
-- doubleList xs = [2*x | x <- xs]

-- > doubleList [1,2,3,4]
-- [2,4,6,8]

-- list :: [Int]
-- list = [2*x+1 | x<-[0..10], x/=5]

-- > list
-- [1,3,5,7,9,13,15,17,19,21]
-- -- 11 is not in the list because of the condition x/=5

-- ### Tuples
-- not possible to use cons operator (:) nor concatenation (++)

-- > :t ('A', "HELLO")
-- ('A', "HELLO") :: (Char, String)

-- foo :: Char -> Int -> (Int, String)
-- foo x y = (y+9, x:[x])

-- > foo 'E' 2
-- (11,"EE")

-- #### Operations

-- > fst ('A', "HELLO")
-- 'A'

-- > snd ('A', "HELLO")
-- "HELLO"

-- ### Exercises

-- #### Output Lists

-- a) [1, 11, 121, 1331, 14641, 161051, 1771561]
-- [11^x | x<-[0..6]]

-- b) [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]
-- [x | x<-[1..40], x `mod` 4 /= 0]

-- c) ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"]
-- ['A' : x : "BB" | x<-['a'..'g']]

-- d) [5,8,11,17,20,26,29,32,38,41]
-- Copilot: [x | x<-[5..41], x `mod` 3 == 2]

-- e) [1.0,0.5,0.25,0.125,0.0625,0.03125]
-- [1/2^x | x<-[0..5]]
-- Copilot: [1/2**x | x<-[0..5]]
-- Copilot: [2**(-x) | x<-[0..5]]

-- f) [1,10,19,28,37,46,55,64]
-- [9*x+1 | x<-[0..7]]

-- g) [2,4,8,10,12,16,18,22,24,28,30]

-- h) ['@','A','C','D','E','G','J','L']
-- [x | x<-['@'..'L'], x `notElem` "BFHIK"]

-- #### Length is even
-- isEvenLength :: String -> Bool
-- isEvenLength xs = (length xs) `mod` 2 == 0

-- #### Reverse each string
-- reverseStrings :: [String] -> [String]
-- reverseStrings xs = [reverse x | x<-xs]

-- #### Receives list, returns string length excluding even ones
-- oddLengthStrings :: [String] -> [Int]
-- oddLengthStrings xs = [length x | x <- xs, odd (length x)]

-- #### Head as composition
-- composableHead :: [a] -> a
-- composableHead = last . reverse

-- #### Palindrome
-- isPalindrome :: String -> Bool
-- isPalindrome xs = xs == reverse xs

-- #### Multipliers
-- multipliers :: Int -> (Int, Int, Int, Int)
-- multipliers x = (x*2, x*3, x*4, x*5)
