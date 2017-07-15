module Players
  class Computer < Player

    SPACES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    CORNERS = ["1", "3", "7", "9"]
    EDGES = ["2", "4", "6", "8"]
    CENTER = "5"
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

    def caddy_corner(x)
      return "9" if x == "1"
      return "1" if x == "9"
      return "7" if x == "3"
      return "3" if x == "7"
    end

    def caddy_corner?(x,y)
      caddy_corner(x) == y
    end

    def win_possibility?(board)
      #determines if either team has a win possibility and then provides location to move to. if not, returns falsey value
      ret_val=false
      WIN_COMBINATIONS.each do |combo| #go through each win combo and find if two out of three are the same character and the third is a blank space.
        cell_values = []
        combo.each do |space| #go through each space to see
          cell_values << board.cells[space]
        end
        #return the value of " " in the win_combo if it contains two of the same and one " "

        ret_val = combo[cell_values.index(" ")] if (cell_values.count{|value| value == "X"} == 2 || cell_values.count{|value| value == "O" } == 2) && cell_values.count{|value| value == " " } == 1
        if !(ret_val == false)
          binding.pry
          return ret_val+1.to_s
        end
      end

    end

    def corner_border(corner,board)
      #creates and returns a hash of how many Xs and Os border a corner
      bordered_by = {xs: 0, os: 0}
      spaces = []
      spaces = [2,4] if corner == "1"
      spaces = [2,6] if corner == "3"
      spaces = [4,8] if corner == "7"
      spaces = [6,8] if corner == "9"
      spaces.each do |cell|
        bordered_by["xs"]+=1 if board.cells[cell] == "X"
        bordered_by["os"]+=1 if board.cells[cell] == "O"
      end
      bordered_by
    end

    def win_possibility(board)
      #checks if there is a win possibility for either team then moves there
      return win_possibility?(board) if win_possibility?(board)
    end

    def move(board)
      puts "Computer's turn..."

      first_move = ""
      second_move = ""
      third_move = ""
      fourth_move = ""
      fifth_move = ""

      if self.token == "X"
        binding.pry
        return CORNERS.sample if board.turn_count == 0
        win_possibility(board) if board.turn_count >= 3 #After turn four, if there is a win possibility for either player, the current player should automatically play there.
        #THIRD TURN POSSIBILITIES:
        if board.turn_count == 2
          return caddy_corner(board.moves[0]) if board.moves.last == CENTER   #3 if O plays to the center on the second turn, play to the caddy corner of the first move
          return (CORNERS & board.available).sample if CORNERS.include?(board.moves.last) #3 if O plays to a corner, play to either of the open corners
          return CENTER if EDGES.include?(board.moves.last) #3 if O plays to an edge, play to the center square
        elsif board.turn_count == 4
          fifth_move = CORNERS&board.available if board.moves[1] == CENTER || CORNERS.include?(board.moves[1])  #5th turn if 2nd center: if O played to a corner square on 4th, play to the only available_corners   #FIFTH TURN POSSIBILITIES if 2nd turn Corner, play to the remaining corner
          if EDGES.include?(board.moves[1])         #FIFTH TURN POSSIBILITIES if 2nd turn edge, go to corner with no O adjacent to it
            CORNERS&board.available.each do |corner|
                fifth_move = corner if corner_border(corner,board)["os"] == 0
            end
          end

          return fifth_move
        end
      else
        #After turn four, if there is a win possibility for either player, the current player should automatically play there.
        win_possibility(board) if board.turn_count >= 4
        #if X plays to a non-center square, play to the center on second turn
          #if third move creates a win scenario for X, block and place where a win is possible
            #if X blocks:
              #if the fifth move creates a win scenario for X, block and place so that an O win is possible
            #if X does not block, place O to win
          #if third move does not threaten a win:
            #if X is on an edge AND a corner, place an O on the caddy_corner of the X corner move
            #if X is on 2 edges:
              #if both X border a corner, play O that corner, then play any square thereafter to draw/win
              #if X don't border a corner, play any remaining edge. then, O either corner square bordered by only one X.
            #if X is caddy_corner itself, place an O on any available edge
              #X and O will block and draw
        #if x plays to center on first turn, play to any corner
          #if X win is not possible, play to corner
      end
    end
  end
end
