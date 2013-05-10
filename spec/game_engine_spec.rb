# GameEngine spec

require "my_lib"

describe GameEngine, "#cell_lives?" do
  it "Live cell dies if it is has less than two neighbors" do
    # Arrange
    # Act
    # Assert
    expect(GameEngine.cell_lives?(1, 0)).to eq(0)
    expect(GameEngine.cell_lives?(1, 1)).to eq(0)
  end
  
  it "Dead cel stays dead if it has less than three neighbors" do
    # Arrange
    # Act
    # Assert
    expect(GameEngine.cell_lives?(0, 0)).to eq(0)
    expect(GameEngine.cell_lives?(0, 1)).to eq(0)
    expect(GameEngine.cell_lives?(0, 2)).to eq(0)
  end
  
  it "Live cell lives if it has two or three neighbors" do
    # Arrange
    # Act
    # Assert
    expect(GameEngine.cell_lives?(1, 2)).to eq(1)
    expect(GameEngine.cell_lives?(1, 3)).to eq(1)
  end

  it "Live cell dies if it has more than three neighbors" do
    # Arrange
    # Act
    # Assert
    (4..9).each { |num| expect(GameEngine.cell_lives?(1, num)).to eq(0) }
    (4..9).each { |num| expect(GameEngine.cell_lives?(0, num)).to eq(0) }
  end

  it "Dead cell lives if it has exactly three neighbors" do
    # Arrange
    # Act
    # Assert
    expect(GameEngine.cell_lives?(0, 3)).to eq(1)
  end
end

describe GameEngine, "#get_next_generation" do
  it "Throws ArgumentError if not a GameState object" do
    expect { GameEngine.get_next_generation("a string") }.to raise_error(ArgumentError)
  end
  
  it "Returns a new GameState object for a valid input state" do
    # Arrange
    gs = GameState.new(3, 3)
    gs.set_value_at_column_and_row(1, 1, :living_cell)

    # Act
    # Assert
    expect(GameEngine.get_next_generation(gs)).to be_a(GameState)
  end
  
  it "Returns the next valid state" do
    # Arrange
    start = GameState.new(3, 3)
    start[1][0] = 1
    start[1][1] = 1
    start[1][2] = 1
    
    finish = GameState.new(3, 3)
    finish[0][1] = 1
    finish[1][1] = 1
    finish[2][1] = 1

    # Act
    expect(GameEngine.get_next_generation(start)).to eq(finish)
  end
end

describe GameEngine, "#get_random_generation" do
  it "Returns a new generation" do
    expect(GameEngine.get_random_generation(10, 10)).to be_a(GameState)
  end

  it "Raises ArgumentError for a negative index values" do
    expect {GameEngine.get_random_generation(-1, 1)}.to raise_error(ArgumentError)
    expect {GameEngine.get_random_generation(1, -1)}.to raise_error(ArgumentError)
  end

  it "Returns a different GameState over 5 consecutive calls (to assert randomness)" do
    game_state = nil
    (0..5).each do
      new_game_state = GameEngine.get_random_generation(10, 10)
      expect(new_game_state).to_not eq(game_state) if game_state
      game_state = new_game_state
    end
  end
end
