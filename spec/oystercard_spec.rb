# require 'oystercard'
#
# describe Oystercard do
#   subject(:card) {described_class.new}
#   let(:top_up_amount) { 20 }
#   let(:entry_station) { double :station}
#   let(:exit_station) { double :station}
#
#   describe "#balance", :balance do
#     it "has a balance" do
#       expect(card.balance).not_to be(nil)
#     end
#
#     it "has a default balance" do
#       expect(card.balance).to eq(0)
#     end
#
#     it "increases the balance when topped up" do
#       card.top_up(10)
#       expect(card.balance).to eq(10)
#     end
#
#     it "has a maximum limit of £90" do
#       over_limit = described_class::LIMIT + 1
#       expect{card.top_up(over_limit)}.to raise_error "#{over_limit} pushes your balance over the £#{described_class::LIMIT} limit."
#     end
#   end
#
#   describe '#touch_in' do
#     it 'expects in journey to be true' do
#       card.top_up(top_up_amount)
#       card.touch_in(entry_station)
#       expect(card.in_journey?).to eq(true)
#     end
#   end
#
#   describe '#touch_out' do
#     it 'expects in journey to be false by default' do
#       expect(card.in_journey?).to eq(false)
#     end
#   end
#
#   describe '#in_journey?' do
#     before do
#       card.top_up(top_up_amount)
#     end
#
#     it 'returns true when in journey' do
#       card.touch_in(entry_station)
#     expect(card.in_journey?).to eq(true)
#   end
#
#     it 'returns false when not in journey' do
#       card.touch_in(entry_station)
#       card.touch_out(exit_station)
#       expect(card.in_journey?).to eq(false)
#     end
#   end
#
#   describe "#minimum_balance" do
#     it "doesn't allow touch in when balance below £1" do
#       card2 = described_class.new
#       expect{card2.touch_in(entry_station)}.to raise_error "Not enough money."
#     end
#   end
#
#   describe '#touch out fee' do
#     it 'reduces the balance by the fare amount' do
#       card.top_up(20)
#       card.touch_in("Kingston")
#       expect{card.touch_out("string")}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
#     end
#   end
#
#   describe "#entry_station", :entry do
#     before do
#       card.top_up(top_up_amount)
#     end
#
#     it "remembers the entry station on touch in" do
#       card.touch_in(entry_station)
#       expect(card.entry_station).to eq(entry_station)
#     end
#
#     it "sets entry station to nil on touch out" do
#       card.touch_in(entry_station)
#       card.touch_out(exit_station)
#       expect(card.entry_station).to eq(nil)
#     end
#   end
#
#   describe 'journey logs' do
#     before do
#       card.top_up(top_up_amount)
#     end
#   it 'checks to see if the journeys list is empty by default' do
#     expect(card.all_journeys).to be_empty
#   end
#
#   it 'records a single journey in a hash, which is appended to an array' do
#     card.touch_in("Kingston")
#     card.touch_out("Whitechapel")
#     expect(card.all_journeys.length).to eq(1)
#   end
#
# end
#
# end
