
require "my_lib"

class ConsoleWriter
	def self.write_to_console(game_state)
		output = ""
		(0..game_state.rows - 1).each do |row|
			(0..game_state.columns - 1).each do |column|
				output += self.get_character_for_cell(game_state[row][column])
			end
			output += "\n"
		end
		return output
	end

	def self.get_character_for_cell(cell_value)
		return "O" if cell_value == 1
		" "
	end
end
