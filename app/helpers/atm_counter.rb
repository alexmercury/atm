# frozen_string_literal: true

module AtmCounter
  class ATMException < StandardError; end
  class MaxAmountException < ATMException; end
  class NominalException < ATMException; end

  # class for Banknotes
  class Banknotes
    # { 1 => 40, 2 => 9 }
    def initialize(banknotes_hash)
      @banknotes = banknotes_hash
    end

    def give(amount)
      raise MaxAmountException, max_amount if amount > max_amount

      try_res_banknotes(amount.clone, @banknotes.clone)
    end

    def total_from_h(amount_hash)
      amount_hash.keys.inject(0) { |sum, k| sum + (amount_hash[k] * k) }
    end

    private

    def try_res_banknotes(amount, banknotes)
      res_banknotes = {}

      max_min_nominal.each do |n|
        next unless amount >= n

        count = (amount / n).to_i
        count = banknotes[n] if count > banknotes[n]
        amount -= count * n
        res_banknotes[n] = count
        banknotes[n] -= count
      end

      raise NominalException if amount.positive?

      res_banknotes
    end

    def max_min_nominal
      @banknotes.keys.sort! { |x, y| y <=> x }
    end

    def max_amount
      @banknotes.keys.inject(0) { |sum, k| sum + (@banknotes[k] * k) }
    end
  end
end
