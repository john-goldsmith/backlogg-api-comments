module V1

  class IndexWorker < ApplicationWorker

    # from_queue AMQP['queues']['index'], env: nil
    from_queue 'backlogg.api.users.index', env: nil

    def work(message)
      puts "Indexing #{message}"
      ack!
    end

  end

end