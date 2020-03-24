class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_hit = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    !@ship.nil? ? @ship.hit : false
    @cell_hit = true
  end

  def fired_upon?
    @cell_hit ? true : false
  end
end
