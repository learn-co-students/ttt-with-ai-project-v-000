class Game

  include Players

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? @player_2 : @player_1
  end

  def draw?
    won? == nil && self.board.full? == true ? true : false
  end

  def won?
    @cells = self.board.cells
    result = WIN_COMBINATIONS.find_all do |win_index|

      position_1 = @cells[win_index[0]]
      position_2 = @cells[win_index[1]]
      position_3 = @cells[win_index[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
    result.last
  end

  def over?
    won? !=nil || draw? == true ? true : nil
  end

  def winner
    if won? != nil
    @cells = self.board.cells
    @cells[won?[0]]
    else
      nil
    end
  end


  def turn

    @player = current_player

    puts "---"
    puts "Your turn, #{@player.token}."
    puts "---"

    @input = @player.move(board)
    @input ||= ''
    @input.chomp

    if self.board.valid_move?(@input) == true
      self.board.update(@input, @player)
      self.board.display
      puts
    else
      puts "Invalid position. Please enter a valid move, 1-9."
      @input = @player.move(board)
      @input ||= ''
      @input.chomp
    end

    @player = current_player

  end


  def play

    until over? == true
      turn
    end

    if won? != nil
      puts "Congratulations #{winner}!"
    end

    if draw? == true
      puts "Cat's Game!"
    end

  end


  def start

    puts "Welcome to Tic Tac Toe!"

    puts "---"

    puts "Would you like to play a 0, 1, or 2-player game?"

    game_input = gets
    game_input ||= ''
    game_input.chomp!

    puts "The first player will be 'X'. Good luck!"
    puts "---"

    if game_input == "0"

      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      self.play

    elsif game_input == "1"

      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Computer.new("O")
      self.play

    elsif game_input == "2"

      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Human.new("O")
      self.play

    end

  end

end
