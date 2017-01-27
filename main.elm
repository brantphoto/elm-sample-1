import Html exposing (..)
import Keyboard
import Html.Attributes exposing (style)
import Html.Attributes exposing (style)
-- import Html.Events exposing (onClick)

type alias Model =
  { keystroke: Int
  }

type Msg =
  KeyMsg Keyboard.KeyCode

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


init : (Model, Cmd Msg)
init =
  ({keystroke = 0}, Cmd.none)

view : Model -> Html Msg
view model =
  div [style styleMainDiv] [
    h1 [] [text ( "You just pressed key:  " ++ (toString model.keystroke) )]
    , h2 [] [text "(try it now)"
    ]
  ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    KeyMsg code ->
      ({model | keystroke = code}, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Keyboard.downs KeyMsg

styleMainDiv : List (String, String)
styleMainDiv =
  [ ("height", "100%")
  , ("width", "100%")
  , ("display", "flex")
  , ("flex-direction", "column")
  , ("justify-content", "center")
  , ("align-items", "center")
  ]
