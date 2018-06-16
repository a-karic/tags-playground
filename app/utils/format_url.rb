# frozen_string_literal: true

class FormatUrl
  def initialize(url)
    @url = url
  end

  def formated_url
    "#{uri.host}#{uri.path}/#{params_sorted}"
  end

  private

  def uri
    URI.parse(@url)
  end

  def params
    CGI.parse(uri.query) if uri.query.present?
  end

  def params_sorted
    return unless params
    sorted = params.sort
    URI.encode_www_form sorted
  end
end
