class Dwelling < ActiveRecord::Base
	# Accessible Attributes
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
	after_create :create_sns_topic
	after_destroy :delete_sns_topic

	def topic
		sns = AWS::SNS.new
		return sns.topics[topic_name]
	end
	private

	def topic_name
		return "#{id}_#{name.gsub(/ /, '_')}"
	end

	def create_sns_topic
		sns = AWS::SNS.new
		puts topic_name
		sns.topics.create(topic_name)
	end

	def destroy_sns_topic
		sns = AWS::SNS.new
		sns.topics[topic_name].delete
	end

  def ensure_owner_has_this_dwelling
    self.owner.dwelling = self
    self.owner.save
  end
end
