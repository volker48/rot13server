{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Rot13 (rot13)
import Data.Text.Lazy.Encoding (decodeUtf8)
import qualified Data.Text.Lazy as L

main = scotty 5000 $ do
    get "/" $ do
        html "hi"
    post "/rot13" $ do
        b <- body
        text $ L.pack $ rot13 $ L.unpack $ decodeUtf8 b

