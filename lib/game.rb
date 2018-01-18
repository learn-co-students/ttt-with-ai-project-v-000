class Game
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6],

]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'),
            player_2 = Players::Human.new('O'),
            board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all? { |index| board.cells[index] == 'X' } || combination.all? { |index| board.cells[index] == 'O' }
    end
  end

  def over?
    board.full? || won?
  end

  def draw?
    board.full? && !won?
  end


  def winner
    winning_combination = won?
    if !winning_combination
      return nil
    end
    first_winning_index = winning_combination[0]
    board.cells[first_winning_index]
  end

  def turn
    index = nil
    loop do
      index = current_player.move(board)
      if board.valid_move?(index)
        break
      end
    end

    board.update(index, current_player)
  end

  def play
    until over? || draw? ## draw added to pass test
      board.display
       turn
    end

    if won?
      puts "Congratulations #{winner}!"

    else
      puts "Cat\'s Game!"
    end
  end

  def first_player
    first_player = nil
    loop do
      puts "Who goes first: "
      first_player = gets.strip.upcase
      break if first_player == 'X' || first_player == 'O'
    end

    if player_1.token != first_player
      @player_2, @player_1 = player_1, player_2   #multiple assignment
    end
  end


end
