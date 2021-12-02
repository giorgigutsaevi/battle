require 'game'

describe Game do
  subject {Game.new('gandalf', 'balrog')}

  before do
    @player1 = double{:player}
    @player2 = double{:player}
  end
  
  context "initialization" do
    it 'creates an instance of itself' do
      expect(subject).to be_an_instance_of(Game)
    end
  end

  context "#player_1 method" do
    it 'has a #player_1 method' do
      expect(subject).to respond_to(:player_1)
    end

    it 'returns player_1' do
      expect(subject.player_1).to eq 'gandalf'
    end
  end

  context "#player_2 method" do
    it 'has a #player_2 method' do
      expect(subject).to respond_to(:player_2)
    end

    it 'returns player_1' do
      expect(subject.player_2).to eq 'balrog'
    end
  end

  context "attacking" do
    it "Attack a player" do
      expect(@player2).to receive(:reduce_health)
      subject.attack(@player2)
    end
  end

  # context "assigning currently active player" do

  #   before do
  #     subject.current_player('gandalf')
  #   end

  #   it 'assigns active player' do
  #     expect(subject.active_player).to eq 'gandalf'
  #   end
  # end

  context "switching players" do
    before do
      subject.switch_player
    end

    it 'switches the active player' do
      expect(subject.active_player).to eq 'balrog'
    end

  end

end
