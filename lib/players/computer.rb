require_relative "../player.rb"
class Computer < Player

  def move(board)


    comp_choice = Random.rand(9) + 1

    while !board.valid_move?(comp_choice)
      comp_choice = Random.rand(9) + 1
    end

    comp_choice.to_s

  end

end
