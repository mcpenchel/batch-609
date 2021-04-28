require_relative '../slot_machine'

describe SlotMachine do
  context '#score' do
    SCORES = {
      'joker'  => 50,
      'star'   => 40,
      'bell'   => 30,
      'seven'  => 20,
      'cherry' => 10
    }

    SCORES.each do |reel, score|
      it "returns #{score} if the reels are #{reel} - #{reel} - #{reel}" do
        slot_machine = SlotMachine.new

        result = slot_machine.score([reel, reel, reel])

        expect(result).to eq(score)
      end

      next if reel == 'joker'

      it "returns #{score / 2} if there are 2 #{reel} and 1 joker" do
        slot_machine = SlotMachine.new

        result = slot_machine.score([reel, reel, 'joker'])

        expect(result).to eq(score / 2)
      end
    end

    SCORES.keys.each do |reel|
      next if reel == 'joker'
      it "returns 25 if there are 2 jokers and #{reel}" do
        slot_machine = SlotMachine.new

        result = slot_machine.score(['joker', 'joker', reel])

        expect(result).to eq(25)
      end
    end

    it "returns 0 if the 3 reels are different" do
      slot_machine = SlotMachine.new

      result = slot_machine.score(['joker', 'bell', 'star'])

      expect(result).to eq(0)
    end
  end

end