def rich_text_area(object_name, method, options = {})
  Tags::ActionText.new(object_name, method, self, options).render
end
