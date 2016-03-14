class AddContribExtensions < ActiveRecord::Migration
  def change
      execute 'CREATE EXTENSION pg_trgm;'
      execute 'CREATE EXTENSION fuzzystrmatch;'
      execute("CREATE EXTENSION unaccent;")
  end
end
