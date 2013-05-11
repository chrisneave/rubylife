# ConsoleWriter spec

require "my_lib"

describe ConsoleWriter, "#write_to_console" do
	it "Writes a single one character line for a 1 dimensional GameState" do
		expect(ConsoleWriter.write_to_console(GameState.new(1, 1))).to eq(" \n")
	end

	it "Writes an O for a single live cell" do
		expect(ConsoleWriter.write_to_console(GameState.new(1, 1).set_value_at_column_and_row(0, 0, 1))).to eq("O\n")
	end

	it "Writes 10 O's for a GameState containing a single row of 10 live cells" do
		game_state = GameState.new(10, 1)
		(0..9).each do |n|
			game_state.set_value_at_column_and_row(n, 0, 1)
		end
		expect(ConsoleWriter.write_to_console(game_state)).to eq("OOOOOOOOOO\n")
	end

	it "Writes correct number of O's for a complex state pattern" do
		game_state = GameState.new(8,4)
		game_state[0] = [0, 1, 1, 1, 0, 1, 1, 0]
		game_state[1] = [1, 1, 0, 0, 0, 0, 1, 1]
		game_state[2] = [0, 1, 0, 0, 1, 1, 1, 1]
		game_state[3] = [0, 1, 0, 0, 1, 0, 0, 1]
		expect(ConsoleWriter.write_to_console(game_state)).to eq(" OOO OO \nOO    OO\n O  OOOO\n O  O  O\n")
	end
end
