# frozen_string_literal: true

# Migrate

desc 'Migrate database to latest version'
namespace :db do
  task :up do
    require_relative 'db'
    require 'logger'

    DB.loggers << Logger.new($stdout) if DB.loggers.empty?

    Sequel.extension :migration
    Sequel::Migrator.apply(DB, 'migrate')
  end
end

# Shell

desc 'Open irb shell'
task :irb do
  trap('INT', 'IGNORE')

  dir, base = File.split(FileUtils::RUBY)
  cmd = if base.sub!(/\Aruby/, 'irb')
          File.join(dir, base)
        else
          "#{FileUtils::RUBY} -S irb"
        end

  sh "#{cmd} -r ./models"
end

# Utils

desc 'Setup project'
task :setup do
  create_dot_env_file
  create_logs_dir if ENV['RACK_ENV'] == 'production'
end

def self.create_dot_env_file
  File.open('.env.rb', 'w') do |file|
    file.write("ENV['STUDDY_BUDDY_DATABASE_URL'] ||= 'postgres:///studdy_buddy?user=studdy_buddy'\n")
  end
end

def self.create_logs_dir(dir = 'logs')
  return if Dir.exist?(dir)

  Dir.mkdir(dir)
end
