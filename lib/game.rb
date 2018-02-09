class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    (@board.turn_count + 1) % 2 == 0 ? player_2 : player_1
  end
  
  def won?
    player_1_cells = []
    player_2_cells = []
    won = nil
    @board.cells.each_with_index {|cell, index| player_1_cells << index if cell == player_1.token}
    @board.cells.each_with_index {|cell, index| player_2_cells << index if cell == player_2.token}
    
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|index| player_1_cells.include?(index)} || combination.all? {|index| player_2_cells.include?(index)}
        won = combination
        break
      end
    end
    won
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    @board.cells[won?[0]] if won?
  end
  
  def turn
    input = current_player.move(@board)
    while !@board.valid_move?(input)
      input = current_player.move(@board)
    end
    @board.update(input, current_player)
  end
  
  def play
    while !over?
      puts "Please enter your move, #{current_player.token}:"
      turn
      @board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def self.wargames(first_player_token, second_player_token)
    counter = 0
    100.times do
      game = self.new(player_1 = Players::Computer.new(first_player_token), player_2 = Players::Computer.new(second_player_token))
      game.play
      if game.won?
        counter += 1
      end
    end
    puts "Game was won #{counter} times."
  end
end