# coding: utf-8
require_relative 'card'
require_relative 'mahjong_machine'

class Player
  @@count = 1
  attr_accessor :cards, :name
  def initialize(name = '')
    if name == ''
      @name = "Player#{@@count}"
      @@count += 1
    else
      @name = name
    end
  end

  def inspect
    name
  end
end

class Game
  attr_accessor :players, :mahjong_machine
  def initialize
    @players = []
    @mahjong_machine = MahjongMachine.new
    4.times { @players << Player.new}
  end

  def begin
  end

  def inspect
    @players.inspect + "\n" + @mahjong_machine.cards.inspect
  end
end

game = Game.new
puts "cards.count = #{game.mahjong_machine.cards.size}"
puts game.inspect