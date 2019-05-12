module ToDosHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		link_to title, {:sort => column}, class: "todoHead"
	end
end