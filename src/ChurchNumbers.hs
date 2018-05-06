module ChurchNumbers where

import Combinators

type Church a = ((a -> a) -> a -> a)
type Apply a = (a -> a) -> a -> a

-- zero f x = x
zero :: (a -> b) -> a -> a
zero = constant identity -- point-free

-- one  = ($)
one :: (a -> b) -> a -> b
one  = apply
-- two  f x = f (f x)

-- s f g x = f x (g x)     -- S combinator
-- compose f g x = f (g x)
two :: Apply a
two = subst compose identity

-- inc  one = \f x -> f (one f x)
inc :: Church a -> Apply a
inc n f x = f $ n f x

dec :: (((t1 -> t2) -> (t2 -> t3) -> t3) -> (p1 -> p2) -> (p3 -> p3) -> t4) -> t1 -> p2 -> t4
dec n f x = n (\g h -> h (g f)) (\u -> x) (\u -> u)

add :: Church a -> Church a -> Apply a
add a b f x = a f $ b f x

sub = \m -> \n -> (n dec) m

-- mul m n f x = m (n f) x
mul :: Church a -> Church a -> Apply a
mul = compose

unchurch :: Num a => Church a -> a
unchurch n = n (+ 1) 0

church :: Int -> Apply a
church 0 _ x = x
church n f x = f $ church (n - 1) f x
