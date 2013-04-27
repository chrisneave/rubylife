require "test/unit"
require "src/main"

class CellLives < Test::Unit::TestCase
  
  def test_lessThan2Neighbors_returnsFalse
    # Arrange
    # Act
    # Assert
    (0..1).each {|num| assert_equal(false, GameEngine.cellLives(true, num))}
    (0..1).each {|num| assert_equal(false, GameEngine.cellLives(false, num))}
  end
  
  def test_2Or3NeighborsAndAlive_ReturnsTrue
    (2..3).each {|num| assert_equal(true, GameEngine.cellLives(true, num), "Live cell with #{num} neighbors should survive.")}
  end
  
  def test_cellLives_exactly3NeighborsAndDead_returnsTrue
    assert_equal(true, GameEngine.cellLives(false, 3), "Dead cell with exactly 3 neighbors should survive.")
  end
  
  def test_moreThan3Neighbors_returnsFalse
    (4..9).each {|num| assert_equal(false, GameEngine.cellLives(true, num))}
    (4..9).each {|num| assert_equal(false, GameEngine.cellLives(false, num))}
  end
  
end

class GetNextGeneration < Test::Unit::TestCase

  def test_notAnArray_ThrowsArgumentError
    # Arrange
    # Act
    # Assert
    assert_raise ArgumentError do
      GameEngine.getNextGeneration("a string")
    end
  end
  
  def test_zeroLengthArray_ReturnsSameValue
    # Arrange
    input = []
    # Act
    result = GameEngine.getNextGeneration(input)
    # Assert
    assert input == result
  end
  
end
