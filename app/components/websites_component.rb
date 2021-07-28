# frozen_string_literal: true

class WebsitesComponent < MainComponent
  attr_reader :websites

  def initialize(websites:)
    @websites = websites
  end

  def klasses(index)
    case websites.size
    when 4 then 'col-span-1 row-span-1'
    when 3 then "col-span-#{[0, 1].include?(index) ? 1 : 2} row-span-1"
    when 2 then 'col-span-1 row-span-2'
    when 1 then 'col-span-2 row-span-2'
    end
  end
end
