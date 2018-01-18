require 'pry'
module Players

  class Human < Player

    def move(board)
      move = gets
    end

  end

  class Computer < Player
    WIN = [[0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[6,4,2]
    ]

    def move(board)
      if self.token == "O"
        opp = "X"
      elsif self.token == "X"
        opp = "O"
      end

      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]
      edges = ["2", "4", "6", "8"]

      #player_2_moves
      if board.turn_count == 0 && board.valid_move?(5) #go in the center if player 1
        moves.delete("5")
        "5"
      elsif board.turn_count == 1 && board.position(5) == opp #if center is taken play a corner (player 2)
        moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
        corners.delete_if {|m| board.position(m) == token || board.position(m) == token}
        move = corners.sample
      elsif board.turn_count == 1 && board.valid_move?(5) #if center is open play center (player 2)
        "5"
      elsif board.turn_count == 2

          if board.position(1) == opp && board.valid_move?(9)
            return "9"
          elsif board.position(3) == opp && board.valid_move?(7)
            return "7"
          elsif board.position(7) == opp && board.valid_move?(3)
            return "3"
          elsif board.position(9) == opp && board.valid_move?(1)
            return "1"
          elsif board.position(2) == opp &&
            move = ["7", "9"].sample
            return move if board.valid_move?(move)
          elsif board.position(4) == opp
            move = ["3", "9"].sample
            return move if board.valid_move?(move)
          elsif board.position(6) == opp
            move = ["1", "7"].sample
            return move if board.valid_move?(move)
          elsif board.position(8) == opp
            move = ["1", "3"].sample
            return move if board.valid_move?(move)
          end

      elsif board.turn_count == 3 && self.token == "O"#check for blocks first

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if board.position(2) == opp && board.position(6) == opp && board.valid_move?("3")    #edge block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "3"
          elsif board.position(2) == opp && board.position(4) == opp && board.valid_move?("1") #edge block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "1"
          elsif board.position(4) == opp && board.position(8) == opp && board.valid_move?("7") #edge block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "7"
          elsif board.position(6) == opp && board.position(8) == opp && board.valid_move?("9")  #edge block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "9"
          elsif p_1 == opp && p_2 == opp && board.valid_move?((w_3 + 1).to_s)                 #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st 2 win combos are opp play 3rd
          elsif p_1 == opp && p_3 == opp && board.valid_move?((w_2 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos are opp play 2nd
          elsif p_2 == opp && p_3 == opp && board.valid_move?((w_1 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos are opp play 1st
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if board.position(4) == opp && board.position(3) == opp && board.valid_move?("2")
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "2"
          elsif board.position(6) == opp && board.position(1) == opp && board.valid_move?("2")
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "2"
          elsif board.position(4) == opp && board.position(9) == opp && board.valid_move?("8")
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "8"
          elsif board.position(6) == opp && board.position(7) == opp && board.valid_move?("8")
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return "8"
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == self.token && p_2 == self.token && board.valid_move?((w_3 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st and 2nd win combos self self play 3rd
          elsif p_1 == self.token && p_3 == self.token && board.valid_move?((w_2 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos self self play 2nd
          elsif p_2 == self.token && p_3 == self.token && board.valid_move?((w_1 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos self self play 1st
          elsif p_1 == opp && p_2 == self.token && board.valid_move?((w_3 + 1).to_s)            #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st opp and 2nd self play 3rd
          elsif p_3 == opp && p_2 == self.token && board.valid_move?((w_1 + 1).to_s)          #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 1st opp and 2nd self play 3rd
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_2 == self.token && p_3 == opp                               #inline
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return edges.sample #if 1st and 3rd win combos opp and 2nd self play an edge
          elsif p_1 == self.token && p_2 == opp && p_3 == opp                               #inline
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return corners.sample ||  edges.sample #if 1st win combo self and 2nd and 3rd opp play corner or egde
          elsif p_1 == opp && p_2 == opp && p_3 == self.token                               #inline
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return corners.sample ||  edges.sample #if 1st and 2nd opp and 3rd self play corner or edge
          end #small if
        end #detect

      elsif board.turn_count >= 4 && self.token == "X"

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == self.token && p_2 == self.token && board.valid_move?((w_3 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st and 2nd win combos self self play 3rd
          elsif p_1 == self.token && p_3 == self.token && board.valid_move?((w_2 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos self self play 2nd
          elsif p_2 == self.token && p_3 == self.token && board.valid_move?((w_1 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos self self play 1st
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_2 == opp && board.valid_move?((w_3 + 1).to_s)                 #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st 2 win combos are opp play 3rd
          elsif p_1 == opp && p_3 == opp && board.valid_move?((w_2 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos are opp play 2nd
          elsif p_2 == opp && p_3 == opp && board.valid_move?((w_1 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos are opp play 1st
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_2 == self.token && board.valid_move?((w_3 + 1).to_s)            #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st opp and 2nd self play 3rd
          elsif p_3 == opp && p_2 == self.token && board.valid_move?((w_1 + 1).to_s)          #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 1st opp and 2nd self play 3rd
          end #small if
        end #detect

      elsif board.turn_count >= 5 && self.token == "O"

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == self.token && p_2 == self.token && board.valid_move?((w_3 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st and 2nd win combos self self play 3rd
          elsif p_1 == self.token && p_3 == self.token && board.valid_move?((w_2 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos self self play 2nd
          elsif p_2 == self.token && p_3 == self.token && board.valid_move?((w_1 + 1).to_s) #win
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos self self play 1st
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_2 == opp && board.valid_move?((w_3 + 1).to_s)                 #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st 2 win combos are opp play 3rd
          elsif p_1 == opp && p_3 == opp && board.valid_move?((w_2 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st and 3rd win combos are opp play 2nd
          elsif p_2 == opp && p_3 == opp && board.valid_move?((w_1 + 1).to_s)               #block
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 2nd and 3rd win combos are opp play 1st
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_2 == self.token && board.valid_move?((w_3 + 1).to_s)            #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_3 + 1).to_s #if 1st opp and 2nd self play 3rd
          elsif p_3 == opp && p_2 == self.token && board.valid_move?((w_1 + 1).to_s)          #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_1 + 1).to_s #if 1st opp and 2nd self play 3rd
          end #small if
        end #detect

        WIN.detect do |combo|
          w_1 = combo[0]
          w_2 = combo[1]
          w_3 = combo[2]

          p_1 = board.cells[w_1]
          p_2 = board.cells[w_2]
          p_3 = board.cells[w_3]

          if p_1 == opp && p_3 == self.token && board.valid_move?((w_2 + 1).to_s)            #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 1st opp and 3rd self play 2nd
          elsif p_3 == opp && p_1 == self.token && board.valid_move?((w_2 + 1).to_s)          #edge case
            moves.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            corners.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            edges.delete_if {|m| board.position(m) == opp || board.position(m) == token}
            return (w_2 + 1).to_s #if 3rd opp and 1st self play 2nd
          end #small if
        end #detect

      end #biggest if

    end #method

  end #class

end #module
