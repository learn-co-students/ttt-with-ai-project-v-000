module Players
  #Define a class `Players::Computer` that represents a computer player of Tic Tac Toe.
  class Computer < Player
    attr_accessor :x_ary, :o_ary

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    CORNERS = ["1","3","7","9"]
    SIDES = ["2","4","6","8"]
    MOVES = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]

    def move(board= nil)

     if self.token == "X"   #Token = "X"/ First player

        if board.turn_count == 0           #First move
            "1"
        elsif board.turn_count == 2
            if board.valid_move?("9")        #Second move (Perfect X)
              "9"
            else
              CORNERS.find {|corner| board.valid_move?(corner)}
            end

        elsif board.turn_count >= 3
          find_x_index(board)
          WIN_COMBINATIONS.each do |wc|
            if x_ary.include?(wc[0]) && x_ary.include?(wc[1]) && board[wc[2]] == " "
               "#{board[wc[2]]+1}"
            elsif x_ary.include?(wc[2]) && x_ary.include?(wc[1]) && board[wc[0]] == " "
               "#{board[wc[0]]+1}"
            elsif x_ary.include?(wc[0]) && x_ary.include?(wc[2]) && board[wc[1]] == " "
               "#{board[wc[1]]+1}"
            end
          end
        end
      end #if self.token == "X"

      if self.token == "O"                #Token = "O"/ Second player
        if board.valid_move?("5")        #First move
          "5"                               #Perfect "X"
        elsif  #elsif board.cells[4] == "X"        #Imperfect "X"
          CORNERS.find {|corner| board.valid_move?(corner)}
        else
          MOVES.find {|move| board.valid_move?(move)}
        end #if board.cells[4]/beginning of moves conditional
      end #if self.token == "O"
    end #def move

    def find_x_index(board= nil)
      self.x_ary = []
        board.cells.each_index do |e|
          if board.cells[e] == "X"
            x_ary << e.to_i
          else
          end
        end
    end

    def find_o_index(board= nil)
      self.o_ary = []
        board.cells.each_index do |e|
          if board.cells[e] == "O"
            o_ary << e.to_i
          else
          end
        end
    end
  end
end

#    def move(board= nil)
#     WIN_COMBINATIONS.find do |wc|
#        if (board.cells[wc[0]] == board.cells[wc[1]]) && (board.cells[wc[0]] != board.cells[wc[2]])
#          return "#{wc[2]}"
#        elsif (board.cells[wc[2]] == board.cells[wc[1]]) && (board.cells[wc[2]] != board.cells[wc[0]])
#          return "#{wc[0]}"
#        elsif (board.cells[wc[0]] == board.cells[wc[2]]) && (board.cells[wc[0]] != board.cells[wc[1]])
#          return "#{wc[1]}"
#        else
#          moves = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
#          moves.find do |move|
#            board.taken?(move) == false
#          end
#        end
#      end
#    end #move method
#  end #class Computer < Player
#end #module Players
