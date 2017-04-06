module Nri.FeatureInterest.Admin exposing (..)

{-|
@docs Admin, AdminFeature, decodeAdmin, encodeAdmin, encodeAdminFeature, getFeaturesAdmin, postFeatures, putFeaturesByFeatureId
-}

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


import Nri.FeatureInterest.Feature exposing (..)

{-|-}
type alias Admin =
    { id : Int
    , header : String
    , body : String
    , image : Maybe (String)
    , visible : Bool
    , interviews : Int
    , upVotes : Int
    }

{-|-}
decodeAdmin : Decoder Admin
decodeAdmin =
    decode Admin
        |> required "id" int
        |> required "header" string
        |> required "body" string
        |> required "image" (maybe string)
        |> required "visible" bool
        |> required "interviews" int
        |> required "upVotes" int

{-|-}
encodeAdmin : Admin -> Json.Encode.Value
encodeAdmin x =
    Json.Encode.object
        [ ( "id", Json.Encode.int x.id )
        , ( "header", Json.Encode.string x.header )
        , ( "body", Json.Encode.string x.body )
        , ( "image", (Maybe.withDefault Json.Encode.null << Maybe.map Json.Encode.string) x.image )
        , ( "visible", Json.Encode.bool x.visible )
        , ( "interviews", Json.Encode.int x.interviews )
        , ( "upVotes", Json.Encode.int x.upVotes )
        ]

{-|-}
type alias AdminFeature =
    { header : String
    , body : String
    , image : Maybe (String)
    , visible : Bool
    }

{-|-}
encodeAdminFeature : AdminFeature -> Json.Encode.Value
encodeAdminFeature x =
    Json.Encode.object
        [ ( "header", Json.Encode.string x.header )
        , ( "body", Json.Encode.string x.body )
        , ( "image", (Maybe.withDefault Json.Encode.null << Maybe.map Json.Encode.string) x.image )
        , ( "visible", Json.Encode.bool x.visible )
        ]

{-|-}
getFeaturesAdmin : String -> String -> Http.Request (List (Admin))
getFeaturesAdmin urlBase header_Authorization =
    Http.request
        { method =
            "GET"
        , headers =
            [ Http.header "Authorization" header_Authorization
            ]
        , url =
            String.join "/"
                [ urlBase
                , "features"
                , "admin"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson (list decodeAdmin)
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
postFeatures : String -> String -> AdminFeature -> Http.Request (Feature)
postFeatures urlBase header_Authorization body =
    Http.request
        { method =
            "POST"
        , headers =
            [ Http.header "Authorization" header_Authorization
            ]
        , url =
            String.join "/"
                [ urlBase
                , "features"
                ]
        , body =
            Http.jsonBody (encodeAdminFeature body)
        , expect =
            Http.expectJson decodeFeature
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
putFeaturesByFeatureId : String -> String -> Int -> AdminFeature -> Http.Request (Feature)
putFeaturesByFeatureId urlBase header_Authorization capture_featureId body =
    Http.request
        { method =
            "PUT"
        , headers =
            [ Http.header "Authorization" header_Authorization
            ]
        , url =
            String.join "/"
                [ urlBase
                , "features"
                , capture_featureId |> toString |> Http.encodeUri
                ]
        , body =
            Http.jsonBody (encodeAdminFeature body)
        , expect =
            Http.expectJson decodeFeature
        , timeout =
            Nothing
        , withCredentials =
            False
        }