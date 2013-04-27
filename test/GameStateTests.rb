require "test/unit"
require "src/GameState"

class GameStateTests
  
  class Initialize < Test::Unit::TestCase
    
    def test_zeroColumnsAndRows_ThrowsArgumentError
      # Arrange
      # Act
      # Assert
      assert_raise ArgumentError do
        target = GameState.new(0, 0)
      end
    end
    
    def test_validInput_SetsCorrectColumnsAndRows
      # Arrange
      # Act
      target = GameState.new(1, 2)
      
      # Assert
      assert_equal 1, target.columns, "Columns #{target.columns} does not equal 1"
      assert_equal 2, target.rows, "Rows #{target.rows} does not equal 2"
    end
    
  end
  
end