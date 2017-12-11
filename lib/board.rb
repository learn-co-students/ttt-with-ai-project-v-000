class Board
attr_accessor :cells

cells = []

def initialize
  @cells = Array.new(9," ")
end

def reset!
  self.cells = Array.new(9," ")
end

def display

end

end
