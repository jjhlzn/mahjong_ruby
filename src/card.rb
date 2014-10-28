# coding: utf-8

#CardType的构造函数应该是私有的
class CardType
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def inspect
    @name
  end
end
CARD_TYPE_WAN = CardType.new('W')
CARD_TYPE_TONG = CardType.new('T')
CARD_TYPE_TIAO = CardType.new('|')
CARD_TYPE_FENG = CardType.new('F')

class Card
  attr_accessor :name, :cardType
  def initialize(name, cardType)
    @name = name
    @cardType = cardType
  end
  def inspect
    "#{@name}#{@cardType.name}"
  end
end