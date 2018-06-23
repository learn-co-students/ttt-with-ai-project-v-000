require 'pry'
class Board


  attr_accessor :cells, :token
  #attr_reader :token
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

   def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
      @cells[position.to_i-1]

  end
#  describe '#full?' do
#     it 'returns true for a full board' do
#       board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

#       expect(board.full?).to be_truthy
#     end

  def full?
    self.cells.all? {|move| move == "X" || move == "O"}
  end


  def turn_count
        @cells.count { |position| position != " " }
  end

  def taken?(pos)
    if
      @cells[pos.to_i-1]  == "X" || @cells[pos.to_i-1] == "O"
      true
     else
      false
    end
  end

  require 'pry'

    def valid_move?(position)
       #valid_move? will ensure that moves are between 1-9 and not taken.
      if position.to_i > 0 && position.to_i <=9 && taken?(position.to_i) == false
        true
        else
        false
      end
   end

  def update(position, player)
                               # this player token
      # seet the cells at positon entered to token value
      cells[position.to_i-1] = player.token
  end

end