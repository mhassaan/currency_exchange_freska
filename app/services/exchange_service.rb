module ExchangeService
  class ExchangeRate
    attr_reader :base_currency, :target_currency, :exchange_date

    def initialize(options = {})
      @base_currency = options[:base_currency]
      @target_currency = options[:target_currency]
      @exchange_date = options[:exchange_date]
    end

    def latest
      fixer = FixerApi.new
      fixer.latest
    end

    def historical
      fixer = FixerApi.new({ base_currency: base_currency, target_currency: target_currency, exchange_date: exchange_date })
      fixer.historical
    end
  end
end
