require "src/GameState"

class GameEngine
  def self.cell_lives?(cellState, liveNeighbors)
    if liveNeighbors < 2 || liveNeighbors > 3
      return false
    end
    
    true
  end
  
  def self.get_next_generation(currentGeneration)
    if currentGeneration.is_a?(GameState) != true
      raise ArgumentError
    end
  end
end
