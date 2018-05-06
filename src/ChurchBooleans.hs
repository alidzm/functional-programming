module ChurchBooleans where

import Combinators
import ChurchNumbers (zero, one)

true a b = a
false a b = b

-- if' b t f = b t f
if' = identity

isZero n = n (constant false) true

-- toNum b = if' b one zero
toNum b = b one zero

table f =
    [ f false false
    , f false true
    , f true false
    , f true true
    ]

and' a b = a b false
or' a b = a true b
not' a = a false true