class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new) # If initialize with Player.new, this could be Human or Computer, need to specifiy with Players::Human.
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board = Board.new
  end


  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo| #taken?(index) takes an argument
      #binding.pry
      if board.taken?(combo[0]) && board.cells[combo[0]] == board.cells[combo[1]] &&   board.cells[combo[1]] == board.cells[combo[2]]
        return combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    combo = won?
    if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
      return "X"
    elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
      return "O"
    else
      nil
    end
  end

  def turn
    #player to make a move
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = user_input.to_i - 1
    #if !board.valid_move?(index)
      #puts "Invalid move"
    #else
      #turn
    #end
  end

  #def input_to_index(user_input)
   #user_input.to_i - 1
  #end

  #def turn
    #puts "Please enter a number (1-9):"
    #user_input = gets.strip
    #index = input_to_index(user_input)
    #if !valid_move?(index)
      #puts "Invalid move"
    #else
      #turn
    #end
  #end

  def move(index, token)
    @board[index] = token
  end




end
