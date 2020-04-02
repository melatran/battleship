require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/game.rb'

class GameTest < Minitest::Test
  def setup
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @game = Game.new
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

#initialize method important when user plays again
  def test_game_can_initialize_computer_ships
    assert_instance_of Board, @computer_board
    assert_instance_of Ship, @computer_cruiser
    assert_instance_of Ship, @computer_submarine
    assert_equal "Cruiser", @computer_cruiser.name
    assert_equal 3, @computer_cruiser.length
  end

  def test_game_can__initialize_user_ships
    assert_instance_of Board, @human_board
    assert_instance_of Ship, @human_cruiser
    assert_instance_of Ship, @human_submarine
    assert_equal "Cruiser", @human_cruiser.name
    assert_equal 3, @human_cruiser.length
  end

  # def test_computer_fire_shot
  #   @human_board.cells["A3"].fire_upon
  #   assert_equal true, @human_board.cells["A3"].fired_upon?
  # end
  #
  # def test_computer_can_place_on_coordinates
  #   coordinates = ["A1", "A2", "A3"]
  #
  #   assert_equal true, @computer_board.valid_placement?(@computer_cruiser, coordinates)
  # end
end
