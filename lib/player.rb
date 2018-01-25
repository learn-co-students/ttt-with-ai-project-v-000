class Player

      WIN_COMBINATIONS_PLAYER = [
        [1,2,3], [4,5,6],[7,8,9],
        [1,5,9], [3,5,7],
        [1,4,7], [2,5,8], [3,6,9]
      ]
  attr_accessor :board
  attr_reader :token
  def initialize(token)
    @token = token
  end

# HOW TO HAVE THESE 2 METHODS ONLY FOR COMPUTER?

def opponent_token
  token == "X" ? "O" : "X"
end

  def opponent_has_2?
    position_to_block = nil
    opponent_positions_taken = []
    @board.cells.each_with_index do |cell, i|
       opponent_positions_taken << (i+1) if cell == opponent_token
     end

     WIN_COMBINATIONS_PLAYER.each do |combo|
       possible_win_combo = []
       combo.each do |position|
         if opponent_positions_taken.include?(position)
           possible_win_combo << position
         end
       end
       if possible_win_combo.count == 2
        # binding.pry
         position_to_block = (combo - possible_win_combo).first.to_s
       end
     end
     position_to_block

  end
end
