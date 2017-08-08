class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    @board.cells.count{|square| square != " " }
  end

  def current_player
    turn_count.even? ? @player_1 : @player_2
  end

  #turn
  def turn
    puts "#{current_player.token}, please enter 1-9:"
    input = current_player.move(board)
    if @board.valid_move?(input)
       @board.update(input, current_player)
       @board.display
       draw? || won?
    else
       turn
    end
  end

  def full?
    !@board.cells.include?(" ") ? true : false
  end

  #won?
  def won?
    if !@board.cells.include?("X") && !@board.cells.include?("O")
      return false
    elsif
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
    else
      return false
    end
  end

  #draw?
  def draw?
    full? && !won?
  end

  #over - returns true for a draw
  def over?
    draw? || won?
  end

  #winner
  def winner
    if combo = won?
      @board.cells[combo[0]]
    end
  end

  #play
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    @board.display
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? (0, 1, or 2):"
    num_players = gets.strip.to_i
    puts "Who should go first and have the token of 'X' (1 or 2?)"
    first = gets.strip.to_i
    if num_players == 0
      first == 1 ? Game.new(Players::Computer.new("X"), Players::Computer.new("O")) : Game.new(Players::Computer.new("O"), Players::Computer.new("X"))
    elsif num_players == 1
      first == 1 ? Game.new(Players::Human.new("X"), Players::Computer.new("O")) : Game.new(Players::Human.new("O"), Players::Computer.new("X"))
    elsif num_players == 2
      first == 1 ? Game.new() : Game.new(Players::Human.new("O"), Players::Human.new("X"))
    end
  end

end
