class Board
  attr_reader :cells, :coordinates

  def initialize
      @cells = {}
      @cells = Hash.new
      @coordinates =["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4",
            "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def cells
    @cells = @coordinates.map do |coordinate|
      
  end
end
# cell1 = Cell.new("A1"),
# cell2 = Cell.new("A2"),
# cell3 = Cell.new("A3"),
# cell4 = Cell.new("A4"),
# cell5 = Cell.new("B1"),
# cell6 = Cell.new("B2"),
# cell7 = Cell.new("B3"),
# cell8 = Cell.new("B4"),
# cell9 = Cell.new("C1"),
# cell10 = Cell,new("C2"),
# cell11 = Cell.new("C3"),
# cell12 = Cell.new("C4"),
# cell13 = Cell.new("D1"),
# cell14 = Cell.new("D2"),
# cell15 = Cell.new("D3"),
# cell16 = Cell.new("D4")
