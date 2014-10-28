require_relative('card')

class MahjongMachine
  attr_reader :cards, :status, :count_left, :current_card_index
  def initialize
    @cards = []
    [CARD_TYPE_WAN, CARD_TYPE_TONG, CARD_TYPE_TIAO].each do |cardType|
      4.times do
        (1..9).each do |i|
          card = Card.new(i.to_s, cardType)
          @cards << card
        end
      end
    end
    4.times do
      ['EAST', 'SOUTH', 'WEST', 'NORTH', 'CENTER', 'MONEY', 'BLANK'].each do |name|
        @cards << Card.new(name, CARD_TYPE_FENG)
      end
    end
  end

  def start
    @status = 1
    @current_card_index = 0
    @count_left = cards.size
  end

  def end
    @status = 0
  end

  def next
    if @status == 1
      current_card = @cards[@current_card_index]
      @current_card_index += 1
      return current_card
    end
    return nil
  end
  def gang

  end
end