require 'pry'

class Computer < Player


  # when passing output from #move(board) into board#update(move, player)
  #you will have to account for numerical indexing by adding +1


  def move(board)
    if opponent_win(board) && opponent_win(board).any?{|item| !board.taken?(item+1)}
      (opponent_win(board).detect{|item| !board.taken?(item+1)}+1).to_s
      
    elsif potential_wins(board).any?{|k,v| v.size > 0}
      frequency = {}

      possible_indexes = potential_wins(board).values.flatten.sort
      possible_indexes.uniq.each{|num| frequency[num] = possible_indexes.count(num)}
      frequency = frequency.delete_if{|index, reps| board.taken?(index+1)}
      (frequency.max_by{|index, reps| reps}.first+1).to_s

    else
      (potential_wins(board).detect{|k,v| board.valid_move?(k+1)}.first+1).to_s
    end
  end

  def opponent_win(board)
    Game::WIN_COMBINATIONS.detect do |combination|
      combination.count{|item| board.position(item+1) != " " && board.position(item+1) != self.token} == 2
    end
  end

  def potential_wins(board)
    wins_by_index = {}

    board.cells.each_with_index do |cell, index|
        wins_by_index[index] = Game::WIN_COMBINATIONS.reject do |combination|
          !combination.include?(index) || combination.any?{|item| board.taken?(item+1) && board.position(item+1) != self.token}
      end
    end
    wins_by_index
  end

end