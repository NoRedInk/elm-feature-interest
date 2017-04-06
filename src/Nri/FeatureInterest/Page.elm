module Nri.FeatureInterest.Page exposing (..)

{-|
@docs Page, decodePage
-}

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


import Nri.FeatureInterest.Feature exposing (..)

{-|-}
type alias Page =
    { instructions : String
    , features : List (Feature)
    }

{-|-}
decodePage : Decoder Page
decodePage =
    decode Page
        |> required "instructions" string
        |> required "features" (list decodeFeature)