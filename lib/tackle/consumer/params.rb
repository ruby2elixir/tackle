module Tackle
  class Consumer
    class Params

      attr_reader :amqp_url
      attr_reader :exchange
      attr_reader :routing_key
      attr_reader :service
      attr_reader :retry_limit
      attr_reader :retry_delay
      attr_reader :logger
      attr_reader :exception_handler

      def initialize(params = {})
        # required
        @amqp_url    = params.fetch(:url)
        @exchange    = params.fetch(:exchange)
        @routing_key = params.fetch(:routing_key)
        @service     = params.fetch(:service)

        # optional
        @retry_limit = params[:retry_limit] || 8
        @retry_delay = params[:retry_delay] || 30
        @logger      = params[:logger] || Logger.new(STDOUT)

        @exception_handler = params[:exception_handler]
      end

    end
  end
end
