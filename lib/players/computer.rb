module Players
  class Computer < Player
    def move(board)
      (1 + board.cells.find_index { |c| c == " " }).to_s
    end

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    # Blocking
    # Iterate through board
    # Check if opposing player has 2 of 3 of winning combo
    # Computer should take the 3rd position to block the player
    # def block
    #   WIN_COMBINATIONS.detect do |c|
    #
    #   end
    # end
  end
end

# Define: corners, center, edges
# CORNERS = [0, 2, 6, 8].freeze
# CENTER = 4
# EDGES = [1, 3, 5, 7].freeze

# AI Strategy
# Blocking
#
# If playing first, choose a corner
# If human chooses center, play corner opposite from first move (diagonal => X-O-X)
# If human responds with a corner, choose last remaining corner
#
# If playing second and if human does not play the center,
# play corner, then play another corner with space inbetween (don't straddle O)
# 3rd move, play so you have 2 possible winning options
#
# If playing second and human plays corner
# Always play center
# Second move play an edge if don't need to block
