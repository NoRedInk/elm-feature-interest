module Nri.FeatureInterest exposing (..)

{-|
@docs NoContent, deleteFeaturesByFeatureIdInterview, deleteFeaturesByFeatureIdUpvote, getFeatures, getFeaturesByFeatureId, postFeaturesByFeatureIdInterview, postFeaturesByFeatureIdUpvote
-}

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


import Nri.FeatureInterest.Page exposing (..)

import Nri.FeatureInterest.Feature exposing (..)

{-|-}
type NoContent
    = NoContent

{-|-}
getFeatures : String -> String -> Http.Request (Page)
getFeatures urlBase header_Authorization =
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
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson decodePage
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
getFeaturesByFeatureId : String -> String -> Int -> Http.Request (Feature)
getFeaturesByFeatureId urlBase header_Authorization capture_featureId =
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
                , capture_featureId |> toString |> Http.encodeUri
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson decodeFeature
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
postFeaturesByFeatureIdUpvote : String -> String -> Int -> Http.Request (NoContent)
postFeaturesByFeatureIdUpvote urlBase header_Authorization capture_featureId =
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
                , capture_featureId |> toString |> Http.encodeUri
                , "upvote"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectStringResponse
                (\{ body } ->
                    if String.isEmpty body then
                        Ok NoContent
                    else
                        Err "Expected the response body to be empty"
                )
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
deleteFeaturesByFeatureIdUpvote : String -> String -> Int -> Http.Request (NoContent)
deleteFeaturesByFeatureIdUpvote urlBase header_Authorization capture_featureId =
    Http.request
        { method =
            "DELETE"
        , headers =
            [ Http.header "Authorization" header_Authorization
            ]
        , url =
            String.join "/"
                [ urlBase
                , "features"
                , capture_featureId |> toString |> Http.encodeUri
                , "upvote"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectStringResponse
                (\{ body } ->
                    if String.isEmpty body then
                        Ok NoContent
                    else
                        Err "Expected the response body to be empty"
                )
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
postFeaturesByFeatureIdInterview : String -> String -> Int -> Http.Request (NoContent)
postFeaturesByFeatureIdInterview urlBase header_Authorization capture_featureId =
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
                , capture_featureId |> toString |> Http.encodeUri
                , "interview"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectStringResponse
                (\{ body } ->
                    if String.isEmpty body then
                        Ok NoContent
                    else
                        Err "Expected the response body to be empty"
                )
        , timeout =
            Nothing
        , withCredentials =
            False
        }

{-|-}
deleteFeaturesByFeatureIdInterview : String -> String -> Int -> Http.Request (NoContent)
deleteFeaturesByFeatureIdInterview urlBase header_Authorization capture_featureId =
    Http.request
        { method =
            "DELETE"
        , headers =
            [ Http.header "Authorization" header_Authorization
            ]
        , url =
            String.join "/"
                [ urlBase
                , "features"
                , capture_featureId |> toString |> Http.encodeUri
                , "interview"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectStringResponse
                (\{ body } ->
                    if String.isEmpty body then
                        Ok NoContent
                    else
                        Err "Expected the response body to be empty"
                )
        , timeout =
            Nothing
        , withCredentials =
            False
        }