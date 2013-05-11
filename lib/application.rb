require "my_lib"

game_state = GameEngine.get_random_generation(32, 32)

(1..10).each do |num|
	system("clear")
	puts ConsoleWriter.write_to_console(game_state)
	game_state = GameEngine.get_next_generation(game_state)
	sleep(0.5)
end
