-- "An integral trapeze artist" (c) by Ignacio Slater M.

-- "An integral trapeze artist" is licensed under a
-- Creative Commons Attribution 4.0 International License.

-- You should have received a copy of the license along with this
-- work. If not, see <http://creativecommons.org/licenses/by/4.0/>.

-- v1.0-b.2
module Lib
  ( pintegral
  , integral
  )
where

import           Control.Parallel.Strategies
import           Data.List.Split


type Number = Double
type Interval = (Number, Number)
type Index = Int

g :: (Number -> Number) -> Number -> Number -> Index -> Number
g f a h' i = f (a + fromIntegral i * h') + f (a + fromIntegral (i + 1) * h')

genPartitions
  :: (Number -> Number) -> Number -> Int -> Number -> Index -> [Number]
genPartitions f a n h i =
  if i > n then [] else g f a h i : genPartitions f a n h (i + 1)

{-| Computes an integral using the trapezoid rule method.
    Sequential version.
-}
integral :: (Number -> Number) -> Number -> Number -> Int -> Number
integral f a b n = h / 2 * sum (genPartitions f a n h 0)
  where h = (b - a) / fromIntegral n

{-| Computes an integral using the trapezoid rule method.
    Parallel version.
-}
pintegral :: (Number -> Number) -> Number -> Number -> Int -> Number
pintegral f a b n = h / 2 * runEval (evalSums 0)
 where
  h = (b - a) / fromIntegral n
  subSums lo hi = if lo > hi then [] else genPartitions f a hi h lo
  evalSums lo = do
    s <- rpar $ sum (subSums lo (lo + 50))
    t <- if lo + 50 < n then evalSums (lo + 50) else rpar 0
    return $ s + t
    
-- Elapsed time sequential version: complete aquí
-- Elapsed time parallel version: complete aquí
-- Speedup: complete aquí
