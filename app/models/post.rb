class Post < ActiveRecord::Base
	has_many :comments
	has_many :references
	has_many :tags, :through => :references
  attr_writer :tag_names
	after_save :assign_tags
  
  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end
  
  private
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
    	end
    end
  end
end
