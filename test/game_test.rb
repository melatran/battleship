require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/game.rb'

class GameTest < Minitest::Test
  def test_game_exits
    game = Game.new
    assert_instance_of Game, game
  end
end
