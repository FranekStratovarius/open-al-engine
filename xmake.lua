add_requires("openal-soft", "libsndfile", "raylib")
if(is_plat("linux")) then
	add_requires("libsndio")
end

add_rules("mode.debug", "mode.release")

target("openal-soft-test") do
	set_license("LGPL-2.0")
	set_kind("binary")
	set_warnings("all", "error")

	add_files("src/*.c")
	add_includedirs("include", {public = true})

	add_packages("openal-soft", "libsndfile", "raylib")
	if(is_plat("linux")) then
		add_packages("libsndio")
	end
	add_defines("PLATFORM_DESKTOP")

	-- copy assets after build
	after_build(function (target)
		os.cp(path.join("assets"), path.join("$(buildir)", "$(os)", "$(arch)", "$(mode)"))
	end)
end