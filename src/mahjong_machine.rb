require_relative('card')

class MachineStatus
  def initialize(name)
    @name = name
  end
  def to_s
    "MachineStatus(#{name})"
  end
end

MACHINE_STATUS_RUNNING = MachineStatus.new('running')
MACHINE_STATUS_READY = MachineStatus.new('ready')

class MahjongMachine
  attr_reader :all_cards, :status, :cards_left
  def initialize
    @all_cards = []
    @status = MACHINE_STATUS_READY
    [CARD_TYPE_WAN, CARD_TYPE_TONG, CARD_TYPE_TIAO].each do |cardType|
      4.times do
        (1..9).each do |i|
          card = Card.new(i.to_s, cardType)
          @all_cards << card
        end
      end
    end
    4.times do
      ['EAST', 'SOUTH', 'WEST', 'NORTH', 'CENTER', 'MONEY', 'BLANK'].each do |name|
        @all_cards << Card.new(name, CARD_TYPE_FENG)
      end
    end
  end

  def start
    @status = MACHINE_STATUS_RUNNING
    @current_card_index = 0
    @cards_left = all_cards.size
  end

  def end
    @status = MACHINE_STATUS_READY
  end

  def has_next?
    cards_left > 10 * 2
  end

  def next
    raise 'machine is not running' unless @status == MACHINE_STATUS_RUNNING
    raise 'cards are not enough' unless has_next?
    current_card = @all_cards[@current_card_index]
    @current_card_index += 1
    current_card
  end

  def gang
  end
end