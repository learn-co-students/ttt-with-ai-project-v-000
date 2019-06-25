module Players
  class Computer < Player

    def move(board) #inherited from Player
      #takes in a board argument and allows a human player to enter a move via the CLI.
    if !board.taken?("1")
      "1"
    elsif !board.taken?("5")
      "5"
    elsif !board.taken?("3")
      "3"
    elsif !board.taken?("7")
      "7"
    elsif !board.taken?("2")
      "2"
    elsif !board.taken?("4")
      "4"
    elsif !board.taken?("9")
      "9"

      end
    end
  end
end
