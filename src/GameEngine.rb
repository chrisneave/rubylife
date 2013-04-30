require "src/GameState"

class GameEngine
  
  def GameEngine.cellLives(cellState, liveNeighbors)
    if liveNeighbors < 2 || liveNeighbors > 3
      return false
    end
    
    true
  end
  
  def GameEngine.getNextGeneration(currentGeneration)
    if currentGeneration.is_a?(GameState) != true
      raise ArgumentError
    end
  end
  
end
