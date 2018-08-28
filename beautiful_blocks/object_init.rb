module Twitter
	module REST
    class Client
      attr_accessor :consumer_key, :consumer_secret,
                    :access_token, :access_token_secret
      
      def initialize(options = {}, &block)
        options.each { |k, v| send("#{k}=", v) }
        instance_eval(&block) if block_given?
      end
    end
  end
end

client = Twitter::REST::Client.new({config.consumer_key: "YOUR_CONSUMER_KEY"}) do
  config.consumer_secret = "YOUR_CONSUMER_SECRET"
  config.access_token = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

p client.consumer_key
p client.access_token
