class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #down diagonal
    [6, 4, 2]  #up diagonal
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1 == nil && player_2 == nil && board == nil
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    else
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
    #binding.pry
  end

  def won?
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board.cells[combo[0]]
      position_2 = @board.cells[combo[1]]
      position_3 = @board.cells[combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winning_combo = combo
        break
      elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        winning_combo = combo
        break
      end
    end
    winning_combo
  end

  def draw?
    if @board.full? && self.won? == nil
      true
    end
  end

  def over?
    (self.won? || self.draw?) ? true : false
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
    #won_index = self.won?[0]
    #self.board.cells[won_index]
  end

  def turn
    position = self.current_player.move
    @board.update(position, self.current_player)
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    input = ""

      while input != "exit"
        puts "Welcome to Tic Tac Toe!"
        puts "What kind of game do you want to play? 0, 1, or 2 player? (select: 0 or 1 or 2): "
        puts "To quit, type 'exit'."
        game_type_input = gets.strip

          case game_type_input
          when "0"
            zero_players
          when "1"
            one_player
          when "2"
            two_players
          when "exit"
            break
          end
      end
  end

  def zero_players
    puts 'Who should go first and be "X"? (select player: 1 or 2): '
    input = gets.strip
      game = Game.new
        if input == "1"
          game.player_1 = Player::Computer.new("X")
          game.player_2 = Player::Computer.new("O")
        else
          game.player_1 = Player::Computer.new("O")
          game.player_2 = Player::Computer.new("X")
        end
      game.play
  end

  def one_player
    puts 'Who should go first and be "X"? (select player: 1 "Human" or 2 "Computer"): '
    input = gets.strip
      game = Game.new
        if input == "1"
          game.player_1 = Player::Human.new("X")
          game.player_2 = Player::Computer.new("O")
        else
          game.player_1 = Player::Computer.new("X")
          game.player_2 = Player::Human.new("O")
        end
      game.play
  end

  def two_players
    puts 'Who should go first and be "X"? (select player: 1 or 2): '
    input = gets.strip
      game = Game.new
        if input == "1"
          game.player_1 = Player::Human.new("X")
          game.player_2 = Player::Human.new("O")
        else
          game.player_1 = Player::Human.new("O")
          game.player_2 = Player::Human.new("X")
        end
      game.play
  end

end
