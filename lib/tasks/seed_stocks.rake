require 'nokogiri'
require_relative 'stock_scrape'
require_relative '../translators/income_statement'
require 'logger'

desc "Stocks seed from web"
task :seed_stocks => :environment do

  $logger = Logger.new('log/BiznesRadar.log')

  #Scrape::BiznesRadar.seed_from_index('https://www.biznesradar.pl/gielda/akcje_gpw', 'GPW')
  #Scrape::BiznesRadar.seed_from_index('https://www.biznesradar.pl/gielda/newconnect', 'NewConnect')

  #Stock.not_banks.all.each do |stock|
    #Scrape::BiznesRadar.seed_details(stock)
  #end
  #puts "Missing: ", Translators::BzRadar.missing

  #stock = Stock.find_by_ticker 'FIN'
  #Scrape::BiznesRadar.add_quarterly_income_statements(stock)

  Stock.not_banks.limit(1).all.each do |stock|
    #Scrape::BiznesRadar.add_quarterly_income_statements(stock)
    Scrape::BiznesRadar.add_quarterly_balance_sheets(stock)
  end
end
