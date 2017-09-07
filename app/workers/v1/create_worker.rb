module V1

  class CreateWorker < ApplicationWorker

    # from_queue AMQP['queues']['create'], env: nil
    from_queue 'backlogg.api.users.create', env: nil

    def work(message)
      puts "Creating #{message}"
      ack!
    end

  end

end