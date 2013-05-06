require "test/unit"
require "src/main"

class GameEngineTests < Test::Unit::TestCase
  
  def test_cellLives_lessThan2Neighbors_returnsFalse
    # Arrange
    # Act
    # Assert
    (0..1).each {|num| assert_equal(false, GameEngine.cellLives(true, num))}
    (0..1).each {|num| assert_equal(false, GameEngine.cellLives(false, num))}
  end
  
  def test_cellLives_2Or3NeighborsAndAlive_ReturnsTrue
    (2..3).each {|num| assert_equal(true, GameEngine.cellLives(true, num), "Live cell with #{num} neighbors should survive.")}
  end
  
  def test_cellLives_exactly3NeighborsAndDead_returnsTrue
    assert_equal(true, GameEngine.cellLives(false, 3), "Dead cell with exactly 3 neighbors should survive.")
  end
  
  def test_cellLives_moreThan3Neighbors_returnsFalse
    (4..9).each {|num| assert_equal(false, GameEngine.cellLives(true, num))}
    (4..9).each {|num| assert_equal(false, GameEngine.cellLives(false, num))}
  end
  
end
