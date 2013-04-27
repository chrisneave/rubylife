
class GameState
  
  def initialize(columns, rows)
    @columns, @rows = columns, rows
    @matrix = new Array(columns)
    @matrix.each do |column|
      column = new Array(rows)
    end
  end
  
  def getCell(column, row)
  end
  
  def setCell(column, row, value)
  end
  
end
