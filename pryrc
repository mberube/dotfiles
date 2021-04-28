require "rubygems"
$LOAD_PATH << '/Users/mathieuberube/.rvm/gems/ruby-2.7.2@sh3/gems/awesome_print-1.9.2/lib'
require "awesome_print"

Pry.print = proc { |output, value| output.puts value.ai }

color_escape_codes = {
  black: "\033[0;30m",
  red: "\033[0;31m",
  green: "\033[0;32m",
  yellow: "\033[0;33m",
  blue: "\033[0;34m",
  purple: "\033[0;35m",
  cyan: "\033[0;36m",
  reset: "\033[0;0m"
}

env_colors = {
  "development" => color_escape_codes[:white],
  "test" => color_escape_codes[:purple],
  "staging" => color_escape_codes[:yellow],
  "production" => color_escape_codes[:red],
}

if defined? Rails
  Pry.config.prompt = proc do |obj, nest_level, _|
    color = env_colors.fetch(Rails.env, color_escape_codes[:reset])
    colored_environment_name = "#{color}#{Rails.env}#{color_escape_codes[:reset]}"
    "(#{colored_environment_name}) #{obj}:#{nest_level}> "
  end

  def enable_ar_log
    ActiveRecord::Base.logger = Rails.logger
  end
end

class Class
  public :include

  # Show only this class class methods
  def class_methods
    (methods - Class.instance_methods - Object.methods).sort
  end

  # Show instance and class methods
  def defined_methods
    methods = {}

    methods[:instance] = new.local_methods
    methods[:class] = class_methods

    methods
  end
end

class Object
  # Show local methods from the object's class
  def defined_methods
    (methods - Object.instance_methods).sort
  end

  # Open a particular method in an editor
  def ocode(method_name)
    file, line = self.method(method_name).source_location

    if file && line
      # or code -g
      `subl '#{file}:#{line}'`
    else
      "'#{method_name}' not found."
    end
  end
end
