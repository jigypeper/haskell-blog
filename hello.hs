main = putStrLn myhtml

newtype Html = Html String
newtype Structure = Structure String

myhtml :: String
myhtml = 
    makeHtml 
        "Hello title" 
            (h1_ "Hello world" <> p_ "Haskell is confusing")
            
el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
    
append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) =
    Structure (a <> b)

render_ :: Html -> String
render_ html =
    case html of
        Html str -> str
        

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> body_ body)
