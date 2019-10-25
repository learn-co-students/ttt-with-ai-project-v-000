require 'pry'
class Board

attr_accessor :cells

def reset!
  @cells = Array.new(9, " ")
end

def initialize
 @cells = Array.new(9, " ")
end

def  display
  puts @cells
end


end
