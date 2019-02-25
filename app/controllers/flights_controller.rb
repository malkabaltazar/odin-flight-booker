class FlightsController < ApplicationController
  def index
    @from_airports = Flight.all.map{ |f| [f.from_airport.airport,
                                          f.from_airport.id] }.uniq
    @to_airports   = Flight.all.map{ |f| [f.to_airport.airport,
                                          f.to_airport.id] }.uniq
    @passengers = [1, 2, 3, 4]
    @dates = Flight.all.map{ |f| f.start.strftime("%m/%d/%Y") }.uniq
    if params[:commit]
      time = DateTime.strptime(params[:flight][:date], "%m/%d/%Y").to_s.truncate(11, omission: "%")
      from = params[:flight][:from_airport]
      to = params[:flight][:to_airport]
      @results = Flight.where("from_airport_id = ? and to_airport_id = ? and
                               start LIKE ?", from, to, time)
      @count = params[:flight][:passengers]
    end
  end
end
