require 'player'

describe Player do
  subject(:storm) { Player.new('Storm') }

  describe '#name' do
    it 'returns the name' do
      expect(storm.name).to eq 'Storm'
    end
  end
  
  describe '#hitpoints' do
    it 'initially it starts with 60hp' do
      expect(subject.hitpoints).to eq Player::DEFAULT_HITPOINTS
    end
  end

  describe '#reduce_hitpoints' do
    it 'changes hitpoints by 20' do
      expect { subject.reduce_hitpoints(Player::ATTACK_DAMAGE) }.to change { subject.hitpoints }.by(Player::ATTACK_DAMAGE * -1)
    end
  end
end