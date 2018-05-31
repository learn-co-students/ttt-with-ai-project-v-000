class Game
    attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

def call
  puts "Welcome to Vane's Tic-Tac_toe!!!"
  puts 'Do you want to play 1. Player vs Player 2. Player vs Computer or 3. Computer vs Computer'
  # puts 'Please enter game.new(player, player, board), game.new(player, computer, board) or game.new(computer, computer, board)
  answer = gets.strip

  if answer == '1'
    game = Game.new()
    game.board.display
  elsif answer == '2'
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    game
  else
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    game
  end
  game.play
end
  def current_player
    turn = 0
     @board.cells.each do |play|
      if play == "X" || play == 'O'
        turn += 1
      end
    end
    turn.odd? ?  player_2 :  player_1
  end

  def over?
    won? || draw?
  end

  def won?
     answer = WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
      end
      # binding.pry
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    current_move =  current_player.move(board)
      if board.valid_move?(current_move)
        board.update(current_move, current_player)
      else
        turn
      end
  end

  def play
  while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
