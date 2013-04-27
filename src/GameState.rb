
class GameState
  
  def initialize(columns, rows)
    if columns < 1 || rows < 1
      raise ArgumentError
    end
    
    #@columns, @rows = columns, rows
    @matrix = Array.new(columns)
    @matrix.each do |column|
      column = Array.new(rows)
    end
  end
  
  def getCell(column, row)
  end
  
  def setCell(column, row, value)
  end
  
  def columns
    @matrix.length
  end
  
  def rows
    @matrix[0].length
  end
end
