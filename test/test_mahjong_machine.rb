require_relative '../src/mahjong_machine'
require 'test/unit'


class TestMahjongMachine < Test::Unit::TestCase
  def test_initialize
    machine = MahjongMachine.new
    assert_equal(machine.cards.size, 136)
  end

  def test_start
    machine = MahjongMachine.new
    machine.start
    assert_equal(machine.count_left, 136)
    assert_equal(machine.current_card_index, 0)
    assert_equal(machine.status, 1)
  end

  def test_end
    machine = MahjongMachine.new
    machine.end
    assert_equal(machine.status, 0)
  end
end

