def link_to_navigation(text, path)

  if @item_rep and @item_rep.path == "#{ File.dirname(path) }/"
    "<a href='#{path}' class='active'>#{text}</a>" 
  else 
    "<a href='#{path}'>#{text}</a>" 
  end 
end 
