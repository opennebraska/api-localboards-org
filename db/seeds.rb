# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if (County.where(name: 'Douglas').empty? && City.where(name: 'Omaha').empty?)
	state = State.create(name: 'Nebraska')
	county = County.create(name: 'Douglas', state_id: state.id)
	city = City.create(name: 'Omaha')
	CityCounty.create(city_id: city.id, county_id: county.id)
end

File.open("db/human_data_entry/omaha-boards - boards.tsv", "r").each_line do |line|
	temp = line.chop.split("\t")
	Board.create(
		title:             temp[0],
		seats:             temp[1],
		alternating_seats: temp[2]
	)
end



