require "pry"

module Players
  class Computer < Player
    attr_accessor :difficulty

    def move(board)
      case difficulty
      when "easy"
        random(board)
      when "moderate"
        block(board)
      when "hard"
        hard(board)
      else
        random(board)
      end
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

    CORNERS = [0, 2, 6, 8].freeze
    CENTER = 4
    EDGES = [1, 3, 5, 7].freeze

    def corner(board)
      CORNERS.detect { |c| !board.taken?(c + 1) }
    end

    #   0 |  1  |  2
    # ---------------
    #   3 |  4  |  5
    # ---------------
    #   6 |  7  |  8

    def edge(board)
      EDGES.detect { |e| !board.taken?(e + 1) }
    end

    def random(board)
      m = Random.new.rand(1..9).to_s
      random(board) unless board.valid_move?(m)
      m
    end

    def hard(board)
      if board.turn_count == 0
        corner
      elsif board.turn_count == 1 && !board.taken?(CENTER)
        corner
      else
        random(board)
      end
    end

    def block(board)
      next_move = random(board)
      WIN_COMBINATIONS.each do |c|
        hold = [board.cells[c[0]], board.cells[c[1]], board.cells[c[2]]]
        if hold.count(" ") == 1 && hold.count("X") == 2
          next_move = (1 + c[hold.index(" ")]).to_s
        end
      end
      next_move
    end
  end
end

# AI Strategy
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
