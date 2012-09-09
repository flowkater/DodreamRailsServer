class PicturesController < InheritedResources::Base
	before_filter :load_imageable
	belongs_to :goal, :post, polymorphic: true

	def create
		# create! { store_path(@imageable.store_id)}
		create! { parent_url }
	end

	private
	def load_imageable
		resource, id = request.path.split('/')[1,2]
		@imageable = resource.singularize.classify.constantize.find(id)		
	end
end
