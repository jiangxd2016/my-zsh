local function Chinese()
  -- 简体拼音
  hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end

local function English()
  -- ABC
  hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

-- app to expected ime config
-- app和对应的输入法
local app2Ime = {
  {'/Applications/iTerm.app', 'English'},
  {'/Applications/Visual Studio Code.app', 'English'},
  {'/Applications/Xcode.app', 'English'},
  {'/Applications/Google Chrome.app', 'English'},
  {'/Applications/System Preferences.app', 'English'},
  {'/Applications/DingTalk.app', 'Chinese'},
  {'/Applications/WeChat.app', 'Chinese'},
  {'/Applications/QQ.app', 'Chinese'},
  {'/Applications/IntelliJ IDEA.app', 'English'},
  {'/Applications/WebStorm.app', 'English'},
}

function updateFocusAppInputMethod()
  local ime = 'English'
  print(hs.window.frontmostWindow():application():path())
  local focusAppPath = hs.window.frontmostWindow():application():path()
  for index, app in pairs(app2Ime) do
      local appPath = app[1]
      local expectedIme = app[2]

      if focusAppPath == appPath then
          ime = expectedIme
          break
      end
  end

  if ime == 'English' then
      English()
  else
      Chinese()
  end
end

-- helper hotkey to figure out the app path and name of current focused window
-- 当选中某窗口按下ctrl+command+.时会显示应用的路径等信息
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
  hs.alert.show("App path:        "
  ..hs.window.focusedWindow():application():path()
  .."\n"
  .."App name:      "
  ..hs.window.focusedWindow():application():name()
  .."\n"
  .."IM source id:  "
  ..hs.keycodes.currentSourceID())
end)


-- esc时，切换英文输入法
event = hs.eventtap.new({
  hs.eventtap.event.types.keyUp
}, function(event)
  print(hs.keycodes.currentSourceID(),event:getKeyCode())
 if event:getKeyCode() == 53 and hs.keycodes.currentSourceID() == 'com.apple.inputmethod.SCIM.ITABC' then
      English()
 end
end):start()


print("Event",event)

-- Handle cursor focus and application's screen manage.
-- 窗口激活时自动切换输入法
function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated or eventType == hs.application.watcher.launched) then
      updateFocusAppInputMethod()
  end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
