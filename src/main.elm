module Ganymede where

import Signal exposing (Address)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import StartApp.Simple as Simple

type alias Model = {
  bookmarks: List Bookmark
}

type alias Bookmark = {
  href: String,
  description: String,
  extended: String,
  tags: List String,
  toread: Bool
}


type Action
  = SortBookmarks


main =
  Simple.start
    { model = initialModel,
      view = view,
      update = update
    }

update : Action -> Model -> Model
update action model =
  case action of
    SortBookmarks ->
      -- { model | bookmarks = List.sortBy sorter model.bookmarks }
      model


initialModel : Model
initialModel =
  {
    bookmarks = [
      {
        href = "https://spark.apache.org/",
        description = "Apache Spark is a fast and general engine for large-scale data processing.",
        extended = "",
        tags = [],
        toread = False
      }
    ]
  }

view : Address Action -> Model -> Html
view address model =
  let
    bookmarkItems =
      model.bookmarks
        |> List.map bookmarkListItem
  in
    div [] bookmarkItems


bookmarkListItem : Bookmark -> Html
bookmarkListItem bookmark =
  div []
      [ h2 [] [text bookmark.description] ]
