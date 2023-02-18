# chocolate
 You know the things a lady likes to receive in Valentine's Day? That's right. It's flowers, love (well, LÖVE in this case for us LOVE2D developers) and sizeable boxes of __**chocolates.**__ They're sweet, and usually cheap (depends on what chocolate you bought for your girl.)

 This is the philosophy of the Chocolate library: to equip fellow LÖVE developers with easier tools to use for more compact code. All you need is about one to two lines to replace small chunks of code.
 
 *This is how it works.*

 **DISCLAIMER:**
 The semi-colons are not needed in Lua. They are just there for my sanity since I have a C/C++ background.

 First off, obviously, you want to load Chocolate like you load any other module for LOVE2D:
 ```lua
 function love.load()
    chocolate = require("chocolate");
 ```
 Notice how `local` isn't used. The only core feature of Chocolate (as of this commit) is YOLO (You Only Live Once), a way to execute certain commands (on-demand music/video load, etc) once within `love.draw()` or `love.update()`, and never again.

 Let's say you want to play music *during* drawing within `love.draw()` (example: Level 2 Area 2 music):
 ```lua
 function love.load()
    -- Let's also assume we already loaded the music as a stream named "bgm_lvl2_area2"
 end

 function love.draw()
    bgm_lvl2_area2:play();
    -- or we can do this
    love.audio.play(bgm_lvl2_area2);
 end
 ```

 But what's happening? It's playing a lot of instances! (If you're using [SLAM](https://github.com/vrld/slam).) It sounds like a mess!

 With YOLO within Chocolate, however...
 ```lua
 function love.load()
    -- Again, let's assume we loaded "bgm_lvl2_area2" in this line
    yoloBgmLvl2Area2 = true;
 end

 function love.draw()
    chocolate.music("play", bgm_lvl2_area2, "bgml2a2", "stream", true, true, yoloBgmLvl2Area2);
 end
 ```

 It only executed once, and it's looping as it should, towards the end. ~~That function only lived once. Bad joke, I know.~~