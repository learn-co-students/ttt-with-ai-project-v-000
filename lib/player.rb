class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

=begin
class Human < Player
  def move(board=[])
    input = gets.strip
    input
  end
end

class Computer < Player
  def move(board)

    #board_chk = board.turn_count

    case board_chk = board.turn_count
    when board_chk === 0
      if board.cells[4] == " "
        "5"
      end
    when board_chk === 1
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] === " "
        "1"
      elsif board.cells[2] === " "
        "3"
      elsif board.cells[6] === " "
        "7"
      elsif board.cells[8] === " "
        "9"
      end
    end
  end
end
=end
