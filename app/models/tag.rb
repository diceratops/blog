class Tag < ActiveRecord::Base
	has_many :references
	has_many :posts, :through => :references
end
