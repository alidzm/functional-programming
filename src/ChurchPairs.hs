module ChurchPairs where

import Combinators

tuple a b f = f a b
first t = t constant
second t = t $ flip' constant

swap t = t $ flip' tuple

-- uncurry' f t = t f
uncurry' = flip' apply
curry' f x y = f $ tuple x y