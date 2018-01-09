class Board

  attr_accessor :cells

  def initialize
    @cells =Array.new(9, " ")
  end

  def display_row(row)
    nStart = (row - 1)* 3
	  nEnd = nStart + 3
	  current = nStart
	  str = ""
	  while( current < nEnd )
	  	str += " " + @cells[current];
	  	current += 1
	  	( current < nEnd ) ? str += " |" : str += " "
    end
    puts str
  end

  def reset!
    @cells = Array.new(9, " ")
  end
  def display_row_divider
    puts "-----------"
  end

  def display
      self.display_row(1)
      self.display_row_divider
      self.display_row(2)
      self.display_row_divider
      self.display_row(3)
  end

  def position(strPos)
    nPos = strPos.to_i
  	@cells[nPos - 1]
  end

  def full?
  	!@cells.include?(" ")
  end

  def turn_count
  	@cells.count{ |x| x != " " }
  end

  def taken?(strPos)
  	nPos = strPos.to_i
  	self.position(strPos) == "X" || self.position(strPos) == "O"
  end

  def valid_move?(strPos)
	  nPos = strPos.to_i
	  if nPos > 0 && nPos < 10
	  	!self.taken?( strPos )
	  else
	  	false
	  end
  end

  def update( strPos, player )
  	nPos = strPos.to_i
  	if self.valid_move?( strPos )
	  	@cells[nPos - 1] = player.token
	  else
	  	false
	  end
  end
end ## end Class
