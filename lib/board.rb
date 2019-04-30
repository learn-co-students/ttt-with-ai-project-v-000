class Board

attr_accessor :cells

def initialize
  reset!
end

def reset
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  
