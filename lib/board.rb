class Board
  
  attr_accessor
  
  @@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
  def reset!
    @@cells.clear
  end
  
  def initialize
    self.reset!
  
end