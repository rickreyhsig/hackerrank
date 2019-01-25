# html_helper.rb contains the logic for parsing HTML and getting useful URIs from it

module HtmlHelper
  def clean_up_href(href)
    # Browsers do all kinds of crazy things to make their hrefs valid even when they're
    # sketchy. For example, spaces get autoescaped on Chrome.
    href.gsub(" ", "%20")
  end

  def absolutize_path(path, base_path)
    if path != "" && path[0] != "/" || path[0..1] == "/."
      base_path_sections = base_path.split("/")
      base_path_sections.pop if base_path[-1] != "/"
      sections = base_path_sections + path.split("/")

      out = []

      sections.each do |section|
        case section
        when ".", ""
          # do nothing
        when ".."
          out.pop
        else
          out << section
        end
      end

      "/" + out.join("/")
    else
      path
    end
  end

  def get_neighbors(body_str, uri_string)
    paths_to_follow = get_url_strings_from_doc(body_str)

    get_uris_from_page(paths_to_follow, uri_string)
  end

  def get_uris_from_page(paths_to_follow, uri_string)
    parent_uri_object = URI(uri_string)

    [].tap do |out|
      paths_to_follow.each do |href|
        href = clean_up_href(href)

        next if href == ""

        begin
          child_uri_object = URI(href)
        rescue => e
          note_error("The page #{parent_uri_object} has an href of #{href}, which caused this error: #{e}")
          next
        end

        next if child_uri_object.scheme == "mailto"

        child_uri_object.fragment = nil

        if child_uri_object.path
          child_uri_object.path = absolutize_path(child_uri_object.path, parent_uri_object.path)
        end

        child_uri_object.scheme ||= "http"

        if child_uri_object.host.nil?
          child_uri_object.host = parent_uri_object.host
          child_uri_object.port = parent_uri_object.port if parent_uri_object.port != 80 && parent_uri_object.port != 443
        end

        out << child_uri_object
      end
    end
  end

  def get_hrefs_from_a_tags(body_str)
    body_str.scan(/<a [^>]*href="([^"]*)"/).map { |x| x[0] }
  end

  def get_hrefs_from_link_tags(body_str)
    body_str.scan(/<link [^>]*href="([^"]*)"/).map { |x| x[0] }
  end

  def get_srcs_from_script_tags(body_str)
    body_str.scan(/<script [^>]*src="([^"]*)"/).map { |x| x[0] }
  end

  def get_url_strings_from_doc(body_str)
    (get_hrefs_from_a_tags(body_str) +
      get_hrefs_from_link_tags(body_str) +
      get_srcs_from_script_tags(body_str)
    )
  end

end
