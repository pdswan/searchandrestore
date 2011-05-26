def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "bundle exec rspec #{file}"
  puts
end

def run_migrations
  puts "Migrating Database"
  system "rake db:migrate"
  puts "Preparing Test Database"
  system "rake db:test:prepare"
end

watch("db/migrate/.*\.rb") do |match|
  run_migrations
end

watch("spec/.*/*_spec\.rb") do |match|
  run_spec match[0]
end

watch("app/(.*/.*)\.rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end
