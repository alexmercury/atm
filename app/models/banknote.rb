# frozen_string_literal: true

# Banknote model
class Banknote < ActiveRecord::Base
  NOMINAL = [1, 2, 5, 10, 25, 50].freeze

  validate :nominal_validation

  # { 1 => 40, 2 => 9 }
  def self.banknotes_hash
    banknotes_hash = {}
    Banknote.select(:nominal_value, :amount).where.not(amount: 0).each do |b|
      banknotes_hash[b.nominal_value] = b.amount
    end
    banknotes_hash
  end

  private

  def nominal_validation
    return true if NOMINAL.include?(nominal_value)

    errors.add(
      :nominal_value,
      'accepted only: ' + NOMINAL.join(', ')
    )
  end
end
