# # require 'sneakers'

# Sneakers.configure connection: Bunny.new,
#                    daemonize: true,
#                    # heartbeat: 2,
#                    # amqp: 'amqp://guest:guest@localhost:5672',
#                    # vhost: '/',
#                    exchange: 'backlogg.api.users',
#                    exchange_type: :fanout,
#                    durable: true
# # Sneakers.configure {}