class Dwelling < ActiveRecord::Base
	# Accessible Attributes
	attr_accessor :topic # dwellings sns topic
  attr_accessible :name, :owner, :time_zone

	# Relations
  belongs_to :owner, :class_name => 'User'
  has_many :users
  has_many :invites
  has_many :bills
  has_many :events
  has_many :chores
  has_many :shopping_lists
  has_many :comments
	
	# message has the subtype post and notification
	# there might be a way to simplify these lines
  has_many :messages
  has_many :posts
  has_many :notifications

	# Validations
  validates_presence_of :name, :owner

	# Callbacks
  after_save :ensure_owner_has_this_dwelling

	before_create :create_sns_topic, :if => :valid?
	after_destroy :delete_sns_topic

	# Amazon SNS topic for this dwelling
	def topic
		return @topic ||= get_topic
	end

	private

	def get_topic
		sns = AWS::SNS.new
		if topic_arn
			begin
				@topic = sns.topics[topic_arn]
			rescue AWS::SNS::Errors::Base => error
				@topic = nil
			end
		else
			@topic = nil
		end
	end

	# Create an sns topic with the dwellings name as it's name
	# and display name
	def create_sns_topic
		sns = AWS::SNS.new
		@topic = sns.topics.create(name.gsub(/ /, '_'))
		@topic.display_name = name
		self.topic_arn = topic.arn
	end

	def delete_sns_topic
		topic.delete if topic
	end

  def ensure_owner_has_this_dwelling
    self.owner.dwelling = self
    self.owner.save
  end
end
