module Ganymede where

import Signal exposing (Address)

import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Events exposing (..)

import StartApp.Simple as Simple

type alias Model = {
  bookmarks: List Bookmark,
  filters: List FilterableMenuItem
}

type alias Bookmark = {
  id: String,
  href: String,
  description: String,
  extended: String,
  time: String,
  tags: List String,
  toread: Bool
}

type alias FilterableMenuItem = {
  id : String,
  title: String,
  state: Bool
}

type Action
  = SortBookmarks


main : Signal Html
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
        id = "1",
        time = "2 hours ago",
        tags = ["bigdata", "neighborly"],
        toread = False
      }
    ],
    filters = [
      { id = "bigdata", title = "bigdata", state = True },
      { id = "neighborly", title = "neighborly", state = False }
    ]
  }


view : Address Action -> Model -> Html
view address model =
  section
    [ class "section" ]
    [ div
        [ class "container" ]
        [ div
            [ class "columns" ]
            [ sidebar [ class "column is-quarter" ] model.filters
            , div [ class "column" ] [ bookmarkItems model ]
            ]
        ]
    ]

bookmarkItems : Model -> Html
bookmarkItems model =
  let
    items = List.map bookmarkListItem model.bookmarks
  in
    section [ class "section" ]
            [ div [ class "container" ]
                  [ h1 [class "title"] [text "Ganymede"]
                  , h2 [class "subtitle"] [text "Pinboard.in Bookmarks"]
                  , div [ ] items
                  ]
            ]

star : Html
star =
  span [ class "ganymede-favorite-icon fa fa-star" ] [ ]


bookmarkListItem : Bookmark -> Html
bookmarkListItem bookmark =
  div [ class "ganymede-bookmark-list-item" ]
      [ a [ href bookmark.href ] [ text bookmark.description ]
      , p [ ] [ text bookmark.extended ]
      , div [ ] (star :: List.map tag bookmark.tags)
      ]

tag : String -> Html
tag name =
  span [ class "tag" ] [ text name ]

sidebar : List Attribute -> List FilterableMenuItem -> Html
sidebar attrs filters =
  div attrs [ menu "Tags" filters ]

menu : String -> List FilterableMenuItem -> Html
menu heading items =
  nav [ class "menu" ]
      (menuHeading heading :: List.map menuItem items)

menuHeading : String -> Html
menuHeading heading =
  p [ class "menu-heading" ] [ text heading ]

menuItem : FilterableMenuItem -> Html
menuItem item =
  label [ class "menu-checkbox" ]
        [ input [ type' "checkbox", checked item.state ] [ ]
        , text item.title
        ]
