require 'player'

describe Player do

  it "Returns its name" do
    subject = Player.new("Alfonso")
    expect(subject.name).to eq("Alfonso")
  end
end