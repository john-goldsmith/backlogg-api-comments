# bunny = Bunny.new
# bunny.start
# channel = bunny.create_channel
# exchange = channel.topic('backlogg', auto_delete: true)

# channel.queue('comments.create', auto_delete: true).bind(exchange, routing_key: 'comments.create').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Creating #{payload}"
# end

# channel.queue('comments.destroy', auto_delete: true).bind(exchange, routing_key: 'comments.destroy').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Destroying #{payload}"
# end

# channel.queue('comments.index', auto_delete: true).bind(exchange, routing_key: 'comments.index').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Indexing #{payload}"
# end

# channel.queue('comments.show', auto_delete: true).bind(exchange, routing_key: 'comments.show').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Showing #{payload}"
# end

# channel.queue('comments.update', auto_delete: true).bind(exchange, routing_key: 'comments.update').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Updating #{payload}"
# end

# exchange.publish('hello!', routing_key: 'users.create')

# sleep 1.0

# bunny.close