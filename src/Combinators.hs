module Combinators where

identity :: a -> a
identity x = x          -- I combinator

constant :: a -> b -> a
constant x y = x        -- K combinator

apply :: (a -> b) -> a -> b
apply f x = f x

subst :: (a -> b -> c) -> (a -> b) -> a -> c
subst f g x = f x (g x)     -- S combinator
-- s f g x = f x $ g x  -- S combinator

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x
