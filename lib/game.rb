class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = "X", player_2 = "O", board = [" "," "," "," "," "," "," "," "," "])
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # turn_count % 2 == 0 ? "X" : "O"
  end

  def over?
    # if draw?
    #   return true
    # elsif board.full? && won?
    #   return true
    # elsif won?
    #   return true
    # end
  end

  def won?
  #   WIN_COMBINATIONS.each do |option|
    #   if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
    #     true
    #     winner
    #     return option
    #   elsif
    #     @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
    #     true
    #     winner
    #     return option
    #   end
  #   end
  # false
  end

  def draw?
    # if full? == true && won? == false
    #  return true
    # else
    #  return false
    # end
  end

  def winner
  #   WIN_COMBINATIONS.each do |option|
    #    if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
    #      return "X"
    #    elsif
    #      @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
    #      return "O"
    #    end
  #   end
  # return nil
  end

  def turn
  # puts "Please enter 1-9:"
  # input = gets.strip
  # index = input_to_index(input)
    # if valid_move?(index)
    #   move(index, current_player)
    # else
    #   turn
    # end
  end

  def play
    # while !over?
    #  turn
    # end
    # WIN_COMBINATIONS.each do |option|
    #      if @board[option[0]] == "X" && @board[option[1]] == "X" && @board[option[2]] == "X"
    #      puts "Congratulations X!"
    #      elsif
    #      @board[option[0]] == "O" && @board[option[1]] == "O" && @board[option[2]] == "O"
    #      puts "Congratulations O!"
    #      elsif draw?
    #      puts "Cat's Game!"
    #      end
    # end
  end
end
