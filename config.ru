require './config/environment'

begin
  fi_check_migration

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride

run ApplicationController
