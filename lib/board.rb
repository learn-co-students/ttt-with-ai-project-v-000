require 'pry'
class Board

attr_accessor :cells

def reset!
  #cells = Array.new(9, " ")
#  binding.pry
end

def initialize
 cells = Array.new(9, " ").to_a
end



end
