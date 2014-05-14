# Local Boards API


About
------
### Description

A REST API for state, county, and city boards. Created at #HackOmaha 2013

[Looking for the UI?](https://github.com/trakaus/localboards-ui)

We're slowly adding in authentication. Just don't do anything you wouldn't want your mother to see, for now.

Contact
------
We're on Twitter! [@openlocalboards](http://twitter.com/openlocalboards)


### Base path
<tt>http://api.localboards.org</tt>


### GET jurisdictions

Get all states
<tt>/states</tt> 

Get all cities in a state
<tt>/states/:state_abbreviation</tt> 

Get all counties in a state
<tt>/states/:state_abbreviation/counties</tt> 


### GET boards

Get all boards in a specific state
<tt>/states/:state_abbreviation/boards</tt> 

Get all boards in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards</tt> 

Get all boards in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards</tt> 

### POST board

Post a board in a specific state
<tt>/states/:state_abbreviation/boards/:board_id</tt> 

Post a board in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:board_id</tt> 

Post a board in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:board_id</tt> 

Example Board Data
```
data: {
  board: {
    title: "Our awesome board",
    seats: 1000000,
    alternating_seats: 17,
    url: "www.ronpaul2012.com"
  }
}
```

### GET members

Get all members in a specific state
<tt>/states/:state_abbreviation/boards/:id/members</tt> 

Get all members in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id/members</tt> 

Get all members in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id/members</tt> 

###### Params

active = [true,false,all]
<br/>
defaults to true

### POST member

Post a member in a specific state board
<tt>/states/:state_abbreviation/boards/:board_id/members</tt> 

Post a member in a specific county board
<tt>/states/:state_abbreviation/county/:code_id/boards/:board_id/members</tt> 

Post a member in a specific city board
<tt>/states/:state_abbreviation/city/:city_id/boards/:board_id/members</tt> 

Example Member Data
```
data: {
  member: {
    first_name: "John",
    last_name: "Smith",
    board_seat_id: 1
  }
}
```

The board seat id can be retrieved from the id returned by the seats api.

### GET seats

Get all seats in a specific state
<tt>/states/:state_abbreviation/boards/:id/seats</tt> 

Get all seats in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id/seats</tt> 

Get all seats specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id/seats</tt> 

### POST seat

Post a member in a specific state board
<tt>/states/:state_abbreviation/boards/:board_id/members</tt> 

Post a member in a specific county board
<tt>/states/:state_abbreviation/county/:code_id/boards/:board_id/members</tt> 

Post a member in a specific city board
<tt>/states/:state_abbreviation/city/:city_id/boards/:board_id/members</tt> 

Example Member Data
```
data: {
  board_seat: {
    alternate: True,
    title: "Fire Marshall"
  }
}
```

### GET a specific board

in a specific state
<tt>/states/:state_abbreviation/boards/:id</tt> 

in a specific county
<tt>/states/:state_abbreviation/county/:code_id/boards/:id</tt> 

in a specific city
<tt>/states/:state_abbreviation/city/:city_id/boards/:id</tt> 

We need you
------

` Who? Me? `
` Yes you! `
` But all I know is RSpec! `
` Well that's perfect! `
` Why? `
` Because we need tests! `
