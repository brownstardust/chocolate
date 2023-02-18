# chocolate
 You know the things a lady likes to receive in Valentine's Day? That's right. It's flowers, love (well, LÖVE in this case for us LOVE2D developers) and sizeable boxes of **chocolates**.

 This is the philosophy of the Chocolate library: to equip fellow LÖVE developers with easier tools to use for more compact code. All you need is about one to two lines to replace small chunks of code.
 
 *This is how it works.*

 **DISCLAIMER:**
 The semi-colons are not needed in Lua. They are just there for my sanity since I have a C/C++ background.

 First off, obviously, you want to load Chocolate like you load any other module for LOVE2D:
 ```lua
    function love.load()
        chocolate = require("chocolate")
 ```
 Notice how `local` isn't used. One of the core features of Chocolate is to execute certain commands (on-demand music/video load, etc) once within `love.draw()`, and `love.draw()` only.

 Let's say you want to play music *during* drawing within `love.draw()`:
 ```lua
    -- Let's also assume we already loaded the music as
    -- a stream named "bgm_lvl2"
    function love.draw()
        bgm_lvl2:play();
        -- or we can do this
        love.audio.play(bgm_lvl2);
    end
 ```

 But what's happening? It's playing a lot of instances! (If you're using SLAM.) Now it sounds like a mess!

 With YOLO within Chocolate, however...
 ```lua
    function love.draw()
        chocolate.music()
 ```