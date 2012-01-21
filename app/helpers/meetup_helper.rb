Web.helpers do
  def meetup_summary(meetup)
    "#{meetup.name} @ #{meetup.venue && meetup.venue.name}" if meetup
  end
end
