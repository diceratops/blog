class Comment < ActiveRecord::Base
	belongs_to :post
	validates_presence_of :name, :email, :body
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	def gravatar_url options = {}
    options = {:alt => 'avatar', :class => 'avatar', :size => 50}.merge! options
		if self.email.nil?
			id = ''
		else	    
			id = Digest::MD5::hexdigest self.email.strip.downcase
		end    
		url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
    options.delete :size
		url
	end

end
