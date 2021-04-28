class SlotMachine

  SCORES = {
    'joker'  => 50,
    'star'   => 40,
    'bell'   => 30,
    'seven'  => 20,
    'cherry' => 10
  }

  def score(reels)
    if reels.uniq.size == 1
      SCORES[reels.first]
    elsif reels.include?('joker') && reels.uniq.size == 2
      # Two scenarios

      # 2 jokers => 25
      joker_count = reels.count { |reel| reel == 'joker' }
      if joker_count == 2
        SCORES['joker'] / 2
      else
        # reels => ["bell", "bell", "joker"]
        reels.delete('joker')
        # reels => ["bell", "bell"]

        SCORES[reels.first] / 2
      end
    else
      0
    end
  end

  def play
    reels = []
    3.times do
      reels << SCORES.keys.sample
    end

    p reels
    
    score(reels)
  end
end

machine = SlotMachine.new
puts machine.play