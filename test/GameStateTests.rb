require "test/unit"
require "src/GameState"

class GameStateTests
  
  class Initialize < Test::Unit::TestCase
    
    def test_zeroColumnsAndRows_ThrowsArgumentError
      # Arrange
      # Act
      # Assert
      assert_raise ArgumentError do
        target = new GameState(0, 0)
      end
    end
    
  end
  
end