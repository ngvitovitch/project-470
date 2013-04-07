class Chore < ActiveRecord::Base
  attr_accessible :assigned_user_id, :description, :dwelling_id, :name
end
