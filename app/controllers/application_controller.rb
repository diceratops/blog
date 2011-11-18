class ApplicationController < ActionController::Base
	before_filter :find_recent_entries
	protect_from_forgery
	
	def find_recent_entries
		@recent_posts = Post.limit(3).order("created_at DESC")
	end
	
end
