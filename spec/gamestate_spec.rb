# GameState spec

require "my_lib"

describe GameState, "#initialize" do
  it "Raises ArgumentError for zero columns and rows" do
    expect { gamestate = GameState.new(0, 0) }.to raise_error(ArgumentError)
  end
end

describe GameState, "#initialize" do
  it "Sets columns and rows correctly for valid columns and rows" do
    gamestate = GameState.new(15, 27)
    expect(gamestate.columns).to eq(15)
    expect(gamestate.rows).to eq(27)
  end
end

describe GameState, "#initialize" do
  it "Zeros all matrix values for valid columns and rows" do
    gamestate = GameState.new(34, 78)
    (0..9).each do |i|
      (0..19).each do |j|
        expect(gamestate.get_value_at_column_and_row(i, j)).to eq(0)
      end
    end
  end
end
