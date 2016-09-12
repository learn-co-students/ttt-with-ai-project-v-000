module Players
  class Computer < Player
    attr_accessor :token

    def move(board)

      if board.valid_move?("7")
        "7"
      elsif !board.valid_move?("7") && board.valid_move?("3")
        "3"
      elsif !board.valid_move?("7") && !board.valid_move?("3") && board.valid_move?("1")
        "1"
      elsif !board.valid_move?("7") && !board.valid_move?("3") && !board.valid_move?("1") && board.valid_move?("9")
        "9"
      elsif !board.valid_move?("1") && !board.valid_move?("2") && board.valid_move?("3")
        "3"
      elsif !board.valid_move?("1") && !board.valid_move?("3") && board.valid_move?("2")
        "2"
      elsif !board.valid_move?("2") && !board.valid_move?("3") && board.valid_move?("1")
        "1"
      elsif !board.valid_move?("1") && !board.valid_move?("4") && board.valid_move?("7")
        "7"
      elsif !board.valid_move?("1") && !board.valid_move?("7") && board.valid_move?("4")
        "4"
      elsif !board.valid_move?("1") && !board.valid_move?("9") && board.valid_move?("5")
        "5"
      elsif !board.valid_move?("5") && !board.valid_move?("9") && board.valid_move?("1")
        "1"
      elsif !board.valid_move?("1") && !board.valid_move?("5") && board.valid_move?("9")
        "9"
      elsif !board.valid_move?("2") && !board.valid_move?("5") && board.valid_move?("8")
        "8"
      elsif !board.valid_move?("2") && !board.valid_move?("8") && board.valid_move?("5")
        "5"
      elsif !board.valid_move?("5") && !board.valid_move?("8") && board.valid_move?("2")
        "2"
      elsif !board.valid_move?("3") && !board.valid_move?("6") && board.valid_move?("9")
        "9"
      elsif !board.valid_move?("6") && !board.valid_move?("9") && board.valid_move?("3")
        "3"
      elsif !board.valid_move?("3") && !board.valid_move?("9") && board.valid_move?("6")
        "6"
      elsif !board.valid_move?("3") && !board.valid_move?("5") && board.valid_move?("7")
        "7"
      elsif !board.valid_move?("5") && !board.valid_move?("7") && board.valid_move?("3")
        "3"
      elsif !board.valid_move?("3") && !board.valid_move?("7") && board.valid_move?("5")
        "5"
      elsif !board.valid_move?("4") && !board.valid_move?("6") && board.valid_move?("5")
        "5"
      elsif !board.valid_move?("5") && !board.valid_move?("6") && board.valid_move?("4")
        "4"
      elsif !board.valid_move?("4") && !board.valid_move?("5") && board.valid_move?("6")
        "6"
      elsif !board.valid_move?("7") && !board.valid_move?("8") && board.valid_move?("9")
        "9"
      elsif !board.valid_move?("7") && !board.valid_move?("9") && board.valid_move?("8")
        "8"
      elsif !board.valid_move?("8") && !board.valid_move?("9") && board.valid_move?("7")
        "7"
      else
        (rand(9) - 1).to_s
    end
  end

end
end
