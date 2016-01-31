module Ganymede where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import StartApp.Simple as StartApp

main =
  StartApp.start
    { model = model,
      view = view,
      update = update
    }

model = True

update action model =
  True

view address model =
  text "Hello world!"
