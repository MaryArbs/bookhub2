module BooksHelper
    #use ruby not ERB

    def display_nested_author
        if @author
          content_tag(:h1, @author.name)
        else
          content_tag(:h1, "All Books")
        end
     end
end
