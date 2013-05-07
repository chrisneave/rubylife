# GameState spec

require "my_lib"

describe GameState, "#initialize" do
  it "Raises ArgumentError for zero columns and rows" do
    expect { gamestate = GameState.new(0, 0) }.to raise_error(ArgumentError)
  end

  it "Sets columns and rows correctly for valid columns and rows" do
    gamestate = GameState.new(15, 27)
    expect(gamestate.columns).to eq(15)
    expect(gamestate.rows).to eq(27)
  end

  it "Zeros all matrix values for valid columns and rows" do
    gamestate = GameState.new(34, 78)
    (0..9).each do |i|
      (0..19).each do |j|
        expect(gamestate.get_value_at_column_and_row(i, j)).to eq(0)
      end
    end
  end
end

describe GameState, "#get_value_at_column_and_row" do
  it "Returns correct value for a valid index" do
    # Arrange
    gamestate = GameState.new(2, 2)
    gamestate.set_value_at_column_and_row(0, 0, 0)
    gamestate.set_value_at_column_and_row(0, 1, 1)
    gamestate.set_value_at_column_and_row(1, 0, 2)
    gamestate.set_value_at_column_and_row(1, 1, 3)
    
    # Act
    # Assert
    expect(gamestate.get_value_at_column_and_row(0, 0)).to eq(0)
    expect(gamestate.get_value_at_column_and_row(0, 1)).to eq(1)
    expect(gamestate.get_value_at_column_and_row(1, 0)).to eq(2)
    expect(gamestate.get_value_at_column_and_row(1, 1)).to eq(3)
  end

  it "Raises IndexError for out of bounds index values" do
    # Arrange
    gamestate = GameState.new(2, 2)
    
    # Act
    # Assert
    expect { gamestate.get_value_at_column_and_row(-1, 1) }.to raise_error(IndexError)
    expect { gamestate.get_value_at_column_and_row(1, -1) }.to raise_error(IndexError)
    expect { gamestate.get_value_at_column_and_row(5, 1) }.to raise_error(IndexError)
    expect { gamestate.get_value_at_column_and_row(1, 5) }.to raise_error(IndexError)
  end
end

describe GameState, "#set_value_at_column_and_row" do
  it "Sets the correct cell for a valid cell coordinate" do
    # Arrange
    gamestate = GameState.new(2, 2)

    gamestate.set_value_at_column_and_row(0, 0, 0)
    gamestate.set_value_at_column_and_row(0, 1, 1)
    gamestate.set_value_at_column_and_row(1, 0, 2)
    gamestate.set_value_at_column_and_row(1, 1, 3)
    
    # Act
    # Assert
    expect(gamestate.get_value_at_column_and_row(0, 0)).to eq(0)
    expect(gamestate.get_value_at_column_and_row(0, 1)).to eq(1)
    expect(gamestate.get_value_at_column_and_row(1, 0)).to eq(2)
    expect(gamestate.get_value_at_column_and_row(1, 1)).to eq(3)
  end

  it "Raises IndexError for out of bounds coordinates" do
    # Arrange
    gamestate = GameState.new(2, 2)
    
    # Act
    # Assert
    expect { gamestate.set_value_at_column_and_row(-1, 1, 1) }.to raise_error(IndexError)
    expect { gamestate.set_value_at_column_and_row(1, -1, 1) }.to raise_error(IndexError)
    expect { gamestate.set_value_at_column_and_row(5, 1, 1) }.to raise_error(IndexError)
    expect { gamestate.set_value_at_column_and_row(1, 5, 1) }.to raise_error(IndexError)
  end
  
  it "Returns self for a valid index" do
    expect(GameState.new(2, 2).set_value_at_column_and_row(0, 0, 1)).to be_a(GameState)
  end
end

describe GameState, "#get_neighbors" do
  it "Returns zero for out of bounds coordinates" do
    # Arrange
    gamestate = GameState.new(2, 2)
    expected = []
    
    # Act
    # Assert
    expect(gamestate.get_neighbors(-1, 1)).to eq(expected)
    expect(gamestate.get_neighbors(1, -1)).to eq(expected)
    expect(gamestate.get_neighbors(4, 0)).to eq(expected)
    expect(gamestate.get_neighbors(0, 4)).to eq(expected)
  end
  
  it "Returns 8 cells when surrounded by 8 cells" do
    # Arrange
    gamestate = GameState.new(3, 3)
    expected = Array.new(8, 0)
    
    # Act
    # Assert
    expect(gamestate.get_neighbors(1, 1)).to eq(expected)
  end
  
  it "Returns 0 cells when surrounded by 0 cells" do
    # Arrange
    gamestate = GameState.new(1, 1)
    expected = []
    
    # Act
    # Assert
    expect(gamestate.get_neighbors(0, 0)).to eq(expected)
  end
  
  it "Returns 3 cells when target cell is in one of the four corners" do
    # Arrange
    gamestate = GameState.new(3, 3)
    expected = [0, 0, 0]
    
    # Act
    # Assert
    expect(gamestate.get_neighbors(0, 0)).to eq(expected)
    expect(gamestate.get_neighbors(2, 0)).to eq(expected)
    expect(gamestate.get_neighbors(0, 2)).to eq(expected)
    expect(gamestate.get_neighbors(2, 2)).to eq(expected)
  end

  it "Returns 5 cells when target cell is in the middle on one of the four edges" do
    # Arrange
    gamestate = GameState.new(3, 3)
    expected = [0, 0, 0, 0, 0]
    
    # Act
    # Assert
    expect(gamestate.get_neighbors(1, 0)).to eq(expected)
    expect(gamestate.get_neighbors(0, 1)).to eq(expected)
    expect(gamestate.get_neighbors(2, 1)).to eq(expected)
    expect(gamestate.get_neighbors(1, 2)).to eq(expected)
  end
end

describe GameState, "#row" do
  it "Raises IndexError for out of bounds index values" do
    expect { GameState.new(3, 3).row(3) }.to raise_error(IndexError)
    expect { GameState.new(3, 3).row(1) }.to_not raise_error(IndexError)
  end
  
  it "Returns the correct row for a valid index value" do
    expect(GameState.new(3, 3).set_value_at_column_and_row(0, 0, 1).row(0)).to eq([1, 0, 0])
    expect(GameState.new(3, 3).set_value_at_column_and_row(1, 1, 1).row(1)).to eq([0, 1, 0])
    expect(GameState.new(3, 3).set_value_at_column_and_row(2, 2, 1).row(2)).to eq([0, 0, 1])
  end
end