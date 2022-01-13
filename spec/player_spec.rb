require 'player'

describe Player do
  subject(:new_player) { Player.new('New Player') }
  let(:damage) { 10 }

  describe '#name' do
    it 'returns the name' do
      expect(new_player.name).to eq 'New Player'
    end
  end
  
  describe '#hitpoints' do
    it 'initially it starts with 60hp' do
      expect(subject.hitpoints).to eq Player::DEFAULT_HITPOINTS
    end
  end

  describe '#reduce_hitpoints' do
    it 'changes hitpoints by 20' do
      expect { subject.reduce_hitpoints(10) }.to change { subject.hitpoints }.by(-10)
    end
  end

  describe '#last_hit' do
    it 'remembers the last damage done to a player' do
      new_player.reduce_hitpoints(damage)
      expect(new_player.last_hit).to eq damage
    end
  end
end