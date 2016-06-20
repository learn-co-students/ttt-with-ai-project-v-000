class Player::Computer < Player

  def move(board)
    if !board.taken?("5")
      "5"
    else
      ai_move(board)
    end
  end

  def ai_move(board)
    win_move(board) || block(board) || corner(board) || side(board)
  end

  def side(board)
    [2, 4, 6, 8].detect {|x| !board.taken?(x)}
  end

  def corner(board)
    [1, 3, 7, 9].detect {|x| !board.taken?(x)}
  end

  def block_test(board)
    Game::WIN_COMBINATIONS.detect do |test|
      cells = [
        board.cells[test[0]],
        board.cells[test[1]],
        board.cells[test[2]]
      ]
      cells.uniq.count == 2 && cells.include?(" ") && cells.count(other_token) == 2
    end
  end

  def block(board)
    block_test(board).detect {|x| board.cells[x] == " "} + 1 if !block_test(board).nil?
  end

  def win_test(board)
    Game::WIN_COMBINATIONS.detect do |test|
      cells = [
        board.cells[test[0]],
        board.cells[test[1]],
        board.cells[test[2]]
      ]
      cells.uniq.count == 2 && cells.include?(" ") && cells.count(self.token) == 2
    end
  end

  def win_move(board)
    win_test(board).detect {|x| board.cells[x] == " "} + 1 if !win_test(board).nil?
  end

  def other_token
    self.token == "X" ? "O" : "X"
  end

end


# class Computer < Player
#
#     # attr_accessor :move
#     #
#     #
#     # def initialize
#     #
#     # end
#
#     def move(board)
#          rand(board.cells.length).to_s
#         # player = current_player
#         # move = player.move(@board)
# #         pos = rand(1..9)
# # #         @board[pos.to_i-1] = rand(1..9)
# # # (board.cells.length).to_s
# # #    if
# #
# #         board.valid_move?(pos.to_i-1)
# #         #     turn
# #         # else
# #             @board.update(board) #, player)
# #             @board.display
#         # end
#         # return valid_position
#     end
#
# end
