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
  env_variables_line = "ENV['STUDDY_BUDDY_DATABASE_URL'] ||= 'postgres:///studdy_buddy?user=studdy_buddy'\n"
  File.open('.env.rb', 'w') { |file| file.write(env_variables_line) }
end
