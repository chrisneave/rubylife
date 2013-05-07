require "my_lib"

class GameState
  def initialize(columns, rows)
    if columns < 1 || rows < 1
      raise ArgumentError
    end
    
    @matrix = Array.new(rows) { Array.new(columns, 0) }
  end
  
  def get_value_at_column_and_row(column, row)
    raise IndexError if out_of_bounds?(column, row)
    @matrix[row][column]
  end
  
  def set_value_at_column_and_row(column, row, value)
    raise IndexError if out_of_bounds?(column, row)
    @matrix[row][column] = value
    return self
  end
  
  def columns
    @matrix[0].length
  end
  
  def rows
    @matrix.length
  end
  
  def get_neighbors(column, row)
    result = []
    return result if out_of_bounds?(column, row)
    
    result << @matrix[row - 1][column - 1] unless out_of_bounds?(column - 1, row - 1)
    result << @matrix[row][column - 1] unless out_of_bounds?(column - 1, row)
    result << @matrix[row + 1][column - 1] unless out_of_bounds?(column - 1, row + 1)
    result << @matrix[row - 1][column] unless out_of_bounds?(column, row - 1)
    result << @matrix[row + 1][column] unless out_of_bounds?(column, row + 1)
    result << @matrix[row - 1][column + 1] unless out_of_bounds?(column + 1, row - 1)
    result << @matrix[row][column + 1] unless out_of_bounds?(column + 1, row)
    result << @matrix[row + 1][column + 1] unless out_of_bounds?(column + 1, row + 1)
    result
  end
  
  def out_of_bounds?(column, row)
    if column < 0 || column > (@matrix.length - 1)
      return true
    end
    row < 0 || row > (@matrix[0].length - 1)
  end
  
  def row(index)
    raise IndexError if out_of_bounds?(0, index)
    @matrix[index]
  end
  
  def [](index)
    self.row(index)
  end
end
