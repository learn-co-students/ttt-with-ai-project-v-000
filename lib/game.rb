require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2 

  def self.clone(game)
    new_game = Game.new 
    new_game.player_1 = game.player_1
    new_game.player_2 = game.player_2 
    new_game.board = Board.clone(game.board)
    new_game 
  end 

  WIN_COMBINATIONS = [ 
                      [0,1,2], 
                      [3,4,5], 
                      [6,7,8], 
                      [0,3,6], 
                      [1,4,7], 
                      [2,5,8], 
                      [0,4,8], 
                      [6,4,2] 
                    ]

  def initialize(player_1 = Player::Human.new, player_2 = Player::Human.new("O"), board = Board.new)
    self.board = board 
    self.player_1 = player_1
    self.player_2 = player_2 
  end 

  def current_player
    if board.turn_count.even? 
      self.player_1
    else
      self.player_2
    end
  end 

  def over?
    self.draw? || self.won? 
  end 

  def won?
    WIN_COMBINATIONS.each do |combo|
      index_1 = combo[0]  #the zero-ith index in the whatever'eth combo 
      index_2 = combo[1]
      index_3 = combo[2]
      position_1 = self.board.cells[index_1] #what is on the board at a particular index 
      position_2 = self.board.cells[index_2]
      position_3 = self.board.cells[index_3]
      if position_1 != " " && position_1 == position_2 && position_2 == position_3 && position_3 == position_1
          return combo 
      end
    end
    false
  end

  def draw?
    self.board.full? && !self.won? 
  end

  def winner
    if self.won? 
      self.board.cells[self.won?[0]] 
    else
      nil 
    end 
  end

  def turn
    puts "It is #{self.current_player.token}'s turn."  
    puts "Here is the current board."
    puts self.board.display
    input = self.current_player.move(self)
    self.update(input)
  end 

  def update(input, display = true )
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      if display
        puts "Here is the updated board."
        self.board.display
      end 
    else
      puts "Please try again, invalid move."
      self.turn 
    end 
  end 

  def play
    until self.over? do
      self.turn 
    end
      if self.won?
        puts "Congratulations " + self.winner + "!"
        return self.winner  
      else
        puts "Cats Game!"
    end
end 







end