require 'pry'

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
      [2,4,6]
    ]

  def initialize(player_1=nil, player_2=nil, board=nil)
    player_1.nil? ?  @player_1 = Player::Human.new("X") : @player_1 = player_1
    player_2.nil? ?  @player_2 = Player::Human.new("O") : @player_2 = player_2
    board.nil? ? @board = Board.new : @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || !won?.nil?
  end

  def draw?
    board.full? && won?.nil?
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |win|
      win_test = [
        board.cells[win[0]],
        board.cells[win[1]],
        board.cells[win[2]]
      ]
      if win_test.uniq.size == 1 && !win_test.uniq.first.empty? && win_test.uniq.first != " "
        winner = win_test.uniq.first
      end
    end
    winner    
  end

  def winner
    won?
  end

  def turn
    board.display
    puts "Player #{current_player.token}, you're up."   
    cell_num = current_player.move(board).to_i
    if !board.valid_move?(cell_num)
      puts "That's not a valid move."
      turn
    end
    board.cells[cell_num-1] = current_player.token
  end

  def play
    while !draw? && !over?
      turn      
    end
    if !won?.nil?
      won?
      board.display
      puts "Congratulations #{won?}!"
    elsif draw?
      board.display
      puts "Cats Game!"        
    end
  end

  def self.game_type
    type = gets.strip
    case type 
      when "0"
        player_1 = Player::Computer.new("X")
        player_2 = Player::Computer.new("O")
        Game.new(player_1, player_2)
      when "1"
        self.comp_token        
      else
        Game.new()
    end    
  end

  def self.comp_token
    puts "Choose computer's token. (type 'X' or 'O')"
    token = gets.strip.upcase
    if token == "X"
      player_1 = Player::Computer.new("X")
      player_2 = Player::Human.new("O")
      Game.new(player_1, player_2)
    elsif token == "O"
      player_1 = Player::Human.new("X")
      player_2 = Player::Computer.new("O")
      Game.new(player_1, player_2)
    elsif token != "X" || token != "O"
      puts "That's not a valid choice. Try again."
      comp_token
    end
  end

  def self.start
    puts "Let's play Tic-Tac-Toe!"
    puts "Choose game type: 0, 1 or 2 player."
    game = Game.game_type
    until game.over?
      game.play
    end
    self.another_game?
  end

  def self.another_game?
    puts "Play another game? ('Y' or 'N')"
    answer = gets.strip.upcase
    if answer == "Y"
      self.start
    elsif answer == "N"
      puts "Thanks for playing. Bye!"
    else
      puts "That's not a valid choice. Type 'Y' or 'N'"
      another_game?
    end
  end

end







