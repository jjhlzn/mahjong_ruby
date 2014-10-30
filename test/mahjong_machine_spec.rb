require 'rspec'
require 'rspec/its'
require File.dirname(__FILE__) + '/../spec/spec_helper'
require File.dirname(__FILE__) + '/../src/mahjong_machine'

describe MahjongMachine do
  let!(:machine) { MahjongMachine.new }
  subject { machine }
  its(:status) { should == MACHINE_STATUS_READY }
  describe 'should start correctly' do
   
    before { machine.start }
    its(:cards_left) { should == 136 }
    its(:status) { should == MACHINE_STATUS_RUNNING }
  end

  describe 'should end correctly' do
    before { machine.end }
    its(:status) { should == MACHINE_STATUS_READY }
  end

  it 'should has enough cards' do

  end

end