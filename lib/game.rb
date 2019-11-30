require 'pry'
# require_relative "../lib/players/human.rb"
class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new())
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # def current_player
  #   if @board.turn_count % 2 == 0
  #     player_1
  #   else
  #     player_2
  #   end
  # end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  # def won?
  #   WIN_COMBINATIONS.each do |win_combination|
  #
  #       win_index_1 = win_combination[0]
  #       win_index_2 = win_combination[1]
  #       win_index_3 = win_combination[2]
  #
  #       position_1 = board.cells[win_index_1]
  #       position_2 = board.cells[win_index_2]
  #       position_3 = board.cells[win_index_3]
  #
  #         if position_1 == "X" && position_2 == "X" && position_3 == "X"
  #             return win_combination
  #          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  #             return win_combination
  #         end
  #     end
  #     false
  # end

  def won?
    WIN_COMBINATIONS.find do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end

  # def draw_move?
  #   WIN_COMBINATIONS.find do |drawer|
  #     if @board.cells[drawer[0]] == @board.cells[drawer[1]]
  #       computer_move = @board.cells[drawer[2]] ||
  #      @board.cells[drawer[3]] == @board.cells[drawer[4]]
  #       computer_move = @board.cells[drawer[5]] ||
  #      @board.cells[drawer[6]] == @board.cells[drawer[7]]
  #       computer_move = @board.cells[drawer[8]] ||
  #      @board.cells[drawer[1]] == @board.cells[drawer[2]]
  #       computer_move = @board.cells[drawer[0]] ||
  #      @board.cells[drawer[4]] == @board.cells[drawer[5]]
  #       computer_move = @board.cells[drawer[3]] ||
  #      @board.cells[drawer[7]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[6]] ||
  #      @board.cells[drawer[1]] == @board.cells[drawer[4]]
  #       computer_move = @board.cells[drawer[7]] ||
  #      @board.cells[drawer[0]] == @board.cells[drawer[3]]
  #       computer_move = @board.cells[drawer[6]] ||
  #      @board.cells[drawer[2]] == @board.cells[drawer[5]]
  #       computer_move = @board.cells[drawer[8]] ||
  #      @board.cells[drawer[3]] == @board.cells[drawer[6]]
  #       computer_move = @board.cells[drawer[0]] ||
  #      @board.cells[drawer[4]] == @board.cells[drawer[7]]
  #       computer_move = @board.cells[drawer[1]] ||
  #      @board.cells[drawer[5]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[2]] ||
  #      @board.cells[drawer[2]] == @board.cells[drawer[4]]
  #       computer_move = @board.cells[drawer[6]] ||
  #      @board.cells[drawer[4]] == @board.cells[drawer[6]]
  #       computer_move = @board.cells[drawer[2]] ||
  #      @board.cells[drawer[0]] == @board.cells[drawer[4]]
  #       computer_move = @board.cells[drawer[8]] ||
  #      @board.cells[drawer[4]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[0]] ||
  #      @board.cells[drawer[0]] == @board.cells[drawer[2]]
  #       computer_move = @board.cells[drawer[1]] ||
  #      @board.cells[drawer[3]] == @board.cells[drawer[5]]
  #       computer_move = @board.cells[drawer[4]] ||
  #      @board.cells[drawer[6]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[7]] ||
  #      @board.cells[drawer[0]] == @board.cells[drawer[6]]
  #       computer_move = @board.cells[drawer[3]] ||
  #      @board.cells[drawer[1]] == @board.cells[drawer[7]]
  #       computer_move = @board.cells[drawer[4]] ||
  #      @board.cells[drawer[2]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[5]] ||
  #      @board.cells[drawer[2]] == @board.cells[drawer[6]]
  #       computer_move = @board.cells[drawer[4]] ||
  #      @board.cells[drawer[0]] == @board.cells[drawer[8]]
  #       computer_move = @board.cells[drawer[4]] ||
  #     (@board.cells[drawer[0]] == "X" || @board.cells[drawer[0]] == "O")
  #   end
  #  end
  # end

  # def draw?
  #     if board.full? == false
  #       false
  #     elsif won? == false
  #       true
  #     end
  # end

  def draw?
    board.full? && !won?
  end

  # def over?
  #   if draw?
  #     true
  #   elsif won?
  #     true
  #   else false
  #   end
  # end

  def over?
    draw? || won?
  end

  # def winner
  #   WIN_COMBINATIONS.each do |win_combination|
  #
  #     win_index_1 = win_combination[0]
  #     win_index_2 = win_combination[1]
  #     win_index_3 = win_combination[2]
  #
  #     position_1 = board.cells[win_index_1]
  #     position_2 = board.cells[win_index_2]
  #     position_3 = board.cells[win_index_3]
  #
  #     if position_1 == "X" && position_2 == "X" && position_3 == "X"
  #       return "X"
  #     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  #       return "O"
  #     end
  #   end
  #   return nil
  # end

  def winner
    if wincombo = won?
      @winner = @board.cells[wincombo[0]]
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
    board.display()
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
