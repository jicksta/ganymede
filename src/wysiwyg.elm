module Ganymede where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

hypertextarea : Address Action -> Html -> Html
hypertextarea address value =
  div [ class "hypertextarea",
        contenteditable True,
        onInput address
      ]
      [ value ]
