require 'dynopoker/version'
require 'open-uri'

module Dynopoker

  def self.configure
    Poker.new.tap { |p| yield p }.start!
  end

  class Poker
    attr_accessor :enable, :address, :poke_frequency, :logger

    def start!
      merge_default_options!
      start_poking_thread! if should_poke?
    end


    private

    def start_poking_thread!
      logger.info 'Dynopoker: starting thread'
      Thread.new { poking } or logger.error 'Dynopoker: error while starting thread'
    end

    def poking
      while true
        poke!
        sleep(poke_frequency)
      end
    end

    def poke!
      logger.info "Dynopoker: poking #{address}"
      open(address).status
    rescue Exception => exception
      logger.error "Dynopoker: poking error #{exception.class.name}: #{exception.message}"
    end

    def merge_default_options!
      self.poke_frequency ||= 1800
      self.logger ||= Logger.new($stdout)
      self.enable = enable.nil? ? true : enable
      raise('Dynopoker: no address provided!') if !address && enable
    end

    def should_poke?
      address.present? && enable && poke_frequency.present?
    end

  end
end