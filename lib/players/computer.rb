require "pry"

module Players
  class Computer < Player
    attr_accessor :board

    #purely random AI, does not check if moves are valid
    # def move(board)
    #   r = rand(1..9)
    #   "#{r}"
    #   end

  #not purely random AI, but heavily weighted toward the first computer player in wargames, and beatable
  #by a human player
  def move(board)
    if board.turn_count < 2
      if board.cells[4] == " "
        "5"
      else board.cells[0] == " "
        "1"
      end
    elsif board.turn_count >= 2
      a = ai_win(board).to_i
      b = a+1
      b
    end
  end

  def ai_win(board)
    moves = []
    Game::WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          moves << combo[2]
          break
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          moves << combo[0]
          break
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          moves << combo[1]
          break
        end
      end

      if moves == []
        return "#{rand(1..9)}"
      else
        return "#{moves[0]}"
     end
    end
end
end
