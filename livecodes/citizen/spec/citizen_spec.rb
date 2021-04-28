require_relative "../citizen"

describe Citizen do
  context '#can_vote?' do
    it "returns true if 18 or older" do
      matt = Citizen.new("matt", "penchel", 18)

      expect(matt.can_vote?).to be true
    end

    it "returns false if 17 or younger" do
      matt = Citizen.new("baby matt", "penchel", 17)

      expect(matt.can_vote?).to be false
    end
  end

  context '#full_name' do
    it "returns the first_name and the last_name concatenated" do
      matt = Citizen.new("matheus", "penchel", 31)

      expect(matt.full_name).to eq("Matheus Penchel")
    end
  end
end