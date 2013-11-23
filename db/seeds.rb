# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if (County.where(name: 'Douglas').empty? && City.where(name: 'Omaha').empty?)
	state = State.create(name: 'Nebraska', abbreviation: 'ne')
	county = County.create(name: 'Douglas', state_id: state.id)
	city = City.create(name: 'Omaha')
	CityCounty.create(city_id: city.id, county_id: county.id)
end

File.open("db/human_data_entry/omaha-boards - boards.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
	temp = line.chop.split("\t")
    temp.collect{|x| x.strip}
    # p "...#{temp[0]}..."
    # p "...#{temp[0].strip}..."
	Board.create(
		title:             temp[0].strip,
		seats:             temp[1],
		alternating_seats: temp[2],
        qualifications:    temp[5],
    #    department_id:     temp[11],  TODO 
        meeting_dates:     temp[12],
        meeting_place:     temp[14],
        meeting_time:      temp[13],
        duties:            temp[15],
        url:               temp[17],
    #    term_length:       temp[5],  TODD
        is_active:         1
    #    state_id:          temp[5],
    #    county_id:         temp[5],
    #    city_id:           temp[5],
	)
end



