class Client < ActiveRecord::Base
	#validates :name, :presence => true, :message => 'Name cannot be blank'
	validates :name, :uniqueness => true

	def create_link (date)
		link = "https://nut.icpnet.pl/graph.php?action=zoom&local_graph_id=" + self.local_graph_id.to_s + "&rra_id=" + self.rra_id.to_s + "&view_type=&graph_start=" + date.beginning_of_month.to_i.to_s + "&graph_end=" + date.end_of_month.to_i.to_s + "&graph_height=120&graph_width=500&title_font_size=10"
		#link = "https://nut.icpnet.pl/graph_image.php?action=zoom&amp;local_graph_id=31430&amp;rra_id=3&amp;view_type=&amp;graph_start=1317957316&amp;graph_end=1348644146&amp;graph_height=120&amp;graph_width=500&amp;title_font_size=10"
		return link
	end
end
