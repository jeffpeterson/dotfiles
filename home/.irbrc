#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

def y obj
  puts obj.to_yaml
end

class Object
  def vim method_name = nil
    if method_name.nil? && self.is_a?(Method)
      file, line = self.source_location
    else
      file, line = method(method_name).source_location
    end

    # return system("tmux split-window -h \"vim #{file} +#{line}\"") if file
    return system("$VISUAL --goto #{file}:#{line || 0}") if file

    puts "Source not available. Is this a C extension?"
  end
end

module ActiveRecord
  class Relation
    def analyze
      sql = connection.unprepared_statement { to_sql }
      puts connection.execute("EXPLAIN (ANALYZE, BUFFERS) #{sql}").
        map { |x| x.values }.
        join("\n")
    end
  end
end
