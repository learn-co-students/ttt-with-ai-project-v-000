require_relative '../player.rb'
require 'pry'

module Players
  class Computer < Player
    def move(board)
      choice = (rand*9).ceil
      puts "The computer (#{self.token}) has moved in spot #{choice}"
      "#{(rand*9).ceil}"
    end

    def winning_move(board)
      
  end
end

win_combos = {a => [0,1,2], b => [3,4,5], c => [6,7,8], d => [0,3,6], e => [1,4,7], f => [2,5,8], g => [0,4,8], h => [2,4,6]}

forks = {0 => [[a,d], [d,g], [a,g]], 1 => [a,e], 2 => [[a,f], [a,h], [f,h]], 3 => [d,b], 4 => [b,e], 5 => [f,b], 6 => [[d,c], [c,h], [d,h]], 7 => [c,e], 8 => [[c,f], [f,g], [c,g]]}

#                 D   E   F            G             H
#             A | 0 | 1 | 2 | A         | 0 | 1 | 2 |
#               -------------           -------------
#             B | 3 | 4 | 5 | B         | 3 | 4 | 5 |
#               -------------           -------------
#             C | 6 | 7 | 8 | C         | 6 | 7 | 8 |
#                 D   E   F            H             G

# 1. check all WIN_CONDITIONS - if any win condition has two of my token, play in the empty spot.
# 2. check all WIN_CONDITIONS - if any win condition has two of the opponent token, play in the empty spot.
# 3. if both legs of any FORK have no characters of my opponent's token AND each leg of the fork has one character of my token NOT in the crook, play in the fork's crook
# 4. if both legs of any FORK have no characters of my token, AND each leg of the fork has one or more characters of my opponent's token,
# 4a. check if any WIN_CONDITIONS has one of my token and none of the opponent's token, and play in an open space in that WIN_CONDITION
# 4b. Play in the crook of the fork, OR that spot is taken, play in any open space in either leg of the fork
# 5. Play in the center
# 6. if my opponent's token is in a corner and the opposite corner is open, play in the opposite corner
# 7. play in any open corner
# 8. play in the middle square of any side

# forks = {crook: [array of forks from that crook, each item is an index to a line in the fork]}

# RAW FORKS
# T forks (4)
# {1 => [a,e], 5 => [f,b], 7 => [c,e], 3 => [d,b]}
# L forks (4)
# {0 => [a,d], 2 => [a,f], 8 => [c,f], 6 => [d,c]}
# + fork (1)
# {4 => [b,e]}
# 7 forks (8)
# {0 => [[d,g], [a,g]], 2 => [[a,h], [f,h]], 8 => [[f,g], [c,g]], 6 => [[c,h], [d,h]]}
