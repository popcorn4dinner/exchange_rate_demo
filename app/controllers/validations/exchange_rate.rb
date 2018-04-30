# coding: utf-8
module Validations
  class ExchangeRate
    include ActiveModel::Validations

    attr_accessor :exchanged_on, :from, :to

    validates :from, presence: true, inclusion: { in: proc { allowed_currencies } }
    validates :to, presence: true, inclusion: { in: proc { allowed_currencies } }
    validate :exchanged_on_format

    def initialize(params={})
      @exchanged_on = params[:exchanged_on]
      @from = params[:from]
      @to = params[:to]

      params.permit(:exchanged_on, :from, :to)
    end

    def self.allowed_currencies
      ['EUR', 'SEK', 'NOK']
    end

    private


    def exchanged_on_format
      exchange_date = Date.parse exchanged_on rescue nil

      unless exchange_date.present?
        errors.add(:exchaned_on, 'must have the format yyyy-mm-dd')
      end
    end
  end
end
