# frozen_string_literal: true

module API
  # Transactions API
  class Transactions < Grape::API
    format :json
    namespace :transactions do
      desc 'Return a status.'
      params do
        requires :total_amount, type: Integer, desc: 'Amount'
      end
      post do
        transaction = Transaction.new(total_amount: params[:total_amount])
        if transaction.save
          status 200
          transaction.as_json
        else
          status 400
          { errors: transaction.errors.full_messages.join(',') }
        end
      end
    end
  end
end
