# frozen_string_literal: true

module ATM
  # Base API
  class BaseAPI < Grape::API
    format :json
    mount ::API::Banknotes
    mount ::API::Transactions
    add_swagger_documentation
  end
end
