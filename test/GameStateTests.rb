require "test/unit"
require "src/GameState"

class GameStateTests
  
  class Initialize < Test::Unit::TestCase
    
    def test_ZeroColumnsAndRows_ThrowsArgumentError
      # Arrange
      # Act
      # Assert
      assert_raise ArgumentError do
        target = GameState.new(0, 0)
      end
    end
    
    def test_ValidInput_SetsCorrectColumnsAndRows
      # Arrange
      # Act
      target = GameState.new(15, 27)
      
      # Assert
      assert_equal(15, target.columns, "Columns #{target.columns} does not equal 11")
      assert_equal(27, target.rows, "Rows #{target.rows} does not equal 27")
    end
    
    def test_ValidInput_ZerosAllValues
      # Arrange
      # Act
      target = GameState.new(10, 20)
      
      # Assert
      target.each do |i|
        i.each do |j|
          assert_equal(0, j, "Index set to #{j}")
        end
      end
    end
    
  end
  
  class GetCell < Test::Unit::TestCase
    
    def test_ValidIndex_ReturnsCorrectValue
      # Arrange
      target = GameState.new(2,2)
      
      # Act
      result = target.getCell(-1, 0)
      
      # Assert
      assert_equal(0, result)
    end
    
  end
end