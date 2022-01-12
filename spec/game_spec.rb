require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player1 }
  let(:player_2) { double :player2 }

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:reduce_hitpoints)
      game.attack(player_2)
    end
    it 'changes last_action to attack' do
      allow(player_2).to receive(:reduce_hitpoints)
      subject.attack(player_2)
      expect(subject.last_action).to eq :attack
    end
  end

  describe '#last_action' do
    it 'starts as nil' do
      expect(subject.last_action).to eq(nil)
    end
  end

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(subject.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(subject.player_2).to eq player_2
    end
  end

  describe 'current turn' do
    it 'displays the current players name' do
      expect(subject.attacker).to eq player_1
    end

    it 'displays who the defending player is' do
      expect(subject.defender).to eq player_2
    end
  end

  describe 'change turn' do
    it 'changes attacker to player 2' do
      expect { subject.change_turn }.to change { subject.attacker }.from(player_1).to(player_2)
    end
    it 'changes defender to player 1' do
      expect { subject.change_turn }.to change { subject.defender }.from(player_2).to(player_1)
    end
  end

end