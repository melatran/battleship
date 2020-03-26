require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells_as_hash
    assert_equal Hash, @board.cells.class
  end

  def test_is_validates_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_returns_valid_placement_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_valid_placement
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  end

  def test_can_valid_horizontal_coordinates
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
  end

  def test_can_valid_vertical_coordinates
    assert_equal true, @board.valid_placement?(@submarine, ["B1", "C1"])
  end

  def test_can_place_ship
    assert_equal true, @board.can_place_ship?(["A1", "A2", "A3"])
    assert_equal false, @board.can_place_ship?(["A1", "B2", "C3"])
  end

  def test_is_occupied
    assert_equal false, @board.is_occupied?(["A1", "A2", "A3"])

  end
end
