class Board

attr_accessor :cells

  def initialize
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

end

def position(position)
    @cells[position.to_i-1]
end

def full?
@cells.all?{|cell| cell == "X" || cell == "O"}
end

def turn_count
  count = 0
  @cells.each{|cell| if(cell == "X" || cell == "O")
                      count += 1
                    end
                    }
                    count
end

def taken?(pos)
position(pos) == "X" || position(pos) == "O"
end

def valid_move?(pos)
  !taken?(pos) && pos.to_i.between?(1,9)
end

 def update(token,player)
  @cells[token.to_i-1] =  player.token
end
################################################
end
