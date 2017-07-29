class Game

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Second column
    [2,5,8],  #Third column
    [0,4,8],  #diagonal1
    [2,4,6]  #diagonal2
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count[3] ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[1]] == board.cells[combination[2]] && board.taken?(combination[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      win_index = won?[0]
      @board.cells[win_index]
    else
      return nil
    end
  end


  def turn
    puts "Please pick a spot 1-9"
    user_input = self.current_player.move
    if board.valid_move?(user_input)
      board.update(user_input, self.current_player)
    else
      puts "Invalid. Please pick a spot 1-9"
      #turn
      #user_input = self.current_player.move
    #  if board.valid_move?(user_input)
    #    board.update(user_input, self.current_player)
    end

  end


end
