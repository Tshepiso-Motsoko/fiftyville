SELECT * FROM crime_scene_reports WHERE street='Humphrey Street';
-- Given: Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery.
SELECT * FROM interviews WHERE month='7' and day='28';
-- Given: | 161 | Ruth    | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
-- Given: | 162 | Eugene  | 2021 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
-- Given: | 163 | Raymond | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |

SELECT * FROM bakery_security_logs WHERE day='28' and hour='10' and activity='exit';
-- Given: +-----+------+-------+-----+------+--------+----------+---------------+
--| id  | year | month | day | hour | minute | activity | license_plate |
--+-----+------+-------+-----+------+--------+----------+---------------+
--| 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
--| 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
--| 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
--| 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
--| 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
--| 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
--| 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
--| 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
--| 268 | 2021 | 7     | 28  | 10   | 35     | exit     | 1106N58       |
--+-----+------+-------+-----+------+--------+----------+---------------+
SELECT * FROM atm_transactions WHERE day='28' and month='7' and  atm_location='Leggett Street' and transaction_type='withdraw';
-- Given: +-----+----------------+------+-------+-----+----------------+------------------+--------+
--| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
--| 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
--| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
--| 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
--| 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
--| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
SELECT * FROM phone_calls WHERE day='28' and month='7' and duration<60;
-- given: +-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2021 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2021 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2021 | 7     | 28  | 50       |
| 254 | (286) 555-6063 | (676) 555-6554 | 2021 | 7     | 28  | 43       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2021 | 7     | 28  | 49       |
| 261 | (031) 555-6622 | (910) 555-3251 | 2021 | 7     | 28  | 38       |
| 279 | (826) 555-1652 | (066) 555-9701 | 2021 | 7     | 28  | 55       |
| 281 | (338) 555-6650 | (704) 555-2131 | 2021 | 7     | 28  | 54       |
+-----+----------------+----------------+------+-------+-----+----------+
SELECT * FROM airports;
+----+--------------+-----------------------------------------+---------------+
| id | abbreviation |                full_name                |     city      |
+----+--------------+-----------------------------------------+---------------+
| 1  | ORD          | O'Hare International Airport            | Chicago       |
| 2  | PEK          | Beijing Capital International Airport   | Beijing       |
| 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
| 4  | LGA          | LaGuardia Airport                       | New York City |
| 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
| 6  | BOS          | Logan International Airport             | Boston        |
| 7  | DXB          | Dubai International Airport             | Dubai         |
| 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
| 9  | HND          | Tokyo International Airport             | Tokyo         |
| 10 | CDG          | Charles de Gaulle Airport               | Paris         |
| 11 | SFO          | San Francisco International Airport     | San Francisco |
| 12 | DEL          | Indira Gandhi International Airport     | Delhi         |
+----+--------------+-----------------------------------------+---------------+

SELECT * FROM flights WHERE origin_airport_id='8' and day='29' and month='7';

+----+-------------------+------------------------+------+-------+-----+------+--------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+----+-------------------+------------------------+------+-------+-----+------+--------+
| 18 | 8                 | 6                      | 2021 | 7     | 29  | 16   | 0      |
| 23 | 8                 | 11                     | 2021 | 7     | 29  | 12   | 15     |
| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 43 | 8                 | 1                      | 2021 | 7     | 29  | 9    | 30     |
| 53 | 8                 | 9                      | 2021 | 7     | 29  | 15   | 20     |
+----+-------------------+------------------------+------+-------+-----+------+--------+
SELECT * FROM bank_accounts WHERE account_number='28500762';
+----------------+-----------+---------------+
| account_number | person_id | creation_year |
+----------------+-----------+---------------+
| 28500762       | 467400    | 2014          |
+----------------+-----------+---------------+

SELECT * FROM bank_accounts WHERE account_number='28296815';
+----------------+-----------+---------------+
| account_number | person_id | creation_year |
+----------------+-----------+---------------+
| 28296815       | 395717    | 2014          |
+----------------+-----------+---------------+

SELECT * FROM bank_accounts JOIN atm_transactions ON  bank_accounts.account_number = atm_transactions.account_number WHERE day='28' and month='7' and atm_location='Leggett Street' and transaction_type='withdraw';
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+
| account_number | person_id | creation_year | id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 28500762       | 467400    | 2014          | 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
| 28296815       | 395717    | 2014          | 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 76054385       | 449774    | 2015          | 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
| 49610011       | 686048    | 2010          | 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
| 16153065       | 458378    | 2012          | 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
| 25506511       | 396669    | 2014          | 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 81061156       | 438727    | 2018          | 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
| 26013199       | 514354    | 2012          | 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+

SELECT * FROM people LIMIT 2;
+--------+--------+----------------+-----------------+---------------+
|   id   |  name  |  phone_number  | passport_number | license_plate |
+--------+--------+----------------+-----------------+---------------+
| 205082 | Pamela | (113) 555-7544 | 1050247273      | 5CIO816       |
| 210245 | Jordan | (328) 555-9658 | 7951366683      | HW0488P       |
+--------+--------+----------------+-----------------+---------------+

SELECT * FROM bank_accounts JOIN atm_transactions ON  bank_accounts.account_number = atm_transactions.account_number JOIN people ON people.id =
 bank_accounts.person_id  WHERE day='28' and month='7' and atm_location='Leggett Street' and transaction_type='withdraw';
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+--------+---------+----------------+-----------------+---------------+
| account_number | person_id | creation_year | id  | account_number | year | month | day |  atm_location  | transaction_type | amount |   id   |  name   |  phone_number  | passport_number | license_plate |
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+--------+---------+----------------+-----------------+---------------+
| 49610011       | 686048    | 2010          | 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
| 26013199       | 514354    | 2012          | 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
| 16153065       | 458378    | 2012          | 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     | 458378 | Brooke  | (122) 555-4581 | 4408372428      | QX4YZN3       |
| 28296815       | 395717    | 2014          | 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 395717 | Kenny   | (826) 555-1652 | 9878712108      | 30G67EN       |
| 25506511       | 396669    | 2014          | 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 28500762       | 467400    | 2014          | 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     | 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| 76054385       | 449774    | 2015          | 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     | 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       |
| 81061156       | 438727    | 2018          | 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     | 438727 | Benista | (338) 555-6650 | 9586786673      | 8X428L0       |
+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+--------+---------+----------------+-----------------+---------------+

SELECT *
   ...> FROM bank_accounts
   ...> JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
   ...> JOIN people ON people.id = bank_accounts.person_id
   ...> JOIN bakery_security_logs ON bakery_security_logs.license_plate = people.license_plate
   ...> WHERE atm_transactions.month='7'
   ...> and bakery_security_logs.activity='exit'
   ...> and atm_transactions.atm_location='Leggett Street'
   ...> and atm_transactions.transaction_type='withdraw'
   ...> and bakery_security_logs.hour='10';
+----------------+-----------+---------------+------+----------------+------+-------+-----+----------------+------------------+--------+--------+-----------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+
| account_number | person_id | creation_year |  id  | account_number | year | month | day |  atm_location  | transaction_type | amount |   id   |   name    |  phone_number  | passport_number | license_plate | id  | year | month | day | hour | minute | activity | license_plate |
+----------------+-----------+---------------+------+----------------+------+-------+-----+----------------+------------------+--------+--------+-----------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+
| 49610011       | 686048    | 2010          | 39   | 49610011       | 2021 | 7     | 26  | Leggett Street | withdraw         | 10     | 686048 | Bruce     | (367) 555-5533 | 5773159633      | 94KL13X       | 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 49610011       | 686048    | 2010          | 267  | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     | 686048 | Bruce     | (367) 555-5533 | 5773159633      | 94KL13X       | 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 32212020       | 230917    | 2012          | 211  | 32212020       | 2021 | 7     | 27  | Leggett Street | withdraw         | 55     | 230917 | Karen     | (841) 555-3728 | 5031682798      | IH61GO8       | 463 | 2021 | 7     | 31  | 10   | 24     | exit     | IH61GO8       |
| 26013199       | 514354    | 2012          | 336  | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     | 514354 | Diana     | (770) 555-1861 | 3592750733      | 322W7JE       | 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 73183211       | 730171    | 2014          | 114  | 73183211       | 2021 | 7     | 26  | Leggett Street | withdraw         | 50     | 730171 | Ann       | (601) 555-6795 | 4215752756      | 84869TJ       | 468 | 2021 | 7     | 31  | 10   | 35     | exit     | 84869TJ       |
| 73183211       | 730171    | 2014          | 660  | 73183211       | 2021 | 7     | 30  | Leggett Street | withdraw         | 65     | 730171 | Ann       | (601) 555-6795 | 4215752756      | 84869TJ       | 468 | 2021 | 7     | 31  | 10   | 35     | exit     | 84869TJ       |
| 15452229       | 337221    | 2014          | 1006 | 15452229       | 2021 | 7     | 31  | Leggett Street | withdraw         | 60     | 337221 | Christine | (608) 555-9302 | NULL            | XE95071       | 462 | 2021 | 7     | 31  | 10   | 21     | exit     | XE95071       |
| 25506511       | 396669    | 2014          | 288  | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 396669 | Iman      | (829) 555-5269 | 7049073643      | L93JTIZ       | 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 28500762       | 467400    | 2014          | 246  | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     | 467400 | Luca      | (389) 555-5198 | 8496433585      | 4328GD8       | 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 76054385       | 449774    | 2015          | 266  | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     | 449774 | Taylor    | (286) 555-6063 | 1988161715      | 1106N58       | 268 | 2021 | 7     | 28  | 10   | 35     | exit     | 1106N58       |
| 21149684       | 375525    | 2016          | 52   | 21149684       | 2021 | 7     | 26  | Leggett Street | withdraw         | 95     | 375525 | Noah      | (959) 555-4871 | 1095374669      | 11J91FW       | 459 | 2021 | 7     | 31  | 10   | 15     | exit     | 11J91FW       |
| 37033371       | 809194    | 2017          | 1045 | 37033371       | 2021 | 7     | 31  | Leggett Street | withdraw         | 15     | 809194 | Alice     | (031) 555-9915 | 1679711307      | 1M92998       | 461 | 2021 | 7     | 31  | 10   | 20     | exit     | 1M92998       |
+----------------+-----------+---------------+------+----------------+------+-------+-----+----------------+------------------+--------+--------+-----------+----------------+-----------------+---------------+-----+------+-------+-----+------+--------+----------+---------------+