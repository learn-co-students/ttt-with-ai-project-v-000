class Game
  attr_accessor :board, :player_1, :player_2, :name

  # Win combinations constant
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left Diagonal
    [2, 4, 6]  # Right Diagonal
  ]
  
  # Game methods
  def initialize(player_1 = Players::Human.new("X", name), player_2 = Players::Human.new("O", name), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    self
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    # THIS FUCKING SUCKEDDDD
    win = false
    WIN_COMBINATIONS.each do |combo|
      win = combo if check_combo(combo)
    end
    win
  end

  # #won? helper method
  def check_combo(combo)
    win = false
    poss_win = []
    combo.each {|i| poss_win << board.cells[i]}
    win = combo if poss_win == ["X", "X", "X"] || poss_win == ["O", "O", "O"]
    win
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?&.first] if won?
    # Can assign result of #won? to a variable instead
    # if won = won?
    #   board.cells[won.first]
    # end
  end
  
  def turn
    print "\nYour turn, #{current_player.name}! To make your move, enter a number 1-9: "
    input = current_player.move(board)
    if current_player.name == "Optimus Prime" || current_player.name == "Megatron" || current_player.name == "Watson"
      puts "#{input}"
    end
    if !board.valid_move?(input)
      puts "Invalid move."
      turn
    else
      board.update(input, current_player)
    end
  end

  def winner_name
    board.turn_count.odd? ? player_1.name : player_2.name
  end

  def play
    # binding.pry
    while !over?
      turn
      board.display
    end
    won? ? (puts "\nCongratulations #{winner_name}! You win!") : (puts "\nCat's Game!")
  end

end