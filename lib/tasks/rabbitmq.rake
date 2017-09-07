namespace :rabbitmq do
  desc "Setup routing"
  task setup: :environment do
    require 'bunny'

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    # get or create exchange
    x = ch.fanout('backlogg.api.comments')

    # get or create queue (note the durable setting)
    ch.queue('backlogg.api.comments.create', durable: true).bind('backlogg.api.comments')
    ch.queue('backlogg.api.comments.destroy', durable: true).bind('backlogg.api.comments')
    ch.queue('backlogg.api.comments.index', durable: true).bind('backlogg.api.comments')
    ch.queue('backlogg.api.comments.show', durable: true).bind('backlogg.api.comments')
    ch.queue('backlogg.api.comments.update', durable: true).bind('backlogg.api.comments')

    conn.close
  end
end
