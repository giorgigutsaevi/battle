require 'player'

describe Player do
  before do
    @player1 = Player.new("Alfonso")
    @player2 = Player.new("Jessica")
  end

  it "Returns its name" do
    expect(@player1.name).to eq("Alfonso")
  end

  it "Returns player health" do
    expect(@player1.health).to eq Player::DEFAULT_HIT_POINTS 
  end

  it "Reduces player health" do
    expect{ @player1.reduce_health }.to change{ @player1.health }.by(-10)
  end
end