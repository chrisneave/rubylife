
class GameState
  
  def initialize(columns, rows)
    if columns < 1 || rows < 1
      raise ArgumentError
    end
    
    @matrix = Array.new()
    (1..columns).each {|column| @matrix << Array.new(rows)}
  end
  
  def getCell(column, row)
    @matrix[column][row]
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
