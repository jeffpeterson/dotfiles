#!/usr/bin/env ruby
# require 'irb/completion'
# require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

unless respond_to? :Fabricate
  def Fabricate(*args)
    require './spec/support/fabricators'
  end
end

def y(obj)
  puts obj.to_yaml
end

def me
  User['jeffpeterson']
end

def hal
  User['hal9000']
end

def link_to(obj)
  obj =
    case obj
    when App
      [:batch, obj, { batch: obj.deprecated_batch }]
    else obj
    end
  helper.url_for(obj)
end

def go(obj)
  Launchy.open link_to(obj)
end

def rubymine(file, line = 0)
  system("rubymine #{file} --line #{line || 0}")
end

class Object
  def locate_method(name)
    method(name)
  rescue NameError
    instance_method(name)
  end

  def vim(method_name = nil)
    if method_name
      file, line = locate_method(method_name).source_location
    elsif is_a?(Method)
      file, line = source_location
    elsif is_a?(Module)
      file, line = module_parent.const_source_location(name)
    else
      raise "What is this? I can't edit this..."
    end

    # return system("tmux split-window -h \"vim #{file} +#{line}\"") if file
    # return system("$VISUAL --goto #{file}:#{line || 0}") if file
    return rubymine(file, line || 0) if file

    puts 'Source not available. Is this a C extension?'
  end
end

module Enumerable
  unless [].respond_to? :tally
    def tally_by
      each_with_object(Hash.new(0)) do |item, counts|
        counts[yield item] += 1
      end
    end

    def tally
      tally_by(&:itself)
    end
  end
end

if defined? ActiveRecord
  def policy(obj)
    Pundit.policy({ user: me }, obj)
  end

  def pg_timeout(v)
    # Set the current connection's statement timeout.
    ActiveRecord::Base.connection.execute "SET statement_timeout = #{v.in_milliseconds}"
  end

  pg_timeout(60.seconds) rescue ActiveRecord::ConnectionNotEstablished

  def pg_ps(**options)
    # List currently active queries.
    # To disable query truncation: pg_ps(resize: false)
    queries = ActiveRecord::Base.connection.execute("
      SELECT pid, age(clock_timestamp(), query_start) AS runtime, usename, query
      FROM pg_stat_activity
      WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%'
      ORDER BY query_start desc
    ")
    table queries, fields: %w{pid usename runtime query}, **options
  end

  def pg_cancel(pid)
    # Cancel the current query for the given process.
    ActiveRecord::Base.connection.execute("SELECT pg_cancel_backend(#{pid})")
  end

  def pg_kill!(pid)
    # Kill the database connection for the given process.
    ActiveRecord::Base.connection.execute("SELECT pg_terminate_backend(#{pid})")
  end

  module ActiveRecord
    class Relation
    def analyze(buffers: true)
      sql = connection.unprepared_statement { to_sql }
      puts connection.execute("EXPLAIN (ANALYZE#{', BUFFERS' if buffers}) #{sql}")
                      .map(&:values).join("\n")
    end
    end
  end

  # class PgStatActivity < ActiveRecord::Base
  #   self.table_name = 'pg_stat_activity'
  #   self.primary_key = 'pid'
  # end
end
