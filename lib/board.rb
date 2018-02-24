require 'pry'

class Board
attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9," ")
    #@cells= ["X","O","O",
    #         "O","X","X",
    #         "X","O"," "]
  end

  def display
    puts(" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
    puts("-----------")
    puts(" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
    puts("-----------")
    puts(" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false:true
  end

  def turn_count
    number_of_turns = @cells.length - @cells.count(" ")
  end

  def taken?(user_input)

    @cells[user_input.to_i - 1].include?(" ") ? false:true
  end

  def valid_move?(user_input)
    if !taken?(user_input) && user_input.to_i >= 1 && user_input.to_i <= 9
      true
    else
      false
    end
  end

  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token
  end

  def winning_board?
    ai_game = Game.new(Players::Human.new("X"),Players::Human.new("O"),self)
    ai_game.won?
  end

  def game_winner?
    ai_game = Game.new(Players::Human.new("X"),Players::Human.new("O"),self)
    ai_game.winner
  end

  def game_player?
    ai_game = Game.new(Players::Human.new("X"),Players::Human.new("O"),self)
    ai_game.current_player
  end

  def game_over?
    ai_game = Game.new(Players::Human.new("X"),Players::Human.new("O"),self)
    ai_game.over?
  end


end
