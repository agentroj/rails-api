# rails-api

How to Test via Postman:

1. Clone the repo from master branch
2. run database magration via rails
3. Open Postman app
4. Create a new Collection and add a Request
5. set POST and put this value in the url:
  http://localhost:3000/api/v1/reservation
6. Select a body from the 2 payloads
  Payload 1:
  {
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "nights": 4,
    "guests": 4,
    "adults": 2,
    "children": 2,
    "infants": 0,
    "status": "accepted",
    "guest": {
        "id": 1,
        "first_name": "Wayne",
        "last_name": "Woodbridge",
        "phone": "639123456789",
        "email": "wayne_woodbridge@bnb.com"
        },
    "currency": "AUD",
    "payout_price": "3800.00",
    "security_price": "500",
    "total_price": "4500.00"
}

Payload 2:
{
"reservation": {
"start_date": "2021-03-12",
"end_date": "2021-03-16",
"expected_payout_amount": "3800.00",
"guest_details": {
"localized_description": "4 guests",
"number_of_adults": 2,
"number_of_children": 2,
"number_of_infants": 0
},
"guest_email": "wayne_woodbridge@bnb.com",
"guest_first_name": "Wayne",
"guest_id": 1,
"guest_last_name": "Woodbridge",
"guest_phone_numbers": [
"639123456789",
"639123456789"
],
"listing_security_price_accurate": "500.00",
"host_currency": "AUD",
"nights": 4,
"number_of_guests": 4,
"status_type": "accepted",
"total_paid_amount_accurate": "4500.00"
}
}

7. Click Send and you should be able to see the message  {status: '200', message: 'Successful'}
8.  To Checkif the data has been saved, go to this endpoint via browser:
http://localhost:3000/api/v1/reservation

or in postman, create a GTE request and put the URL http://localhost:3000/api/v1/reservation and click Send
