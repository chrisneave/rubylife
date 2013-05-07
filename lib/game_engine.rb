
require "my_lib"

class GameEngine
  def self.cell_lives?(cellState, liveNeighbors)
    if liveNeighbors < 2 || liveNeighbors > 3
      return 0
    end

    if liveNeighbors == 3 && cellState == 0
      return 1
    end
    
    return 1 unless cellState == 0
    0
  end
  
  def self.get_next_generation(currentGeneration)
    if currentGeneration.is_a?(GameState) != true
      raise ArgumentError
    end

    newstate = GameState.new(currentGeneration.columns, currentGeneration.rows)
    (0..currentGeneration.columns - 1).each do |column|
      (0..currentGeneration.rows - 1).each do |row|
        currentCell = currentGeneration[row][column]
        liveNeighbors = currentGeneration.get_neighbors(column, row).select{ |x| x == 1 }.count
        cellLives = GameEngine.cell_lives?(currentCell, liveNeighbors)
        newstate.set_value_at_column_and_row(column, row, cellLives)
      end
    end

    return newstate
  end
end
