module V1

  class DestroyWorker < ApplicationWorker

    # from_queue AMQP['queues']['destroy'], env: nil
    from_queue 'backlogg.api.users.destroy', env: nil

    def work(message)
      puts "Destroying #{message}"
      ack!
    end

  end

end