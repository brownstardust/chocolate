-- Chocolate
--[[

Copyright (c) 2023 brownstardust (Poppin Brown)

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
   may be used to endorse or promote products derived from this software without
   specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

]]--

-- Load love module
local love = require("love");
assert(love._version >= "11.0", "The Chocolate library requires at least LÖVE 11.0.");

-- These YOLO (You Only Live Once) functions execute once and that's it.
function video(mode, vid, name, yolo)
   if yolo then
      if mode == "load" then
         name = love.graphics.newVideo(vid);
         yolo = false;
         return name; yolo;
      else if mode == "play" then
         vid:play();
         yolo = false;
      end
   end
end 

function playAudio(music, yolo)
   -- play audio only once
end

function loadAudio(mode, music, name, type, loop, yolo)
   -- load audio only once
end

function graphics(mode, img, name, yolo)
   -- load graphics only once
end

function buildUi(tabs)
   -- build table from arguments in this function
   -- (in this case, `element, x, y, xscale, yscale...`)
   -- then tell LÖVE to print all of them.
end

-- This section is for event-based functions.
-- We'll call these the "efficiency" functions.

-- This one is to be executed within love.keypressed().
function inputPressed(keypress, fn, switcher) -- used like chocolate.input("w", function() print("success") end, [any switcher variable here, like ])
   if love.keyboard.isDown(key) then
      if not iscallable(fn) then
         error("Chocolate: function is not callable")
      elseif iscallable(fn) then
         fn()
      end
   end
end