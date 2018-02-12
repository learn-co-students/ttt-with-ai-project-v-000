
module Players
  class Computer < Player

    def move(board)

      move = "nil"

      def enemy_token
        if self.token == "X"
          "O"
        else
          "X"
        end
      end

      # PICK CENTER IF YOU GO FIRST
      if !board.taken?(5) && board.turn_count == 0
        "5"

      # PICK CORNERS IF YOU GO SECOND.  EVEN IF CENTER IS OPEN.
      elsif board.turn_count == 1
        ["1", "3", "7", "9"].sample

      # TURN 3. CHECK IF OTHER CORNERS WERE TAKEN, AND PICK EMPTY CORNER not OPPOSITE COMPETITOR CORNER.
      elsif board.turn_count == 2 && (board.taken?(1) || board.taken?(9))
            [3, 7].sample
      elsif board.turn_count == 2 && (board.taken?(3) || board.taken?(7))
            [1, 9].sample

      # TURN 4 & BEYOND. CHECK POTENTIAL WIN COMBOS & BLOCK.
      elsif board.turn_count >= 3 && enemy_close(board)
          spot = enemy_close(board).find do |index|
            board.cells[index] == " "
          end
          (spot + 1).to_s

      # TURN 4 & BEYOND. IF NO POTENTIAL WIN COMBOS, FIND NEXT EMPTY CELL & GRAB IT.
      else
        spot = board.cells.find_index do |cell|
          cell == " "
        end
        (spot + 1).to_s
      end # LARGE IF, elsif, elsif, elsif, else conditional
    end # move method
  end  # Computer class
end # Players module


def enemy_close(board)
  ENEMY_WIN_COMBINATIONS.find do |combo|
    (board.cells[combo[0]] == enemy_token && board.cells[combo[1]] == enemy_token && board.cells[combo[2]] == " ") ||
    (board.cells[combo[0]] == enemy_token && board.cells[combo[2]] == enemy_token && board.cells[combo[1]] == " ") ||
    (board.cells[combo[1]] == enemy_token && board.cells[combo[2]] == enemy_token && board.cells[combo[0]] == " ")
  end
end


  ENEMY_WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Diagonal upper-left lower-right
  [2, 4, 6]  # Diagonal upper-right lower-left
  ]


  # RANDOM NUMBER GENERATOR.  DOES NOT CHECK IF CELL IS EMPTY!
  # ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
