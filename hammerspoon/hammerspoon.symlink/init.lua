-- local function bindKey(original_modifiers, original_key, new_modifiers, new_key)
--   original_modifiers = original_modifiers or {}
--   new_modifiers = new_modifiers or {}
--
--   hs.hotkey.bind(
--     original_modifiers,
--     original_key,
--     function()
--       hs.eventtap.event.newKeyEvent(new_modifiers, string.lower(new_key), true):post()
--     end,
--     function()
--       hs.eventtap.event.newKeyEvent(new_modifiers, string.lower(new_key), false):post()
--     end,
--     function ()
--       hs.eventtap.event.newKeyEvent(new_modifiers, string.lower(new_key), true):post()
--       hs.timer.usleep(1000)
--       hs.eventtap.event.newKeyEvent(new_modifiers, string.lower(new_key), false):post()
--     end
--   )
-- end
--
-- -- Rebind "Quit", used in outlook mark as read & IDEs to toggle comments
-- bindKey({"cmd"}, "Q", {"cmd", "shift"}, "W")
-- -- Rebind "Find-Replace"
-- bindKey({"cmd"}, "H", {"cmd", "shift"}, "H")
-- --bindKey({}, "F13", {"cmd", "shift", "alt"}, "4")

inspect = hs.inspect.inspect
--prefix = require("prefix")
utils = require("utils")

local REPEAT_FASTER = 10 * 1000
local REPEAT_SLOWER = 100 * 1000
local NO_REPEAT = -1

local function keyStroke(mod, key, repeatDelay)
    hs.eventtap.event.newKeyEvent(mod, key, true):post()
    if repeatDelay <= 0 then
        repeatDelay = REPEAT_FASTER
    end
    hs.timer.usleep(repeatDelay)
    hs.eventtap.event.newKeyEvent(mod, key, false):post()
end

local function keyStrokeSystem(key, repeatDelay)
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    if repeatDelay <= 0 then
        repeatDelay = REPEAT_FASTER
    end
    hs.timer.usleep(repeatDelay)
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

-- Map sourceKey + sourceMod -> targetKey + targetMod
local function keymap(sourceKey, sourceMod, targetKey, targetMod, repeatDelay)
    sourceMod = sourceMod or {}

    repeatDelay = repeatDelay or REPEAT_FASTER
    noRepeat = repeatDelay <= 0

    local fn = nil
    if targetMod == nil then
        fn = hs.fnutils.partial(keyStrokeSystem, string.upper(targetKey), arepeatDelay)
    else
        targetMod = utils.splitStr(targetMod, '+')
        fn = hs.fnutils.partial(keyStroke, targetMod, targetKey, repeatDelay)
    end
    if noRepeat then
        hs.hotkey.bind(sourceMod, sourceKey, fn, nil, nil)
    else
        hs.hotkey.bind(sourceMod, sourceKey, fn, nil, fn)
    end
end

-- Rebind "Quit", used in outlook mark as read & IDEs to toggle comments
keymap('q', 'cmd', 'w', 'cmd+shift', NO_REPEAT)
-- Rebind "Find-Replace"
keymap('H', 'cmd', 'F', 'cmd+ctrl+shift', NO_REPEAT)

-- Hammerspoon script to disable bluetooth when the computer is put to sleep. Requires `blueutil` to be installed (`brew install blueutil`).
-- https://gist.github.com/ysimonson/fea48ee8a68ed2cbac12473e87134f58
require "string"

function checkBluetoothResult(rc, stderr, stderr)
    if rc ~= 0 then
        print(string.format("Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s", rc, stderr, stdout))
    end
end

function bluetooth(power)
    print("Setting bluetooth to " .. power)
    local t = hs.task.new("/usr/local/bin/blueutil", checkBluetoothResult, {"--power", power})
    t:start()
end

function refreshXbar()
    -- https://github.com/matryer/xbar-plugins/blob/main/CONTRIBUTING.md#xbar-control-api
    print("Refreshing Xbar")
    -- local t = hs.task.new("/usr/bin/open", nil, {"xbar://app.xbarapp.com/refreshAllPlugins"})
    local t = hs.task.new("/usr/bin/open", nil, {"xbar://app.xbarapp.com/refreshPlugin?path=meta_package_manager.3h.py"})
    t:start()
end

function f(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        -- bluetooth("off")
    elseif event == hs.caffeinate.watcher.screensDidWake then
        -- bluetooth("on")
        refreshXbar()
    end
end

watcher = hs.caffeinate.watcher.new(f)
watcher:start()
