require("custom/starlantis_youAreHere_AMD/jericho_epochTime")
require("custom/starlantis_youAreHere_AMD/ws2_common_lib")
require("custom/starlantis_youAreHere_AMD/ws2_project_functions")
require("custom/starlantis_youAreHere_AMD/ws2_project_output")

WS2_Software = {}
WS2_Software.id = "Starlantis-YouAreHere-AMD"
WS2_Software.title = "Starlantis - You Are Here - Management Terminal"
WS2_Software.version = "1.0.0"
WS2_Software.revision = "22 feb 2023 14h47 AST"
WS2_Software.author = "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

system.print("\n --------------- \n")
local msgTitleAndVersion = WS2_Software.title .. "\n" .. WS2_Software.version
system.print(msgTitleAndVersion)

local lclFontName = "Montserrat-Light" --export
FontName = [["]] .. lclFontName .. [["]]
FontSize = 32 --export

---
if not DB.hasKey(WS2_Software.id) then
  DB.setStringValue(WS2_Software.id, { recNo = 1, comment = "db_init" })
end

-- The code below is just a "Hello World" that dumps the current links and their element classes
system.print('Debugging Control Unit...')
for linkName, element in pairs(library.getLinks()) do
  system.print(string.format('Found link `%s` of type `%s`', linkName, element.getClass()))
end

-- --
--- eternal runtime with event handlers
Script = {}
function Script.onStart ()
    system.Screen.setCenteredText(msgTitleAndVersion .. "\n\n Script started")
    -- Create some timers to show that the script is working
    unit.setTimer(WS2_Software.id, 5) -- timer ticks every 5 seconds
   
  end
  function Script.onTick (timerId)
    system.Screen.setCenteredText("timer " .. timerId .. " ticked")
  end

  script.onStart()
  system.print("ws2_project_specific: ... ready2 ... ")
  --- eof ---  