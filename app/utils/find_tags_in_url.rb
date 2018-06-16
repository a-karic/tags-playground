# frozen_string_literal: true

require 'open-uri'

class FindTagsInUrl
  def initialize(url)
    uri = URI(url)
    @html = Nokogiri::HTML(uri.read)
    @meta_tags = @html.css('meta')
    @keywords = mapped_keywords.join.split(',')
    @words = @html.css('body').text.split(' ')
  end

  def top_tags
    tags = count_and_sort_tags
    tags.take(10)
  end

  private

  def find_keywords
    @meta_tags.select do |tag|
      next unless tag.attributes['name'].try(:value) == 'keywords'
      tag.attributes['content'].value
    end
  end

  def mapped_keywords
    keywords = find_keywords
    keywords.map { |keyword| keyword.attributes['content'].try(:value) }
  end

  def founded_in_text(keyword)
    counter = 0
    @words.each do |word|
      counter += 1 if keyword.include?(word)
    end
    counter
  end

  def count_and_sort_tags
    output = []
    @keywords.each do |keyword|
      el = {
        name: keyword,
        count: founded_in_text(keyword)
      }
      output << el
    end
    output.sort_by { |hsh| hsh[:count] }.reverse!
  end
end
