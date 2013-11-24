# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



File.open("db/human_data_entry/states.tsv","r").each_line do |line|
    line = line.chop.try(:split, "\t") || next
    /\w/.match(line[0]) || next
    State.create(abbreviation: line[0],name: line[1])
end
File.open("db/human_data_entry/counties.tsv","r").each_line.with_index do |line, i|
    next if i == 0 
    line = line.chop.try(:split, "\t") || next
    /\w/.match(line[0]) || next
    state = State.where(id: line[1]).first
    # p "...#{line[0]}..."
    # p "...#{line[1]}..."
    County.create(name: line[0],state_id: state.id, code_id: line[2])
end
state = State.where(abbreviation: 'NE').first
county = County.where(name: "Douglas").last
city = City.create(name: 'Omaha', state_id: 27)
CityCounty.create(city_id: city.id, county_id: county.id)




my_boards = {}
my_departments = {}
File.open("db/human_data_entry/omaha-boards - boards.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
	temp = line.chop.try(:split, "\t") || next
    /\w/.match(temp[0]) || next
    temp = temp.collect{|x| x.strip}
    # p "...#{temp[0]}..."
    # p "...#{temp[0].strip}..."
    my_boards[temp[0]] = temp
    my_departments[temp[11].upcase] = 1
end


my_departments.each_key do |dept_name|
    d = Department.create(
        name: dept_name
    )
    my_departments[dept_name] = d
end

my_boards.each_key do |board_name|
    board = my_boards[board_name]
    # p "...#{board[20]}..."
    b = Board.create(
        title:             board[0],
        seats:             board[1],
        alternating_seats: board[2],
        qualifications:    board[5],
        department_id:     my_departments[board[11].upcase].id, 
        meeting_dates:     board[12],
        meeting_place:     board[14],
        meeting_time:      board[13],
        duties:            board[15],
        url:               board[16],
    #    term_length:       board[5],  TODD
        is_active:         1,
        state_id:          state.id,
        county_id:         county.id,
        city_id:           city.id,
        meeting_cron:      board[20] 
    )
    my_boards[board_name] = b
end

File.open("db/human_data_entry/omaha-boards - seats.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
    temp = line.chop.try(:split, "\t") || next
    /\w/.match(temp[0]) || next
    temp = temp.collect{|x| x.strip}
    board = my_boards[temp[0]]
    bs = BoardSeat.create(
        board_id:        board.id,
        # alternate:       
        qualifications:  temp[1], 
        # term_notes: 
        is_active:       1 
        # period:   
    )
end


File.open("db/human_data_entry/omaha-boards - people.tsv", "r").each_line.with_index do |line, i|
    next if i == 0 
    temp = line.chop.try(:split, "\t") || next
    /\w/.match(temp[0]) || next
    temp = temp.collect{|x| x.strip}
    board = my_boards[temp[2]]
    # p "...#{temp[2]}...#{board.id}..."
    m = Member.create(
        last_name:  temp[0],
        first_name: temp[1],
        is_active:  1
    )
    bs = BoardSeat.create(
        board_id:        board.id,
        # alternate:       
        # qualifications: 
        # term_notes: 
        is_active:       1 
        # period:   
    )
    bm = BoardMember.create(
        board_id:           board.id,
        member_id:          m.id,
        board_seat_id:      bs.id, 
        is_active:          1
        # installation_date:
        # appointment_date:
    )
end

