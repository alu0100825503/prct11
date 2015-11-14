require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar las expectativas de la clase Bibliograph"
  task :spec do
  	sh "rspec -I. spec/bibliografia_spec.rb"
  	sh "rspec -I. spec/linkedlist_spec.rb"
  end

