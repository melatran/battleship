class Board
  attr_reader :cells, :coordinates

  def initialize
      @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
      }
  end

  def valid_coordinate?(coordinate)
    @cells[coordinate] != nil
  end

  def valid_placement?(ship, coordinates)
      if ship.length == coordinates.length && coordinates.all? { |coordinate| valid_coordinate? (coordinate) }
        if can_place_ship?(coordinates) == true && is_occupied?(coordinates) == false
          true
        else
          false
        end
      else
        false
      end
    end

  def is_occupied?(coordinates)
    coordinates.any? { |coordinate| !@cells[coordinate].empty? }
  end

  def valid_horizontal_coordinates?(coordinates)
    coordinates.each_cons(2).all? do |coordinate1, coordinate2|
      coordinate1_letter = coordinate1[0].ord #A of A1
      coordinate1_number = coordinate1[1].to_i #1 of A1

      coordinate2_letter = coordinate2[0].ord
      coordinate2_number = coordinate2[1].to_i

      coordinate1_letter == coordinate2_letter && coordinate1_number == (coordinate2_number - 1)
    end
  end

  def valid_vertical_coordinates?(coordinates)
    coordinates.each_cons(2).all? do |coordinate1, coordinate2|
      coordinate1_letter = coordinate1[0].ord #A of A1
      coordinate1_number = coordinate1[1].to_i #1 of A1

      coordinate2_letter = coordinate2[0].ord
      coordinate2_number = coordinate2[1].to_i

      coordinate1_letter == (coordinate2_letter - 1) && coordinate2_number == coordinate1_number
    end
  end

  def can_place_ship?(coordinates)
    valid_horizontal_coordinates?(coordinates) || valid_vertical_coordinates?(coordinates)
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
    end
  end

  def render(show_ship = false)
    board_render = "  1 2 3 4 \n" +
    "A #{cells["A1"].render(show_ship)} #{cells["A2"].render(show_ship)} #{cells["A3"].render(show_ship)} #{cells["A4"].render(show_ship)} \n" +
    "B #{cells["B1"].render(show_ship)} #{cells["B2"].render(show_ship)} #{cells["B3"].render(show_ship)} #{cells["B4"].render(show_ship)} \n" +
    "C #{cells["C1"].render(show_ship)} #{cells["C2"].render(show_ship)} #{cells["C3"].render(show_ship)} #{cells["C4"].render(show_ship)} \n" +
    "D #{cells["D1"].render(show_ship)} #{cells["D2"].render(show_ship)} #{cells["D3"].render(show_ship)} #{cells["D4"].render(show_ship)} \n"
    board_render
  end
end
