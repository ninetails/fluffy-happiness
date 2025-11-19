module Exercises where

import Control.Applicative

-- 7.1

data Coisa a = ZeroCoisa | UmaCoisa a | DuasCoisas a a
    deriving (Show, Read)

instance Functor Coisa where
    fmap g ZeroCoisa = ZeroCoisa
    fmap g (UmaCoisa x) = UmaCoisa (g x)
    fmap g (DuasCoisas x y) = DuasCoisas (g x) (g y)

-- 7.2

instance Applicative Coisa where
    pure = UmaCoisa
    ZeroCoisa <*> _ = ZeroCoisa
    _ <*> ZeroCoisa = ZeroCoisa
    UmaCoisa f <*> x = UmaCoisa (f x)
    UmaCoisa f <*> UmaCoisa x = UmaCoisa (f x)
    UmaCoisa f <*> DuasCoisas x y = DuasCoisas (f x) (f y)
    DuasCoisas f g <*> x = DuasCoisas (f x) (g x)
    DuasCoisas f g <*> UmaCoisa x = DuasCoisas (f x) (g x)
    DuasCoisas f g <*> DuasCoisas x y = DuasCoisas (DuasCoisas (f x) (f y)) (DuasCoisas (g x) (g y))
