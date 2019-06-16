#!/usr/bin/env ruby

require 'influxdb'

host     = 'localhost'
database = 'tutorial'
time_precision = 's'

influxdb = InfluxDB::Client.new database, :host => host, :time_precision => time_precision

NAMES = ['test1', 'test2', 'test3', 'test4', 'test5']
NAMES.each do |name|
  data = {
    values: {value: rand(10000) + 1},
    timestamp: Time.now.to_i
  }
  influxdb.write_point(name, data)
end