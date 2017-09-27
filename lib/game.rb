require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [2,5,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    self.player_1, self.player_2, self.board = player_1, player_2, board
  end

  def current_player
    if self.player_1.token == "X" && self.board.turn_count.odd?
      self.player_2
    else
      self.player_1
    end
  end

  def over?
    self.won? != false || self.draw?
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |win_combination|
      cell_1 = self.board.cells[win_combination[0]]
      cell_2 = self.board.cells[win_combination[1]]
      cell_3 = self.board.cells[win_combination[2]]
      if (cell_1 == "X" && cell_2 == "X" && cell_3 == "X") || (cell_1 == "O" && cell_2 == "O" && cell_3 == "O")
        win = win_combination
      end
    end
    win
  end

  def draw?
    self.won? == false && self.board.full? == true
  end

  def winner
    if won? != false
      winning_comb = won?
      if self.board.cells[winning_comb[0]] == "O"
        "O"
      elsif self.board.cells[winning_comb[1]] == "X"
        "X"
      end
    else
      nil
    end
  end

  def turn
    self.board.display
    puts "Player #{current_player.token}, please enter 1-9:"
    if self.board.valid_move?(desired_move = self.current_player.move(self.board)) == false
      self.turn
    end
    self.board.update(desired_move,self.current_player)
  end

  def play
    until self.over?
      self.turn
    end
    self.board.display
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end

  def self.start
    puts "Would you like to:"
    puts "1 Play a 2-player game with a friend"
    puts "2 Play a game against a computer"
    puts "3 Watch two computers play a game"
    game_type = gets.strip
    if game_type != "1" && game_type != "2" && game_type != "3"
      self.start
    end
    if game_type == "2"
      first_player = nil
      while first_player != "1" && first_player!= "2"
        puts "Who would you like to go first as Player X?:"
        puts "1 You"
        puts "2 Computer"
      first_player = gets.strip
      end
    end

    if game_type == "1"
      self.new.play
    elsif game_type == "2"
      if first_player == "2"
        self.new(player_1=Players::Computer.new("X"),player_2=Players::Human.new("O")).play
      elsif first_player == "1"
        self.new(player_1=Players::Human.new("X"),player_2=Players::Computer.new("O")).play
      end
    elsif game_type == "3"
      self.new(player_1=Players::Computer.new("X"),player_2=Players::Computer.new("O")).play
    end
    self.another_game?
  end

  def self.another_game?
    puts "Would you like to play another game?:"
    puts "1 Yes"
    puts "2 No"
    input = gets.strip
    if input != "1" && input != "2"
      self.another_game?
    end
    if input == "1"
      self.start
    end
  end

end
