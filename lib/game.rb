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
    [6,4,2]
  ]

  def initialize(player_1 = "X", player_2 = "O", board = [])
    p1 = Player::Human.new(player_1) if player_1 == "X"
    p1 = player_1 if player_1.class == Player
    p2 = Player::Human.new(player_2) if player_2 == "O"
    p2 = player_2 if player_2.class == Player
    self.player_1 = p1
    self.player_2 = p2
    @board = board
  end



  ###### state #####

  def cuttent_player
    self.board.cells % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
    end
  end

  def winner
    if winning_combo = won?
      @winner = position(winning_combo.first)
    end
  end

  def draw?
    !won? && @board.all?{|token| token == "X" || token == "O"}
  end

  #### manage ####

  def start

  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end


end
