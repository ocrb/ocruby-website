Web.helpers do
  def meetup_summary(meetup)
    if meetup
      link_to "#{meetup.name} @ #{meetup.venue && meetup.venue.name}", meetup.event_url
    end
  end
end
