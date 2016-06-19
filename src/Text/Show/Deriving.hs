{-# LANGUAGE CPP #-}
{-|
Module:      Text.Show.Deriving
Copyright:   (C) 2015-2016 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Portability: Template Haskell

Exports functions to mechanically derive 'Show', 'Show1', and 'Show2' instances.

TODO: Is there a GHC wiki page on this?
-}
module Text.Show.Deriving (
      -- * 'Show'
      deriveShow
    , makeShowsPrec
    , makeShow
    , makeShowList
      -- * 'Show1'
    , deriveShow1
#if defined(NEW_FUNCTOR_CLASSES)
    , makeLiftShowsPrec
    , makeLiftShowList
#endif
    , makeShowsPrec1
#if defined(NEW_FUNCTOR_CLASSES)
      -- * 'Show2'
    , deriveShow2
    , makeLiftShowsPrec2
    , makeLiftShowList2
    , makeShowsPrec2
#endif
      -- * 'deriveShow' limitations
      -- $constraints
    ) where

import Text.Show.Deriving.Internal

{- $constraints

Be aware of the following potential gotchas:

* Type variables of kind @*@ are assumed to have 'Show' constraints.
  Type variables of kind @* -> *@ are assumed to have 'Show1' constraints.
  Type variables of kind @* -> * -> *@ are assumed to have 'Show2' constraints.
  If this is not desirable, use 'makeShowsPrec' or one of its cousins.

* The 'Show1' class had a different definition in @transformers-0.4@, and as a result,
  'deriveShow1' implements different instances for the @transformers-0.4@ 'Show1' than
  it otherwise does. Also, 'makeLiftShowsPrec' and 'makeLiftShowList' are not available
  when this library is built against @transformers-0.4@, only 'makeShowsPrec1.

* The 'Show2' class is not available in @transformers-0.4@, and as a
  result, neither are Template Haskell functions that deal with 'Show2' when this
  library is built against @transformers-0.4@.
-}