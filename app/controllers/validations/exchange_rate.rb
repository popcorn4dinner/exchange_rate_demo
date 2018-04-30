module Validations
  class ExchangeRate
    include ActiveModel::Validations

    attr_accessor :exchanged_on, :from, :to

    validates :from, presence: true, inclusion: { in: allowed_currencies }
    validates :to, presence: true, inclusion: { in: allowed_currencies }
    validates :exchanged_on, presence: true, format: { with: date_format,
                                       message: "only format yyyy-mm-dd allowed"}

    def initialize(params={})
      @exchanged_on = params[:exchanged_on]
      @from = params[:from]
      @to = params[:to]

      ActionController::Parameters.new(params).permit(:exchanged_on, :from, :to)
    end

    private

    def valid_date_format?(date_param)
      parsed_date = Date.parse date_param rescue nil
      parsed_date.present?
    end

    def allowed_currencies
      ['EUR', 'SEK', 'NOK']
    end

    def date_format
      /^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])/
    end
  end
end
