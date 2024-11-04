module Functions where

-- ## Lambdas

-- > (\x -> 2*x) 4
-- 8

-- > (\x xs -> x : reverse xs) 'A' "UOIE"
-- "AEIOU"

-- ## High Order Functions

ev :: (Int -> Int) -> Int
ev f = 1 + f 5

dobro :: Int -> Int
dobro x = 2 * x

triplo :: Int -> Int
triplo x = 3 * x

-- > ev dobro
-- 11
-- > ev triplo
-- 16

-- ## Currying

somarTresNum :: Int -> Int -> Int -> Int
somarTresNum x y z = x + y + z

somarCurr :: Int -> Int
somarCurr = somarTresNum 4 5

-- ## map, foldl e filter

-- ### map

-- > map (+2) [1..5]
-- [3,4,5,6,7]


