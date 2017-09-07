module V1

  class UpdateWorker < ApplicationWorker

    # from_queue AMQP['queues']['update'], env: nil
    from_queue 'backlogg.api.users.update', env: nil

    def work(message)
      puts "Updating #{message}"
      ack!
    end

  end

end