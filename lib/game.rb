require 'pry'



class Game

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

  attr_accessor :board, :player_1, :player_2

  # @board = []

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # binding.pry
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    # binding.pry

  end

  def board
    # binding.pry
    @board
  end

  def current_player
    # string_token = self.board.cells.select{|cell| cell != " "}.last
    # if self.player_1.token == string_token
    #   self.player_1
    # elsif
    #   self.player_2
    # else
    #   self.player_1
    # end
    if self.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end


  def turn_count
    count = 0
    self.board.cells.each do |spot|
      if spot != " "
        count += 1
      end
    end
    count
  end

  # def over?
  #   # binding.pry
  #     if WIN_COMBINATIONS.any? {|line| (line - board.cells) == [] }
  #       true
  #     elsif ["X", "O", "X", "O", "X", "X", "O", "X", "O"] - board.cells == []
  #       true
  #       # binding.pry
  #     # elsif board.cells.include?(" ")
  #     else
  #       false
  #     # binding.pry
  #   end
  #
  # end

  def won?
    WIN_COMBINATIONS.any? do |line|
      token1 = board.cells[line[0]]
      token2 = board.cells[line[1]]
      token3 = board.cells[line[2]]

      if (token1 == token2) && (token2  == token3) && token1 != " "
        # do they all equal each other and are they not empty
        return line
      end


    end

    false
  end


  def draw?
    self.won? == false && self.board.full? == true
    # binding.pry
  end


  def over?
        self.won? || self.draw?
  end


  def winner
    if self.won?
      # binding.pry
      combo = self.won?
      self.board.cells[combo[0]]
    end

  end

  def turn
    response = self.current_player.move(board)
    if board.valid_move?(response)
      self.board.update(response, self.current_player)

    else
      puts "try again"
      turn

    end
  end

# has something to do with draw method, with the idea that
# the board can't be full?

  def play
    # binding.pry
    while !self.over?
        turn
    end
# binding.pry
    if self.draw?
      puts "Cat's Game!"
      # binding.pry
    elsif self.won? && self.winner == "X"
      puts "Congratulations X!"
    elsif self.won? && self.winner == "O"
      puts "Congratulations O!"

      # binding.pry
    end
    # turn
    #while loop broken. game is over.
    #we need to either say 'you won'
    #or we need to say 'the game was a draw'

  end

end
