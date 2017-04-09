class Game 
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1=Player.new("X"), player_2=Player.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row, #had extra comma&deleted comma, #add comma to delineate element of array WIN_COMBINATIONS
    [3,4,5],  # Middle row, #add comma to delineate element of array WIN_COMBINATIONS
    [6,7,8],  # last row#add comma to delineate element of array WIN_COMBINATIONS
    [0,3,6], #first columns#add comma to delineate element of array WIN_COMBINATIONS
    [1,4,7],  #second columns#add comma to delineate element of array WIN_COMBINATIONS
    [2,5,8],  # third columns#add comma to delineate element of array WIN_COMBINATIONS
    [0,4,8],  #diagnoal from nw to se#add comma to delineate element of array WIN_COMBINATIONS
    [2,4,6],  #diagnoal from ne to sw#add comma to delineate element of array WIN_COMBINATIONS
    # ETC, an array for each win combination#add comma to delineate element of array WIN_COMBINATIONS
  ]
  #def player_1
  # player_1 = Player.new("X")
   #self.player_1=(player_1)
  #end 
end 