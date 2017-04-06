module Nri.FeatureInterest.Feature exposing (..)

{-|
@docs Feature, decodeFeature
-}

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


{-|-}
type alias Feature =
    { id : Int
    , header : String
    , body : String
    , image : Maybe (String)
    , upVotes : Int
    , upVoted : Bool
    , interview : Bool
    }

{-|-}
decodeFeature : Decoder Feature
decodeFeature =
    decode Feature
        |> required "id" int
        |> required "header" string
        |> required "body" string
        |> required "image" (maybe string)
        |> required "upVotes" int
        |> required "upVoted" bool
        |> required "interview" bool