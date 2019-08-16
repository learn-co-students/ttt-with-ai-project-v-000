class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],
    [6,7,8], [0,3,6],
    [1,4,7], [2,5,8],
    [0,4,8], [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.odd?
      player_2
    else
      player_1
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|

      if board.taken?(combo[0] + 1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
        return combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if combo = won?
      board.cells[combo[0]]
    end
  end

  def turn
    board.display
    input = current_player.move(board)
    if !board.valid_move?(input)
      puts "Your move was not valid, please try again."
      turn
    else
      board.update(input, current_player)
    end
    board.display
  end

  def play
    turn until over? || draw?
    if draw?
      puts "Cat's Game!"
    elsif over? && won?
      puts "Congratulations #{winner}!"
    end
  end

  def start(input)
    if input == "0"
      Game.new(player_1 = Players::Computer.new('X'), player_2 = Players::Computer.new('O'), board = Board.new).play
    elsif input == "1"
      puts "Would you like to go first? Yes or No"
      player = gets.strip
      if player == "Yes"
        Game.new(player_1 = Players::Human.new('X'), player_2 = Players::Computer.new('O'), board = Board.new).play
      elsif player == "No"
        Game.new(player_1 = Players::Computer.new('X'), player_2 = Players::Human.new('O'), board = Board.new).play
      end
    elsif input == "2"
      puts "Player X will always go first! Good luck."
      Game.new.play
    end
  end

end
