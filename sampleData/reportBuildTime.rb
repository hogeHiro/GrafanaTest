#!/usr/bin/env ruby
require 'xcprofiler'
require 'influxdb'
include Xcprofiler

host     = 'localhost'
database = 'tutorial'
INFLUX_DB_TABLE_NAME = 'tutorial'

class InfluxDBReporter < AbstractReporter
  def report!(executions)
    client ||= InfluxDB::Client.new(
      'tutorial',
      host: 'localhost',
      port: 8086,
      username: 'root',
      password: 'root'
    )

    payload = executions.map { |e|
      key = "#{e.filename}:#{e.line}:#{e.column} #{e.method_name}"
      Hash[*[key, e.time]]
    }.reduce(&:merge)
    client.write_point(INFLUX_DB_TABLE_NAME, {values: payload})
  end
end

profiler = Profiler.by_product_name('TestPrj')
profiler.reporters = [
  StandardOutputReporter.new(limit: 20, order: :time),
  InfluxDBReporter.new(limit: 20),
]
profiler.report!