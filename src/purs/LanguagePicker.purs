module LanguagePicker where

import Prelude

import DOM.HTML.Indexed.InputType (InputType(..))
import Data.Maybe (Maybe(..))
import Halogen (ClassName(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

data Query a = ChangeLanguage Language a

type State = 
  { language :: Language
  }

data Message = Changed Language

data Language = Haskell | Java

languagePickerComponent :: forall m. H.Component HH.HTML Query Unit Message m
languagePickerComponent =
  H.component
    { initialState: const initialState
    , render
    , eval
    , receiver: const Nothing
    }
  where

  initialState :: State
  initialState = 
    { language: Java
    }

  render :: State -> H.ComponentHTML Query
  render state =
    HH.div_
      [ HH.p_
        [ HH.text ("Picked language: " <> renderPickedLanguage state.language)
        ]
      , HH.button
        [ HE.onClick (HE.input_ (ChangeLanguage Haskell)) ]
        [ HH.text "Haskell"
        ]
      , HH.button
        [ HE.onClick (HE.input_ (ChangeLanguage Java)) ]
        [ HH.text "Java"
        ]
      , HH.pre_
        [ HH.code
          [ HP.class_ (getCssClassName state.language) ]
          [ HH.text (renderCodeExample state.language) ]
        ]
      ]

  eval :: Query ~> H.ComponentDSL State Query Message m
  eval = case _ of
    ChangeLanguage pickedLanguage next -> do
      H.modify_ (\state -> state {language = pickedLanguage})
      H.raise $ Changed pickedLanguage
      pure next

renderPickedLanguage :: Language -> String
renderPickedLanguage Haskell = "Haskell"
renderPickedLanguage Java = "Java"

getCssClassName :: Language -> ClassName
getCssClassName Haskell = H.ClassName "haskell"
getCssClassName Java = H.ClassName "java"

renderCodeExample :: Language -> String
renderCodeExample Haskell = """foo :: String -> Int
foo s = if True then length s else 42
"""
renderCodeExample Java = """public int foo(String s) {
    if (true) {
        return s.length();
    } else {
        return 42;
    }
}
"""
