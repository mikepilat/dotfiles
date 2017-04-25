import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map as M
import XMonad.Util.EZConfig ( additionalKeys )

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
  xmonad $ docks defaultConfig
	  { terminal = "urxvt"
	  , modMask = mod4Mask
	  , borderWidth = 2
	  , normalBorderColor = "#cccccc"
	  , focusedBorderColor = "#ff8800"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "blue" "" . shorten 50
      }
    , keys = myKeys
	  }

myKeys (XConfig {modMask = mod4}) = M.fromList
    [ ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
    , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
    , ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle") ]
