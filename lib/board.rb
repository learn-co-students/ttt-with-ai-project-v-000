class Board
    attr_accessor :cells, :token
  
  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ',' ', ' ',' ']
  end
  
  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ',' ', ' ',' ']
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]}  \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    pos = input.to_i 
    pos -= 1
    @cells[pos]
  end  
  
  def full?
    if @cells.find { |i| i == ' '}
      false
    else
      true
    end 
  end  
  
  def turn_count
    count = 0
    @cells.each do |cell|
    if cell == 'X' || cell == 'O'
      count+=1 
    end
  end
    count
  end
  
  
  def taken?(input)
    if position(input) == ' ' #|| position(input) == ''
      false
    else 
      true
    end  
  end
  
  def valid_move?(pos)
    pos = pos.to_i
    if pos > 0 && pos < 10 && !taken?(pos)
      true
    else 
      false
    end
  end 
  
  def update(move, player)
   if valid_move?(move)
     move = move.to_i
    # binding.pry
     @cells[move - 1] = "#{player.token}"
    end  
  end
    

end