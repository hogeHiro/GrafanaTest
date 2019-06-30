#!/usr/bin/env ruby
require 'xcprofiler'
require 'influxdb'
require 'csv'
include Xcprofiler

host     = 'localhost'
database = 'tutorial'
INFLUX_DB_TABLE_NAME = 'tutorialAndroid2'

data = CSV.read('/Users/ryoji/git/GrafanaTest/TestProject/app/build/times.csv', headers: true)
sum = data.map { |row|
  row["ms"].to_i
}.inject(:+)

puts sum

client ||= InfluxDB::Client.new(
  'tutorial', 
  host: 'localhost',
  port: 8086,
  username: 'root',
  password: 'root'
)

userName = ENV["USER"]
payloadSum = Hash[*[userName, sum]]
client.write_point(INFLUX_DB_TABLE_NAME, {values: payloadSum})