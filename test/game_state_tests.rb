require "test/unit"
require "my_lib"

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
      (0..9).each do |i|
        (0..19).each do |j|
          assert_equal(0, target.get_value_at_column_and_row(i, j), "Index set to #{j}")
        end
      end
    end
  end
  
  class GetValueAtColumnAndRow < Test::Unit::TestCase
    def test_ValidIndex_ReturnsCorrectValue
      # Arrange
      target = GameState.new(2,2)
      
      # Act
      # Assert
      assert_equal(0, target.get_value_at_column_and_row(0, 0))
      assert_equal(0, target.get_value_at_column_and_row(1, 0))
      assert_equal(0, target.get_value_at_column_and_row(0, 1))
      assert_equal(0, target.get_value_at_column_and_row(1, 1))
    end
    
    def test_IndexOutOfBounds_ThrowsIndexError
      # Arrange
      target = GameState.new(2, 2)
      
      # Act
      # Assert
      assert_raise IndexError do
        target.get_value_at_column_and_row(-1, 1)
      end

      assert_raise IndexError do
        target.get_value_at_column_and_row(1, -1)
      end

      assert_raise IndexError do
        target.get_value_at_column_and_row(5, 1)
      end
      
      assert_raise IndexError do
        target.get_value_at_column_and_row(1, 5)
      end
    end
  end

  class SetValueAtColumnAndRow < Test::Unit::TestCase
    def test_ValidIndex_ReturnsCorrectValue
      # Arrange
      target = GameState.new(2,2)
      
      # Act
      target.set_value_at_column_and_row(0, 0, 1)
      target.set_value_at_column_and_row(1, 0, 1)
      target.set_value_at_column_and_row(0, 1, 1)
      target.set_value_at_column_and_row(1, 1, 1)
      
      # Assert
      assert_equal(1, target.get_value_at_column_and_row(0, 0))
      assert_equal(1, target.get_value_at_column_and_row(1, 0))
      assert_equal(1, target.get_value_at_column_and_row(0, 1))
      assert_equal(1, target.get_value_at_column_and_row(1, 1))
    end
    
    def test_IndexOutOfBounds_ThrowsIndexError
      # Arrange
      target = GameState.new(2, 2)
      
      # Act
      # Assert
      assert_raise IndexError do
        target.set_value_at_column_and_row(-1, 1, 1)
      end
      
      assert_raise IndexError do
        target.set_value_at_column_and_row(1, -1, 1)
      end
      
      assert_raise IndexError do
        target.set_value_at_column_and_row(5, 1, 1)
      end
      
      assert_raise IndexError do
        target.set_value_at_column_and_row(1, 5, 1)
      end
    end
  end
  
  class GetNeighbors < Test::Unit::TestCase
    def test_IndexOutOfBounds_ReturnsEmptyArray
      # Arrange
      target = GameState.new(3, 3)
      
      # Act
      # Assert
      assert_equal 0, target.get_neighbors(-1, 1)
      assert_equal 0, target.get_neighbors(1, -1)
      assert_equal 0, target.get_neighbors(4, 0)
      assert_equal 0, target.get_neighbors(0, 4)
    end
    
    def test_CellHas8Neighbors_Returns8
      # Arrange
      target = GameState.new(3, 3)
      target.set_value_at_column_and_row(1, 1, 1)
      
      # Act
      cells = target.get_neighbors(1, 1)
      
      # Assert
      assert_equal 8, cells
    end
    
    def test_CellHas0Neighbors_Returns0
      # Arrange
      target = GameState.new(1, 1)
      target.set_value_at_column_and_row(0, 0, 1)
      
      # Act
      cells = target.get_neighbors(0, 0)
      
      # Assert
      assert_equal 0, cells
    end
    
    def test_CellIsInCorner_Returns3
      # Arrange
      # Act
      # Assert
      assert_equal 3, GameState.new(3, 3).get_neighbors(0, 0)
      assert_equal 3, GameState.new(3, 3).get_neighbors(2, 0)
      assert_equal 3, GameState.new(3, 3).get_neighbors(2, 0)
      assert_equal 3, GameState.new(3, 3).get_neighbors(2, 2)
    end
    
    def test_CellIsInMiddleOfEdge_Returns5
      # Arrange
      # Act
      # Assert
      assert_equal 5, GameState.new(3, 3).get_neighbors(1, 0)
      assert_equal 5, GameState.new(3, 3).get_neighbors(0, 1)
      assert_equal 5, GameState.new(3, 3).get_neighbors(2, 1)
      assert_equal 5, GameState.new(3, 3).get_neighbors(2, 1)
    end
  end
end