module Players
  class Computer < Player

    def computer_options(board)
        move = ["7", "1", "9", "3", "4", "8", "6", "2", "5"]
        moves = move.find {|slot| !board.taken?(slot)}
        moves
    end

    def move(board)
        if
          board.valid_move?("7")
            "7"
        elsif
          options(board)
          options(board)
        elsif
          board.valid_move?("1")
            "1"
        elsif
          board.position("7") == self.token && board.position("1") == self.token && board.valid_move?("4")
            "4"
        elsif
          board.valid_move?("9")
            "9"

        elsif
          board.position("7") == self.token && board.position("9") == self.token && board.valid_move?("8")
            "8"
        elsif
          board.position("1") == self.token && board.position("9") == self.token && board.valid_move?("5")
            "5"
        elsif
          board.valid_move?("3")
            "3"
        elsif
          board.valid_move?("4")
            "4"
        elsif
          board.valid_move?("8")
            "8"
        elsif
          board.valid_move?("6")
            "6"
        elsif
          board.valid_move?("2")
            "2"
        elsif
          board.valid_move?("5")
            "5"
        else
            computer_options(board)
        end

    end

    def options(board)
      if
        board.position("1") == self.player_token && board.position("3") == self.player_token && board.valid_move?("2")
          "2"
      elsif
        board.position("4") == self.player_token && board.position("6") == self.player_token && board.valid_move?("5")
          "5"
      elsif
        board.position("7") == self.player_token && board.position("9") == self.player_token && board.valid_move?("8")
          "8"
      elsif
        board.position("1") == self.player_token && board.position("2") == self.player_token && board.valid_move?("3")
          "3"
      elsif
        board.position("4") == self.player_token && board.position("5") == self.player_token && board.valid_move?("6")
          "6"
      elsif
        board.position("7") == self.player_token && board.position("8") == self.player_token && board.valid_move?("9")
          "9"
      elsif
        board.position("2") == self.player_token && board.position("3") == self.player_token && board.valid_move?("1")
          "1"
      elsif
        board.position("5") == self.player_token && board.position("6") == self.player_token && board.valid_move?("4")
          "4"
      elsif
        board.position("8") == self.player_token && board.position("9") == self.player_token && board.valid_move?("7")
          "7"
      elsif
        board.position("1") == self.player_token && board.position("4") == self.player_token && board.valid_move?("7")
          "7"
      elsif
        board.position("1") == self.player_token && board.position("7") == self.player_token && board.valid_move?("4")
          "4"
      elsif
        board.position("4") == self.player_token && board.position("7") == self.player_token && board.valid_move?("1")
          "1"
      elsif
        board.position("2") == self.player_token && board.position("5") == self.player_token && board.valid_move?("8")
          "8"
      elsif
        board.position("5") == self.player_token && board.position("8") == self.player_token && board.valid_move?("2")
          "2"
      elsif
        board.position("2") == self.player_token && board.position("8") == self.player_token && board.valid_move?("5")
          "5"
      elsif
        board.position("3") == self.player_token && board.position("9") == self.player_token && board.valid_move?("6")
          "6"
      elsif
        board.position("3") == self.player_token && board.position("6") == self.player_token && board.valid_move?("9")
          "9"
      elsif
        board.position("6") == self.player_token && board.position("9") == self.player_token && board.valid_move?("3")
          "3"
      elsif
        board.position("1") == self.player_token && board.position("9") == self.player_token && board.valid_move?("5")
          "5"
      elsif
        board.position("1") == self.player_token && board.position("5") == self.player_token && board.valid_move?("9")
          "9"
      elsif
        board.position("5") == self.player_token && board.position("9") == self.player_token && board.valid_move?("1")
          "1"
      elsif
        board.position("3") == self.player_token && board.position("7") == self.player_token && board.valid_move?("5")
          "5"
      elsif
        board.position("3") == self.player_token && board.position("5") == self.player_token && board.valid_move?("7")
          "7"
      elsif
        board.position("5") == self.player_token && board.position("7") == self.player_token && board.valid_move?("3")
          "3"
      end
    end

    def player_token
        self.token == "X" ? "O" : "X"
    end
  end
end
