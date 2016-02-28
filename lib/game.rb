require "./fixtures/bender.rb"
class Game
  attr_accessor :board, :player_1, :player_2
  include Bender
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  ###### state #####
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.position(combo[0] + 1) == board.position(combo[1] + 1) &&
      board.position(combo[1] + 1) == board.position(combo[2] + 1) &&
      board.taken?(combo[0] + 1) ### this +1 stuff seems wrong but
    end                          ### I tried the below and it didn't work...
  end
  # def won?
  #   WIN_COMBINATIONS.detect do |combo|
  #     board.position(combo[1]) == board.position(combo[2]) &&
  #     board.position(combo[2]) == board.position(combo[3]) &&
  #     board.taken?(combo[1])
  #   end
  # end

  def winner
    if combo = won?
      winner = board.position(combo.first + 1)
    end
    winner
  end

  def draw?
    !won? && board.cells.all?{|token| token == "X" || token == "O"}
  end

  def over?
    won? || draw?
  end
  #### manage ####
  def play
    while !over?
      turn
    end
    if won?  ################ put bender when a comp wins
          if player_1.class == Player::Computer && player_1.token == winner
            bender_ender
          elsif player_2.class == Player::Computer && player_2.token == winner
            bender_ender
          else
            puts "Congratulations #{winner}!"
            bender_ender
          end
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    board.display
    input = current_player.move(board)
    if !board.valid_move?(input)
      puts "Not A Valid Move"
      turn
    else
    board.update(input, current_player)
    end
  end
end
