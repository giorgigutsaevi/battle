require 'game'

describe Game do
  before do
    @player1 = double
    @player2 = double
    allow(@player2).to receive(:reduce_health).and_return(nil)
  end

  it "Attack a player" do
    expect(@player2).to receive(:reduce_health)
    subject.attack(@player2)
  end
end
