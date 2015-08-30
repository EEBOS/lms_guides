---
title: Train Sessions
---


## Train Sessions

A `TrainSession` represents a training record in the system. Train Sessions track information such as: date of completion, score, date of assignation, percent complete, etc.

The `/api/train_sessions/` endpoint implements RESTful methods to let you interact with your data.

## Methods

### Index

`https://learninglogin.com/api/train_sessions`

To retrieve the list of train sessions available for your account, simply send a `GET` request to the URL above. Optionally, you can pass a series of filters for searching purposes.

#### Available search filters

All of these parameters should be sent in as GET parameters.

All date parameters should be sent in a `YYYY-MM-DD` format.

| Name                             | Type   | Description                                                           |
|----------------------------------|--------|-----------------------------------------------------------------------|
| course_code_or_course_name_cont  | string | Filter by course code or course name.                                  |
| full_name_cont                   | string | Filter by full name.                                                   |
| score_eq                         | string | Filter by score.                                                       |
| completion_date_gteq             | string | Filter by completion date greater or equal to the date provided.       |
| completion_date_lteq             | string | Filter by completion date less than or equal to the date provided.     |
| cert_expiry_gt                   | string | Filter by certificate expiry greater or equal to the date provided.    |
| cert_expiry_lt                   | string | Filter by certificate expiry less than or equal to the date provided.  |
| percent_complete_eq              | string | Filter by % complete.                                                  | 
| complete_by_eq                   | string | Filter by date of completion.                                          |
| last_attempt_eq                  | string | Filter by date of last attempt.                                        |
| assignee_login_username_eq       | string | Filter by the assigned trainee's username.                             |
| failed_attempts_eq               | string | Filter by # of failed attempts at the Final Quiz.                      |

#### JSON Sample Request

`GET https://learninglogin.com/api/train_sessions?score_eq=80&completion_date_gteq=2015-01-01`

The above request would fetch all training sessions completed from Jan 1st 2015 onwards with a score of "80" percent.

####  JSON Sample Response Body: Success

~~~json
[
  { "id": 3,
    "course_code": "WHMIS",
    "score": 80,
    "percent_complete": 0,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-01",
    "complete_by": null,
    "full_name": "Michelle Dragsta",
    "time_spent": "0.0" },

  { "id": 2,
    "course_code": "TDG",
    "score": 80,
    "percent_complete": 100,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-02",
    "complete_by": null,
    "full_name": "Michelle Dragstra",
    "time_spent": "0.0" },
    
  { "id": 1,
    "course_code": "FP",
    "score": 80,
    "percent_complete": 100,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-03",
    "complete_by": null,
    "full_name": "Michelle Dragstra",
    "time_spent": "0.0" }
]
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/train_sessions.xml?score_eq=80&completion_date_gteq=2015-01-01`

#### XML Sample Response Body: Success

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<train_sessions type="array">
   <train_session>
      <id type="integer">3</id>
      <course_code>WHMIS</course_code>
      <score type="integer">80</score>
      <percent_complete type="integer">100</percent_complete>
      <failed_attempts type="integer">0</failed_attempts>
      <status>Completed</status>
      <cert_expiry type="date">2016-02-06</cert_expiry>
      <completion_date>2015-01-01</completion_date>
      <complete_by nil="true" />
      <full_name>Michelle Dragstra</full_name>
      <time_spent type="decimal">0.0</time_spent>      
   </train_session>
   <train_session>
      <id type="integer">2</id>
      <course_code>TDG</course_code>
      <score type="integer">80</score>
      <percent_complete type="integer">100</percent_complete>
      <failed_attempts type="integer">0</failed_attempts>
      <status>Completed</status>
      <cert_expiry type="date">2016-08-04</cert_expiry>
      <completion_date>2015-01-02</completion_date>
      <complete_by nil="true" />
      <full_name>Michelle Dragstra</full_name>
      <time_spent type="decimal">0.0</time_spent>      
   </train_session>
   <train_session>
      <id type="integer">1</id>
      <score type="integer">80</score>
      <course_code>FP</course_code>
      <percent_complete type="integer">100</percent_complete>
      <failed_attempts type="integer">0</failed_attempts>
      <status>Completed</status>
      <cert_expiry type="date">2016-08-04</cert_expiry>
      <completion_date>2015-01-03</completion_date>
      <complete_by nil="true" />
      <full_name>Michelle Dragstra</full_name>
      <time_spent type="decimal">0.0</time_spent>      
   </train_session>
</train_sessions>
~~~

### Show

`https://learninglogin.com/api/train_sessions/:id`

To retrieve a particular train session send a `GET` request to:

#### JSON Sample Request

`GET https://learninglogin.com/api/train_sessions/:id`

#### JSON Sample Response: Success

~~~json
{
  "id": 1,
  "score": 0,
  "percent_complete": 0,
  "failed_attempts": 0,
  "status": 'Assigned',
  "cert_expiry": '2016-08-21',
  "completion_date": nil,
  "complete_by": nil,
  "full_name": 'Michelle Dragsta',
  "time_spent": 0,
  "course_code": 'WHMIS',
  "success": nil
}
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/train_sessions/:id.xml`

#### XML Sample Response Body: Success

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<train_session>
   <id type="integer">1</id>
   <score type="integer">0</score>
   <percent_complete type="integer">0</percent_complete>
   <failed_attempts type="integer">0</failed_attempts>
   <status>Assigned</status>
   <cert_expiry type="date">2016-08-04</cert_expiry>
   <completion_date nil="true" />
   <complete_by nil="true" />
   <full_name>Michelle Dragstra</full_name>
   <time_spent type="decimal">0.0</time_spent>
   <course_code>WMIS</course_code>
   <success nil="true" />
</train_session>
~~~

### Unassign

`https://learninglogin.com/api/train_sessions/unassign`

To remove one or more train sessions, send a `POST` request to the url above with the following parameters:

| Name         | Type   | Required? | Description                                                   |
|--------------|--------|-----------|---------------------------------------------------------------|
| course_codes | array  | yes       | List of course codes that will be assigned                    |
| login_id     | integer  | yes     | ID of user whose courses will be removed.                     |

The unassign endpoint allows you to unassign multiple courses for a single user. There is currently no way to unassign multiple courses for multiple users in a single call.

####  JSON Sample Request Body

`POST https://learninglogin.com/api/train_sessions/unassign`

~~~json
  {
    "course_codes": ['JHSC'],
    "login_id": 1
  }
~~~

#### XML Sample Request Body

`POST https://learninglogin.com/api/train_sessions/unassign.xml`

Note: Remember to add `type='array'` to `<course-codes>` tag and all parameters should be sent inside a tag `<content>`

~~~xml
<?xml version='1.0' encoding='UTF-8'?>
<content>  
  <course_codes type='array'>
    <course_code>JHSC</course_code> 
  </course_codes>
  <login_id type='integer'>1</login_id>
</content>
~~~

#### JSON Sample Response Body: Success

When one or more `train_sessions` are successfully destroyed, our API will send an `HTTP 200` response with an empty body.

#### JSON Sample Response Body: Failure
If *none* of the specified courses are found for the login sent, the API will respond with an `HTTP 200` response with the following message:

~~~json
  {
    "errors"=>"Could not find any corresponding train sessions."
  }
~~~

#### XML Sample Request Body

`POST https://learninglogin.com/api/train_sessions/unassign.xml`

Note: Remember to add `type='array'` to `<course_codes>` tag and all parameters should be sent inside a tag `<content>`

~~~xml
<?xml version='1.0' encoding='UTF-8'?>
<content>
  <login_id type='integer'>3</login_id>
  <course_codes type='array'>
    <course_code>WH1</course_code> 
  </course_codes>
</content>
~~~

#### Sample Response Body: Success

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<content>
  <message>Train session deleted successfully</message>
</content>
~~~

#### XML Sample Response Body: Failure

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<errors>
  <error>Could not find any corresponding train sessions.</error>
</errors>
~~~

### Course Player

To actually consume a train session through the course player, visit the url:

`http://learninglogin.com/api/train_sessions/:login_id/:course_code?token=:token`

| Name        | Type    | Required? | Description                                                                       |
|-------------|---------|-----------|-----------------------------------------------------------------------------------|
| login_id    | integer | yes       | Id of login consuming the train session                                           |
| course_code | string  | yes       | Unique code which identifies the course, i.e. WHMIS                               |
| token       | string  | yes       | Authentication token. If wrong, you will receive a 'Authentication error' message |

If you want to embed the course player into your site, just insert an `iframe` with the url above in the `src` property:

~~~html
<iframe src="http://learninglogin.com/api/train_sessions/1/WHMIS?token=TOKENHERE"> </iframe>
~~~

