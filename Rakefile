#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

namespace :aws do
	namespace :sns do
		desc "Delete All SNS Topics (all of them, not just ones associated with this project)"
		task :delete => :environment do
			print "Deleting all sns topics:"
			sns = AWS::SNS.new
			sns.topics.each { |topic| topic.delete }
			puts " Done."
		end
	end
end

namespace :db do
	desc "Delete SNS Topics"
	task :delete_topics => :environment do
		print 'Deleting SNS Topics:'
		Dwelling.all.each do |dwelling|
			dwelling.destroy
		end
		puts ' Done.'
	end

	desc "Delete SNS Topics"
	task :reset => :delete_topics
	desc "Delete SNS Topics"
	task :drop => :delete_topics
end
Roomie::Application.load_tasks


