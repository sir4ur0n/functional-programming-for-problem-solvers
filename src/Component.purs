module Component where

import Prelude

import DOM.HTML.Indexed.InputType (InputType(..))
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH 
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Effect.Aff (Aff)

import LanguagePicker as LanguagePicker
import CodeHighlighter as CodeHighlighter

type State = Unit 

data Query a = Foo a

data Slot = LanguagePickerSlot
derive instance eqLanguagePickerSlot :: Eq Slot
derive instance ordLanguagePickerSlot :: Ord Slot

component :: H.Component HH.HTML Query Unit Void Aff
component =
  H.parentComponent
    { initialState: const initialState
    , render
    , eval
    , receiver: const Nothing
    }
  where

  initialState :: State
  initialState = unit

  render :: State -> H.ParentHTML Query CodeHighlighter.Query Slot Aff
  render state =
    HH.div [ HP.class_ (H.ClassName "container") ]
      [ HH.h1_
        [ HH.text "Welcome to Functional Programming for problem solvers!" ]
      , HH.div_ [HH.slot LanguagePickerSlot CodeHighlighter.rawComponent {elRef: "raw"} (const Nothing)]
      -- , HH.p_ [ HH.slot LanguagePickerSlot LanguagePicker.languagePickerComponent unit (const Nothing) ] -- Ignore language picker messages
      ]

  eval :: Query ~> H.ParentDSL State Query CodeHighlighter.Query Slot Void Aff
  eval = case _ of
    Foo next -> do
      pure next