# frozen_string_literal: true

# Transaction model
class Transaction < ActiveRecord::Base
  before_save :update_banknotes

  validate :validate_amount

  private

  def update_banknotes
    banknotes.each do |k, v|
      banknote = Banknote.find_by(nominal_value: k)
      banknote.amount -= v
      banknote.save
    end
  end

  def validate_amount
    atm_counter = AtmCounter::Banknotes.new(Banknote.banknotes_hash)
    self.banknotes = atm_counter.give(total_amount)
    self.success = true
  rescue AtmCounter::MaxAmountException => e
    errors.add(
      :total_amount,
      'Max amount is ' + e.message
    )
  end
end
