# frozen_string_literal: true

module API
  # Banknotes API
  class Banknotes < Grape::API
    format :json
    namespace :banknotes do
      desc 'A a status.'
      params do
        requires :nominal_value, type: Integer, desc: 'Nominal: 1,2,3 ... '
        requires :amount, type: Integer, desc: 'Amount'
      end
      post do
        banknote = ::Banknote.find_or_initialize_by(
          nominal_value: params[:nominal_value]
        )
        banknote.amount += params[:amount]
        if banknote.save
          status 200
          banknote.as_json
        else
          status 400
          { errors: banknote.errors.full_messages.join(',') }
        end
      end
    end
  end
end
