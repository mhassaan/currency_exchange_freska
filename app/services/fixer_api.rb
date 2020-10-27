class FixerApi
  include HTTParty
  base_uri "http://data.fixer.io/api"
  attr_reader :base_currency, :target_currency, :exchange_date

  def initialize(params = {})
    @base_currency = params[:base_currency]
    @target_currency = params[:target_currency]
    @exchange_date = params[:exchange_date]
  end

  def latest
    @options = { query: { access_key: Figaro.env.fixer_api_key } }
    Rails.cache.fetch(cache_key, :expires => 24.hours) do
      self.class.get("/latest", @options).to_hash
    end
  end

  def historical
    @options = { query: { access_key: Figaro.env.fixer_api_key, base: base_currency, symbols: target_currency } }
    Rails.cache.fetch(cache_key, :expires => 24.hours) do
      self.class.get("/#{exchange_date}", @options).to_hash
    end
  end

  private

  def cache_key
    cache_key = [self.class.base_uri, base_currency, target_currency]
  end
end
