
class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    board.full? || draw? || won?
  end

  def won?  ### fix###
    # WIN_COMBINATIONS.any? do |combo|
    #   combo.all? do |i|
    #     binding.pry
    #     board.cells[i] == "X" }
    #     binding.pry
    #   end
    # end
    WIN_COMBINATIONS.each do |combination|
      if combination.all? do |position|
        board.cells[position] == "O"
      end
      return combination
      elsif
        combination.all? do |position|
          board.cells[position] == "X"
        end
        return combination
      end
    end
    return false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[1]]
    end
  end

  def turn
    puts "Please enter 1-9"
    move = current_player.move(board)
    board.valid_move?(move) ? board.update(move, current_player) : self.turn
  end
  #   # p1_move = player_1.move(board)
  #   current_player.move(board) if !board.valid_move?(move)

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
