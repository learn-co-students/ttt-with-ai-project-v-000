require_relative './node.rb'
require_relative './tree'
require 'pry'

# 'x' -> maximum   'o'  --> minimum
def get_empty_spaces(board)
    board.map.with_index{|el, i| el == " " ? i : nil}.compact
end

def get_active_player(board)
    board.count{|e| e != " "}.even? ? 'X' : 'O'
end
data = {board: Array.new(9,' '), turn:'X', score:nil }
# t = Tree.new(data)
# binding.pry

# puts "hello"
