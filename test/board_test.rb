require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    require "pry";binding.pry
    assert_instance_of Board, @board
  end

  def test_board_has_cells_as_hash
    assert_equal Hash, @board.cells.class
  end
end
