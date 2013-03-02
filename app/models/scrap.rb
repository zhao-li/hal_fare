class Scrap

  attr_accessor :origin, :destination, :travelers, :departure_date

  # origin / destintaion - airport.code
  def initialize(origin, destination, options={})
    options         = {} unless options.is_a? Hash # ignore unless options
    @agent          = create_secure_agent
    @origin         = origin
    @destination    = destination
    @travelers      = options[:travelers] || 2
    #@departure_date = format_departure(options[:departure_date] || 1.day.from_now.localtime)
    @departure_date = format_departure 1.day.from_now.localtime
  end

  def get_fares_by_day(outbound=true)
    page          = get_page(outbound)

    page.css('td.CalendarDayDefault').each_with_object({}) do |day_fare, all| 
      day   = day_fare.css('.Text').first.content
      fare  = day_fare.css('.Fare').first.content

      puts "day: #{day} / fare: #{fare}"

      all[day] = fare
      # day, fare = day_fare.content.split("$")
      # all[day]  = fare
    end
  end

  def temp_url
    "https://fly.hawaiianairlines.com/Calendar/Calendar.aspx?orig=PDX&dest=HNL&traveler=1&isDM=false&isRoundTrip=true&depDate=5/9/2013&owORob=false&isEAward=false"
  end

  private 

  def format_departure(date_or_time)
    unless [ActiveSupport::TimeWithZone, Time, Date].include? date_or_time.class
      raise ArgumentError, "Expected departure_date to be a Date or Time"
    end
    date_or_time.strftime('%m/%d/%y')
  end

  def create_secure_agent
    agent              = Mechanize.new
    agent.ssl_version  = 'SSLv3'
    agent
  end

  def get_page(outbound=true)
    file = @agent.get calendar_url(outbound)
    Nokogiri::HTML.parse "<html>#{file.content}</html>"
  end

  def calendar_url(outbound=true)
    "https://fly.hawaiianairlines.com/Calendar/Calendar.aspx?orig=#{origin}&dest=#{destination}&traveler=#{travelers}&depDate=#{@departure_date}&owORob=#{outbound}&isDM=false&isRoundTrip=true&isEAward=false".tap { |url| puts url}
  end

end
