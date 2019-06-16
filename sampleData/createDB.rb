#!/usr/bin/env ruby
require 'influxdb'

database = 'tutorial'

influxdb = InfluxDB::Client.new host: 'localhost'
influxdb.create_database(database)