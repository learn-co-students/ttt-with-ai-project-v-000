

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

  cells = ["X", "O", "O", " ", "X", " ", " ", " ", " "]
  winning_num = ""
  winning.detect do |winning_combo|
    if winning_combo.select {|cell| cells[cell] == "X"}.count == 2
      return winning_combo.detect {|index| cells[index] == " "}
    end
  end
  return false
end
