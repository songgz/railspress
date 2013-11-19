module ApplicationHelper

	# Return full title.
	# Set <% provide(:title, 'Home') %> in each page.
	def full_title(page_title)
		base_title = RP_SITENAME
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	class HTML < Redcarpet::Render::HTML
	  include Rouge::Plugins::Redcarpet
	end

	def markdown(text)
	  render_options = {
	    filter_html:     false,
	    hard_wrap:       true, 
	    #link_attributes: { rel: 'nofollow' }
	  }
	  renderer = HTML.new(render_options)

	  extensions = {
	    autolink:           true,
	    fenced_code_blocks: true,
	    lax_spacing:        true,
	    no_intra_emphasis:  true,
	    strikethrough:      true,
	    superscript:        true,
	  }
	  Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
	end

	def extracter(str)
		str_array = str.split('<!-- extract -->')
		str_array[0]
	end

	def make_extract_bigger(str)
		str_array = str.split('<!-- extract -->')
		"<p class='lead'>#{str_array[0]}</p>#{str_array[1]}"
	end

	# Use wrap method for text when you want to keep the layout.
	def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  	private

	    def wrap_long_string(text, max_width = 30)
			zero_width_space = "&#8203;"
			regex = /.{1,#{max_width}}/
			(text.length < max_width) ? text :
			                    text.scan(regex).join(zero_width_space)
	    end

end