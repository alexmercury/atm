require 'spec_helper'

describe AtmCounter::Banknotes do
  it 'AtmCounter Test' do
    atm = AtmCounter::Banknotes.new(
      1 => 1, 2 => 1, 5 => 1, 10 => 1, 25 => 3, 50 => 1
    )
    expect(atm.total_from_h(atm.give(100))).to be(100)
    expect(atm.total_from_h(atm.give(125))).to be(125)
    expect(atm.total_from_h(atm.give(128))).to be(128)
    expect { atm.give(129) }.to raise_error(AtmCounter::NominalException)
    expect(atm.total_from_h(atm.give(143))).to be(143)
    expect { atm.give(144) }.to raise_error(AtmCounter::MaxAmountException)
  end
end
