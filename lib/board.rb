require_relative 'player.rb'

class Board
  attr_accessor :cells  
  def initialize
    reset!
  end

  def reset!
    @cells=Array.new(9, " ")
  end

  def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(p)
    p.to_i-1
    @cells[p.to_i-1]
  end

  def full?
    cells.all? do |c|
      c=="X" || c=="O"
    end
  end

  def turn_count
    count=0
    cells.each do |c|
      if c=="X" || c=="O"
        count+=1
      end
    end
    count
  end

  def taken?(position)
    p=position.to_i-1
    if cells[p]=="X" || cells[p]=="O"
        true
    else
        false
    end
  end
  
  def valid_move?(move)
    if move==" "
      return true
    end

    move=move.to_i
     
    move-=1

    if (move>=0 && move <=9) 
      if taken?(move+1)
        false
      else
        true
      end
    else
     false
   end
  end  

  def update(p, player)
   move=p.to_i-1
   cells[move] = player.token
   cells[move]
  end


end#end class
# b=Board.new
# b.cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
# puts b.valid_move?("5")
