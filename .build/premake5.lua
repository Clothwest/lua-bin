LocationDir = ".vs-workspace/"

workspace "lua-bin"
	location(LocationDir)
	architecture "x64"
	language "C"
	staticruntime "On"

	configurations { "Release" }

	buildoptions { "/utf-8" }

ProjectDir = LocationDir .. "projects/"

targetdir("../.bin/")
objdir("../.bin/obj/%{prj.name}")

systemversion "latest"
optimize "On"
runtime "Release"

project "lua"
	location(ProjectDir)
	kind "ConsoleApp"

	files { "../src/lua.c", "../res/icon/src/LuaIcon.h", "../res/icon/src/LuaIcon.rc" }

	links { "lualib" }

project "luac"
	location(ProjectDir)
	kind "ConsoleApp"

	files { "../src/luac.c", "../res/icon/src/LuacIcon.h", "../res/icon/src/LuacIcon.rc" }

	links { "lualib" }

project "lualib"
	location(ProjectDir)
	kind "StaticLib"

	files { "../src/*.h", "../src/*.c" }
	removefiles { "../src/lua.c", "../src/luac.c" }
