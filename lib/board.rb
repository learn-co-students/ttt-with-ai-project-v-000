require 'pry'

class Board
  attr_accessor :cells
  attr_reader :player
  
  def initialize
    @cells = Array.new(9, " ")
    @token = "X"
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "    
  end
  
  def position(user_input)
  # takes in user input and returns the value of the board cell
    @cells[user_input.to_i - 1]
  end

  
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def full?
    !@cells.include?(" ")
  end
  
  def taken?(user_input)
    !(position(user_input).nil? || position(user_input) == " ")
  end

  def valid_move?(user_move)
    !taken?(user_move) && user_move.to_i.between?(1,9)
    # binding.pry
  end
  
  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token
  end
  
end

  # describe '#update' do
  #   it 'updates the cells in the board with the player token according to the input' do
  #     player = double("player", :token => "X")

  #     board.update("1", player)
  #     expect(board.position("1")).to eq("X")
  #   end
  # end

