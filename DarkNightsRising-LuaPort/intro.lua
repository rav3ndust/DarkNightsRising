--[[
	Dark Nights Rising by rav3ndust 
		- Lua Port 

	A text-based adventure game guided by a robot. 
	
	Global variables will be: 
		- _NAME: Name of the player. 
		- _CHARNAME: Desired character name.
		- _RACE: Character's in-game race.
		- _PLACE: Character's fictional hometown.

-- -- -- line vars -- -- --]]  
--line 1
l1 = [[Hello. Welcome to Dark Nights Rising!
This is a game about finding yourself, but keep in mind: 
The journey is not about the destination...
...But the path it takes to get there.]] 
-- line 2
l2 = [[I am Raven, your guide through this game. 
Please tell me a bit about yourself.]] 
-- line 3
l3 = [[So, wanderer, what is your name? 
Press ENTER to continue.]] 
-- line 4
l4 = [[What would you like to call your character? 
Press ENTER to continue.]] 
-- line 5
l5 = [[What race will your character hail from?
Press ENTER to continue.]] 
-- line 6
l6 = [[What area is your character from?
Press ENTER to continue.]] 
-- -- -- functions -- -- -- 
function sleep(seconds)
	-- halts sys ops X seconds
	os.execute('sleep '..seconds)
end
function executeIntroTrack()
	-- starts the intro song
	local play = "mpg123 -q "
	local tune = "soundtrack/haunted.mp3"
	print("Playing: "..tune)
	os.execute(play..tune)
end
function muteTrack()
	-- kills any music instances
	local stopping = "Killing music."
	local stopped = "Musical instances killed."
	local kill_tune = "killall mpg123"
	print(stopping)
	os.execute(kill_tune)
	print(stopped)
end
function speak_RMS(var)
	-- uses flite(rms) to speak var text.
	local spk = "flite -voice rms "
	os.execute(spk..var)
end
function speak_SLT(var)
	-- uses flite(slt) to speak var text.
	local spk = "flite -voice slt "
	os.execute(spk..var)
end
function menu(var)
	-- uses dialog to present menu
	local _menu = "dialog --msgbox "
	local n1, n2 = 0, 0
	os.execute(_menu..var.." "..n1.." "..n2)
end
function write2sources(data)
	-- writes vars to our source file.
	local sourcefile = io.open("sources.lua", w)
	sourcefile:write(data)
	sourcefile:close()
end
-- Script Begins Here
a = "Please type your desired name: "
b = "Please type your desired character name: "
c = "Please type your desired character race: "
d = "Please type your desired character location: " 
os.execute('touch library/sources.lua') -- create the sourcefile
menu(l1)
speak_RMS(l1)
menu(l2)
speak_RMS(l2)
menu(l3)
speak_RMS(l3)
print(a)
_NAME = io.read()
-- write _NAME to sourcefile. 
write2sources(_NAME) 
print(_NAME.." ".."written to sources file.")
-- continue
menu(l4) 
speak_RMS(l4)
print(b)
_CHARNAME = io.read()
-- write _CHARNAME to sourcefile.
write2sources(_CHARNAME) 
print(_CHARNAME.." ".."written to sources file.")
-- continue 
menu(l5) 
speak_RMS(l5) 
print(c) 
_RACE = io.read()
-- write _RACE to sourcefile. 
write2sources(_RACE) 
print(_RACE.." ".."written to sources file.") 
-- continue
menu(l6)
speak_RMS(l6)
print(d)
_PLACE = io.read()
-- write _PLACE to sourcefile.
write2sources(_PLACE)
print(_PLACE.." ".."written to sources file.")
--[[ @TODO:

We want to continue porting DNR over to lua. 

This is experimental, but worth a shot for testing reasons. 

I'll continue the port and testing - will report back. 

Finish scripting this part of the port soon.
--]] 
