module V1

  class ShowWorker < ApplicationWorker

    # from_queue AMQP['queues']['show'], env: nil
    from_queue 'backlogg.api.users.show', env: nil

    def work(message)
      puts "Showing #{message}"
      ack!
    end

  end

end