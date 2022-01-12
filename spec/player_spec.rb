require 'player'

describe Player do
  subject(:storm) { Player.new('Storm') }

  describe '#name' do
    it 'returns the name' do
      expect(storm.name).to eq 'Storm'
    end
  end
end