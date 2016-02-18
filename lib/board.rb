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
   cells[p.to_i-1]
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
    move=move.to_i
    move-=1
    if move>=0
      if cells[move]=="X" || cells[move]=="O"
        false
      else
       true
      end
    else
     return false
    end
  end  

  def update(position, player)
   move=position.to_i
   move-=1
   cells[move] = player.token
   cells[move]
  end


end#end class


