module CodeHighlighter where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Web.HTML (HTMLElement)

foreign import highlight :: HTMLElement -> String -> String -> Effect Unit

type State =
  { elRef :: String
--   , html :: String
  }

data Query a = Initialize a

initialState :: State
initialState = {
    elRef: "raw"
}

rawComponent :: H.Component HH.HTML Query State Void Aff
rawComponent =
  H.lifecycleComponent
  { render
  , eval
  , initialState : const initialState
  , initializer  : Just (H.action Initialize)
  , finalizer    : Nothing
  , receiver: const Nothing
  }
  where

    render :: State -> H.ComponentHTML Query
    render s = HH.pre
                [ HP.class_ (H.ClassName "language-haskell") ] 
                [ HH.code
                  [ HP.class_ (H.ClassName "language-haskell"), HP.ref (H.RefLabel s.elRef) ]
                  []
                ]

    eval :: Query ~> H.ComponentDSL State Query Void Aff
    eval = case _ of
      Initialize next -> do
        updateHTML
        pure next
    
    updateHTML :: H.ComponentDSL State Query Void Aff Unit
    updateHTML = do
      elRef <- H.gets _.elRef
      H.getHTMLElementRef (H.RefLabel elRef) >>= case _ of
        Nothing -> pure unit
        Just el -> do
        --   html <- H.gets _.html
          H.liftEffect $ highlight el "java" "List<String> hey = new ArrayList<>();"
          -- H.liftEffect $ highlight el "haskell" "foo :: Int -> [Int]\nfoo x = let result = x ++ [42] in result"