require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  #board should collaborate through arguments with Player and Board

  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    #initialize will be called with 3 appropriate, pre-made objects
    @player_1=player_1
    @player_2=player_2
    @board=board
  end

  def board
    @board
  end

  def current_player
    turns=@board.turn_count
    if turns%2==0
      @player_1
    else
      @player_2
    end
  end

  def won?
    res=false
    WIN_COMBINATIONS.each do |combo|
      #REFACTOR
      positions=[@board.cells[combo[0]],@board.cells[combo[1]],@board.cells[combo[2]]]
      if positions.all? {|pos| pos=="X" } || positions.all? {|pos| pos=="O"}
        res=combo
      end
    end
    res
  end

  def draw?
    if @board.full? && !self.won?
      true
    else
      false
    end
  end

  def over?
    @board.full? || self.won? || self.draw?
  end

  def winner
    win_combo=self.won?
    #binding.pry
    if win_combo!=false
      @board.cells[win_combo[0]]
    else
      nil
    end
  end

  def turn
    @board.display
    player=self.current_player
    move=player.move(@board)
    #binding.pry
    if !@board.valid_move?(move)
      self.turn
    else
      @board.update(move,player)
    end
  end

  def play

    while !self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
      @board.display
    end
    if self.winner!=nil
      puts "Congratulations #{self.winner}!"
      @board.display
    end
  end


end
