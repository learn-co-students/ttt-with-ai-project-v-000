

def test
  winning = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  cells = ["X", "O", "X", " ", "O", " ", " ", "X", " "]
  winning.detect do |winning_combo|
    if winning_combo.select {|cell| cells[cell] == "O"}.count == 1 && winning_combo.select {|cell| cells[cell] == " "}.count == 2
      return winning_combo.detect {|index| cells[index] == " "}, winning_combo
    end
  end
  return false
end
