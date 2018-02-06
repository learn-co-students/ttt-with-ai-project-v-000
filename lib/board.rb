class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def display_reference
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end
  
  def full?
    (@cells & [" ","",nil]).empty?
  end
  
  def position(usr_input)
    @cells[usr_input.to_i-1]
  end
  
  def positions(token)
    @cells.collect.with_index{|tok,i| i if tok==token}.compact
  end
  
  def taken?(usr_input)
    ["X","O"].include?(position(usr_input))
  end
  
  def turn_count
    @cells.count{|c| ["X","O"].include?(c)}
  end
  
  def update(usr_input, player)
    @cells[usr_input.to_i-1] = player.token
  end
  
  def valid_move?(usr_input)
    usr_input.to_i.between?(1,9) && !taken?(usr_input)
  end
  
  def reset!
    @cells = [" "]*9
  end
  
end