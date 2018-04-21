require 'pry'
# require_relative '../player'
# require_relative 'human'
# require_relative '../board'
# require_relative '../game'

module Players
  
  class Computer < Player
  attr_reader :token, :opponent_token, :own_spaces, :opponents_spaces
  
  COMPUTER_WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def initialize(token)
    @token = token 
    if @token == "X"
      @opponent_token = "O"
    elsif @token == "O"
      @opponent_token = "X"
    end 
  end 
  
  def move(board)
    self.spaces(board)
    if play_winning_move(board)
      play_winning_move(board).to_s
    elsif block_opponent_win(board)
      block_opponent_win(board).to_s
    elsif take_a_corner(board)
      take_a_corner(board).to_s
    elsif take_the_center(board)
      take_the_center(board).to_s
    else 
      edge_space(board).to_s
    end 
  end 
      
def spaces(board)
  @own_spaces = []
  @opponents_spaces = []
    counter = 0
    board.cells.each do |space| 
      if space == @token
        @own_spaces << counter
      elsif space == @opponent_token 
        @opponents_spaces << counter
      end
      counter += 1
    end 
  end 

def play_winning_move(board)
  move_to_make = false
  
  COMPUTER_WIN_COMBINATIONS.each do |winning_array|
    own_token_in_rows = 0
    winning_array.each do |space_number|
 
      if @own_spaces.include?(space_number)
        own_token_in_rows += 1
      end 
      if own_token_in_rows == 2 
        winning_array.each do |space_number|
          if board.cells[space_number] == " "
            move_to_make = space_number + 1
          end
        end 
      end 
        end 
    end 
    move_to_make
end 

def block_opponent_win(board)
  move_to_make = false
  
  COMPUTER_WIN_COMBINATIONS.each do |winning_array|
    their_token_in_rows = 0
    winning_array.each do |space_number|
      if @opponents_spaces.include?(space_number)
        their_token_in_rows += 1
      end 
      if their_token_in_rows == 2 
        winning_array.each do |space_number|
          if board.cells[space_number] == " "
            move_to_make = space_number + 1
          end
        end 
      end 
        end 
    end 
    move_to_make
end 

def take_a_corner(board)
  move_to_make = false
  if board.cells[0] == " " 
    move_to_make = 1
  elsif board.cells[2] == " " 
    move_to_make = 3
  elsif board.cells[6] == " " 
    move_to_make = 7
  elsif board.cells[8] == " " 
    move_to_make = 9
  end 
    move_to_make
end

def take_the_center(board)
  move_to_make = false
  if board.cells[4] == " "
    move_to_make = 5
  end 
  move_to_make 
end 

def edge_space(board)
  move_to_make = nil 
  if board.cells[1] == " " 
    move_to_make = 2
  elsif board.cells[3] == " " 
    move_to_make = 4
  elsif board.cells[5] == " " 
    move_to_make = 6
  elsif board.cells[7] == " " 
    move_to_make = 8
  end
    move_to_make
end 

  
  end 
  
end 