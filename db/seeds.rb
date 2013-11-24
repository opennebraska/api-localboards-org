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




my_boards = []
my_departments = {}
File.open("db/human_data_entry/omaha-boards - boards.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
	temp = line.chop.split("\t")
    next unless temp[0]
    temp = temp.collect{|x| x.strip}
    # p "...#{temp[0]}..."
    # p "...#{temp[0].strip}..."
    my_boards << temp
    my_departments[temp[11].upcase] = 1
end

my_departments.each_key do |key|
    d = Department.create(
        name: key
    )
    my_departments[key] = d.id
end

my_boards.each do |board|
    # p "...#{board[20]}..."
    Board.create(
        title:             board[0],
        seats:             board[1],
        alternating_seats: board[2],
        qualifications:    board[5],
        department_id:     my_departments[board[11].upcase], 
        meeting_dates:     board[12],
        meeting_place:     board[14],
        meeting_time:      board[13],
        duties:            board[15],
        url:               board[16],
    #    term_length:       board[5],  TODD
        is_active:         1,
        state_id:          1,
        county_id:         1,
        city_id:           1,
        meeting_cron:      board[20] 
    )
end




my_people = []
File.open("db/human_data_entry/omaha-boards - people.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
    temp = line.chop.split("\t")
    temp = temp.collect{|x| x.strip}
#    Member.create(
#   )
end


