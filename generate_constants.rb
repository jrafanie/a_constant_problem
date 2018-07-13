#! /usr/bin/env ruby

require 'pathname'
require 'active_support/all'
ROOT = Pathname.new(__dir__)

klass = "Foo"
5000.times do |i|
  model = "#{klass}#{i}"
  mixin1 = "Bar#{i}"
  mixin2 = "Baz#{i}"
  mixin3 = "Wat#{i}"
  mixin4 = "Waat#{i}"
  model_file  = ROOT.join("app", "models", "#{model.tableize.singularize}.rb")
  mixin1_file = ROOT.join("app", "models", "#{mixin1.tableize.singularize}.rb")
  mixin2_file = ROOT.join("app", "models", "#{mixin2.tableize.singularize}.rb")
  mixin3_file = ROOT.join("app", "models", "#{mixin3.tableize.singularize}.rb")
  mixin4_file = ROOT.join("app", "models", "#{mixin4.tableize.singularize}.rb")


MODEL_BODY = <<-EOF
class #{model} < ApplicationRecord
  include Pong
  include #{mixin1}
  include #{mixin2}
  include #{mixin3}
  include #{mixin4}

  self.table_name = "pings"
  def self.wat
  end
end
STDOUT.puts "\#{Thread.current.inspect} #{model} loaded"
EOF

MIXIN1_BODY = <<-EOF
module #{mixin1}
  extend ActiveSupport::Concern
  def self.hi1
    puts "hi"
  end
end

STDOUT.puts "\#{Thread.current.inspect} #{mixin1} loaded"
EOF


MIXIN2_BODY = <<-EOF
module #{mixin2}
  extend ActiveSupport::Concern
  def self.hi2
    puts "hi"
  end
end

STDOUT.puts "\#{Thread.current.inspect} #{mixin2} loaded"
EOF

MIXIN3_BODY = <<-EOF
module #{mixin3}
  extend ActiveSupport::Concern
  def self.hi3
    puts "hi"
  end
end

STDOUT.puts "\#{Thread.current.inspect} #{mixin3} loaded"
EOF

MIXIN4_BODY = <<-EOF
module #{mixin4}
  extend ActiveSupport::Concern
  def self.hi4
    puts "hi"
  end
end

STDOUT.puts "\#{Thread.current.inspect} #{mixin4} loaded"
EOF

  File.write(model_file, MODEL_BODY)
  File.write(mixin1_file, MIXIN1_BODY)
  File.write(mixin2_file, MIXIN2_BODY)
  File.write(mixin3_file, MIXIN3_BODY)
  File.write(mixin4_file, MIXIN4_BODY)
end

