Web.helpers do
  def meetup_summary(meetup)
    if meetup
      time = (Time.at meetup.time.to_i / 1000).strftime("%b %d, %l:%M%p")
      link_to "#{meetup.name}, #{time} @ #{meetup.venue && meetup.venue.name}", meetup.event_url
    end
  end
end
