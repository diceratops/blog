class Post < ActiveRecord::Base
	has_many :comments
	has_many :references
	has_many :tags, :through => :references
end
