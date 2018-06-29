require_relative "../player.rb"
class Computer < Player

  def move(board)
    comp_choice = nil
    if !board.taken?(5)
      comp_choice = "5"
    elsif board.turn_count == 1 || board.turn_count == 2
      comp_choice = [1, 3, 7, 9].find{|i| !board.taken?(i)}.to_s
    elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      comp_choice = "2"
    else
      comp_choice = (Random.rand(9) + 1).to_s

    end

  end

end
