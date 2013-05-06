require "my_lib"

class GameState
  def initialize(columns, rows)
    if columns < 1 || rows < 1
      raise ArgumentError
    end
    
    @matrix = Array.new(columns) { Array.new(rows, 0) }
  end
  
  def get_value_at_column_and_row(column, row)
    raise IndexError if out_of_bounds?(column, row)
    @matrix[column][row]
  end
  
  def set_value_at_column_and_row(column, row, value)
    raise IndexError if out_of_bounds?(column, row)
    @matrix[column][row] = value
  end
  
  def columns
    @matrix.length
  end
  
  def rows
    @matrix[0].length
  end
  
  def get_neighbors(column, row)
    result = []
    return result.length if out_of_bounds?(column, row)
    
    result << @matrix[column - 1][row - 1] unless out_of_bounds?(column - 1, row - 1)
    result << @matrix[column - 1][row] unless out_of_bounds?(column - 1, row)
    result << @matrix[column - 1][row + 1] unless out_of_bounds?(column - 1, row + 1)
    result << @matrix[column][row - 1] unless out_of_bounds?(column, row - 1)
    result << @matrix[column][row + 1] unless out_of_bounds?(column, row + 1)
    result << @matrix[column + 1][row - 1] unless out_of_bounds?(column + 1, row - 1)
    result << @matrix[column + 1][row] unless out_of_bounds?(column + 1, row)
    result << @matrix[column + 1][row + 1] unless out_of_bounds?(column + 1, row + 1)
    result.length
  end
  
  def out_of_bounds?(column, row)
    if column < 0 || column > (@matrix.length - 1)
      return true
    end
    row < 0 || row > (@matrix[0].length - 1)
  end
end
