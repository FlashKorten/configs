import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

{- Nothing special here...
   I use the "Windows"-Key as xmonads modifier
   The part setting the WMName fixes a problem some Java-Apps have when they don't know the window-manager.
   (I'm looking at you, Oracle SQLdeveloper!)
 -}

main = xmonad $ defaultConfig
        { borderWidth        = 1
        , modMask            = mod4Mask
        , workspaces         = ["1","2","3","4","5","6","7","8","9"]
        , terminal           = "konsole"
        , normalBorderColor  = "#dddddd"
        , focusedBorderColor = "#ff0000"
        , startupHook        = ewmhDesktopsStartup >> setWMName "LG3D"}
