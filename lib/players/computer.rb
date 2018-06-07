
module Players
  class Computer < Player
    
def move(board)
  binding.pry
  two_row = [
              ['1','2'], ['2','3'], ['1','4'], ['2','5'], ['3','6'], ['1','5'],
              ['3','5'], ['2','4'], ['2','6'], ['4','5'], ['5','6'], ['4','7'],
              ['5','8'], ['6','9'], ['4','8'], ['6','8'], ['5','7'], ['5','9'],
              ['7','8'], ['8','9']
            ]
  edges = ['2','4','6','8']
  corners = ['1','3','7','9']

  if token == 'O'
    enemy = 'X'
  else
    enemy = 'O'
  end

=begin
  if # win / block - use two_row for conditional logic
  elsif # (block)fork - this one may require a giant array of adjacent spots
  elsif board.position("6") == ' ' # center
    '6'
  elsif # opposite corner
  elsif # corner
    corners.detect { |area| board.position(area) == ' '}
  else # edge
    edges.detect { |area| board.position(area) == ' '}
  end
=end
end

    
  end
end