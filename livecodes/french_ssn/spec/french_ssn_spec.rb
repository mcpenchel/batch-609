require_relative '../french_ssn'

describe '#french_ssn_info' do
  context 'when ssn is valid' do
    it 'returns the description of that ssn holder' do
      expected = "a man, born in December, 1984 in Seine-Maritime."
      actual = french_ssn_info("1 84 12 76 451 089 46")

      expect(actual).to eq(expected)
    end
  end

  context 'when ssn is invalid' do
    it 'returns an error msg' do
      expected = "The number is invalid"
      actual = french_ssn_info("123")

      expect(actual).to eq(expected)
    end
  end
end