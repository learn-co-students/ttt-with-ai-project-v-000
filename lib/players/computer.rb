module Players
  # Inherits from Player.
  class Computer < Player

    # WIN_COMBINATIONS = [
      # [0,1,2], (1,2,3)
      # [3,4,5], (4,5,6)
      # [6,7,8], (7,8,9)
      # [0,3,6], (1,4,7)
      # [1,4,7], (2,5,8)
      # [2,5,8], (3,6,9)
      # [0,4,8], (1,5,9)
      # [2,4,6] (3,5,7)
    # ]

    # Returns a valid position for the computer to move.
    def move(board)
      puts "The computer player makes it's move."
      move = nil # Placeholder

      # Computer player will always take cell 5 if available.
      if !board.taken?(5)
        move = "5"

      # Ensures that the computer player will make a winning move if possible.
      # Also ensures that the computer player will block the opposing player from making
      # a game winning move.
      elsif board.position("1") == "X" && board.position("2") == "X" && !board.taken?("3")
        move = "3"
      elsif board.position("2") == "X" && board.position("3") == "X" && !board.taken?("1")
        move = "1"
      elsif board.position("3") == "X" && board.position("1") == "X" && !board.taken?("2")
        move = "2"
      elsif board.position("4") == "X" && board.position("5") == "X" && !board.taken?("6")
        move = "6"
      elsif board.position("5") == "X" && board.position("6") == "X" && !board.taken?("4")
        move = "4"
      elsif board.position("6") == "X" && board.position("4") == "X" && !board.taken?("5")
        move = "5"
      elsif board.position("7") == "X" && board.position("8") == "X" && !board.taken?("9")
        move = "9"
      elsif board.position("8") == "X" && board.position("9") == "X" && !board.taken?("7")
        move = "7"
      elsif board.position("9") == "X" && board.position("7") == "X" && !board.taken?("8")
        move = "8"
      elsif board.position("1") == "X" && board.position("4") == "X" && !board.taken?("7")
        move = "7"
      elsif board.position("4") == "X" && board.position("7") == "X" && !board.taken?("1")
        move = "1"
      elsif board.position("7") == "X" && board.position("1") == "X" && !board.taken?("4")
        move = "4"
      elsif board.position("2") == "X" && board.position("5") == "X" && !board.taken?("8")
        move = "8"
      elsif board.position("5") == "X" && board.position("8") == "X" && !board.taken?("2")
        move = "2"
      elsif board.position("8") == "X" && board.position("2") == "X" && !board.taken?("5")
        move = "5"
      elsif board.position("3") == "X" && board.position("6") == "X" && !board.taken?("9")
        move = "9"
      elsif board.position("6") == "X" && board.position("9") == "X" && !board.taken?("3")
        move = "3"
      elsif board.position("9") == "X" && board.position("3") == "X" && !board.taken?("6")
        move = "6"
      elsif board.position("1") == "X" && board.position("5") == "X" && !board.taken?("9")
        move = "9"
      elsif board.position("5") == "X" && board.position("9") == "X" && !board.taken?("1")
        move = "1"
      elsif board.position("9") == "X" && board.position("1") == "X" && !board.taken?("5")
        move = "5"
      elsif board.position("3") == "X" && board.position("5") == "X" && !board.taken?("7")
        move = "7"
      elsif board.position("5") == "X" && board.position("7") == "X" && !board.taken?("3")
        move = "3"
      elsif board.position("7") == "X" && board.position("3") == "X" && !board.taken?("5")
        move = "5"

      elsif board.position("1") == "O" && board.position("2") == "O" && !board.taken?("3")
        move = "3"
      elsif board.position("2") == "O" && board.position("3") == "O" && !board.taken?("1")
        move = "1"
      elsif board.position("3") == "O" && board.position("1") == "O" && !board.taken?("2")
        move = "2"
      elsif board.position("4") == "O" && board.position("5") == "O" && !board.taken?("6")
        move = "6"
      elsif board.position("5") == "O" && board.position("6") == "O" && !board.taken?("4")
        move = "4"
      elsif board.position("6") == "O" && board.position("4") == "O" && !board.taken?("5")
        move = "5"
      elsif board.position("7") == "O" && board.position("8") == "O" && !board.taken?("9")
        move = "9"
      elsif board.position("8") == "O" && board.position("9") == "O" && !board.taken?("7")
        move = "7"
      elsif board.position("9") == "O" && board.position("7") == "O" && !board.taken?("8")
        move = "8"
      elsif board.position("1") == "O" && board.position("4") == "O" && !board.taken?("7")
        move = "7"
      elsif board.position("4") == "O" && board.position("7") == "O" && !board.taken?("1")
        move = "1"
      elsif board.position("7") == "O" && board.position("1") == "O" && !board.taken?("4")
        move = "4"
      elsif board.position("2") == "O" && board.position("5") == "O" && !board.taken?("8")
        move = "8"
      elsif board.position("5") == "O" && board.position("8") == "O" && !board.taken?("2")
        move = "2"
      elsif board.position("8") == "O" && board.position("2") == "O" && !board.taken?("5")
        move = "5"
      elsif board.position("3") == "O" && board.position("6") == "O" && !board.taken?("9")
        move = "9"
      elsif board.position("6") == "O" && board.position("9") == "O" && !board.taken?("3")
        move = "3"
      elsif board.position("9") == "O" && board.position("3") == "O" && !board.taken?("6")
        move = "6"
      elsif board.position("1") == "O" && board.position("5") == "O" && !board.taken?("9")
        move = "9"
      elsif board.position("5") == "O" && board.position("9") == "O" && !board.taken?("1")
        move = "1"
      elsif board.position("9") == "O" && board.position("1") == "O" && !board.taken?("5")
        move = "5"
      elsif board.position("3") == "O" && board.position("5") == "O" && !board.taken?("7")
        move = "7"
      elsif board.position("5") == "O" && board.position("7") == "O" && !board.taken?("3")
        move = "3"
      elsif board.position("7") == "O" && board.position("3") == "O" && !board.taken?("5")
        move = "5"

      elsif board.turn_count.even? && board.turn_count < 4
        move = ["1", "3", "5"].detect {|cell| board.valid_move?(cell)}
      elsif board.turn_count.odd? && board.turn_count < 5
        move = ["5", "1", "3", "7", "9"].detect {|cell| board.valid_move?(cell)}
      else
        move = ["2", "4", "6", "7", "8", "9"].sample
      end

    end

  end

end
