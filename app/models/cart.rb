class Cart
  attr_reader :contents

  def initialize(session_contents)
    @contents = session_contents || []
  end

  def add_home(home_id, checkin, checkout)
    @contents << {
      "home"     => home_id,
      "checkin"  => checkin,
      "checkout" =>  checkout,
    }
  end

  def total
    reservations.reduce(0) { |sum, reservation| sum + reservation.total }
  end

  def reservations
    @contents.map { |content| CartReservation.new(content) }
  end

  def clear_contents
    @contents = []
  end

  def quantity
    @contents.size
  end

  def format_dates(date)
    formatted_date = Hash.new
    3.times { |n| formatted_date["date(#{n + 1}i)"] = date.split("/")[n] }
    formatted_date
  end
end
