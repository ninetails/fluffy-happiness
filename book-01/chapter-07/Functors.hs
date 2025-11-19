module Functors where

import Control.Applicative
import Data.Functor.Contravariant

-- 7.1 Functor Maybe

divisao :: Double -> Double -> Maybe Double
divisao _ 0 = Nothing
divisao x y = Just (x / y)

-- > fmap (2*) (divisao 10 2)
-- Just 10.0
-- > fmap (2*) (divisao 10 0)
-- Nothing

-- > (2*) <$> (divisao 10 2)
-- Just 10.0

-- 7.2 Criando seu functor

data Dupla a = Dupla a a deriving Show

instance Functor Dupla where
    fmap g (Dupla x y) = Dupla (g x) (g y)

-- 7.3 Functores aplicativos

-- instance Applicative Maybe where
--     pure = Just
--     (Just f) <*> (Just x) = Just (f x)
--     _ <*> _ = Nothing

-- instance Applicative [] where
--     pure x = [x]
--     fs <*> xs = [f x | f <- fs, x <- xs]

-- > Just (2*) <*> Just 10
-- Just 20

-- > [(2*), id, (3*)] <*> [1,2]
-- [2, 4, 1, 2, 3, 6]

-- > pure (/) <*> Just 10 <*> Just 2
-- Just 5.0

-- > (/) <$> Just 10 <*> Just 2
-- Just 5.0

-- > (/) `fmap` Just 10 <*> Just 2
-- Just 5.0

-- 7.4 Functores contravariantes

data Predicado a = Predicado { runPred :: a -> Bool }

ehMenor4 :: Predicado Int
ehMenor4 = Predicado (\x -> x < 4)

tamanhoOito :: Predicado String
tamanhoOito = Predicado (\x -> length x == 8)

-- > let func = runPred ehMenor4
-- > func 8
-- False
-- > func (-5)
-- True

-- > let func = runPred tamanhoOito
-- > func "Haskell"
-- False
-- > func "Haskell "
-- True

-- class Contravariant f where
--     contramap :: (a -> b) -> f b -> f a

instance Contravariant Predicado where
    contramap g (Predicado p) = Predicado (p . g)

-- > let func = contramap length ehMenor4 -- func :: Predicado String
-- > let g = runPred func -- g :: String -> Bool
-- > g "Haskell"
-- False
-- > g "ABA"
-- True
