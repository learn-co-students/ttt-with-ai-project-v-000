class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end 
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end 
  
  def position(player_choice)
    self.cells[player_choice.to_i - 1]
  end
  
  def full? # Note: I included a few edge cases here
    self.cells.all?{|cell| self.has_token?(cell)}
  end
  
  def turn_count
    self.cells.count{|cell| self.has_token?(cell)}
  end
  
  def taken?(player_choice)
    self.has_token?(position(player_choice)) 
  end
  
  def has_token?(cell)
    !cell.nil? && cell != "" && cell != " "
  end
  
  def valid_move?(player_choice)
    player_choice.to_i.between?(1,9) && !self.taken?(player_choice)
  end
  
  def update(player_choice, player)
    self.cells[player_choice.to_i - 1] = player.token
    # self.position(player_choice) = player.token # Not sure why that doesn't work.
    # Maybe it only returns a COPY of #position's value, not a REFERENCE to it!
  end
end