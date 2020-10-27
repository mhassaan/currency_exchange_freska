module Validations
  class ExchangeRate
    include ActiveModel::Validations
    attr_reader :base_currency, :target_currency, :exchange_date
    validates :base_currency, inclusion: { in: lambda { |f| f.allowed_base_currency }, message: "%{value} is not within our supported currency We currenlty support only ['EUR']" }
    validates :target_currency, presence: true
    validate :date_format

    def initialize(options = {})
      @base_currency = options[:base_currency]
      @target_currency = options[:target_currency]
      @exchange_date = options[:exchange_date]
    end

    def allowed_base_currency
      ["EUR"]
    end

    def date_format
      unless date_is_valid
        errors.add(:exchange_date, "must have the format YY-mm-dd")
      end
    end

    def date_is_valid
      allowed_format = "%Y-%m-%d"
      date = Date.strptime(exchange_date, allowed_format) rescue false
    end
  end
end
