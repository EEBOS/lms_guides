---
title: Inventories
---

## Inventories

The Inventories endpoint is used for assigning courses to users.

## Methods

### Assign Units

`https://learninglogin.com/api/v2/inventories/assign_units`

To assign units to a user, send a `POST` request to the URL above with the following parameters:

| Name         | Type   | Required? | Description                                                   |
|--------------|--------|-----------|---------------------------------------------------------------|
| course_codes | array  | yes       | List of course codes that will be assigned                    |
| login_ids    | array  | yes       | List of login ids to which selected courses will be assigned  |

#### JSON Sample Request Body

`POST https://learninglogin.com/api/v2/inventories/assign_units`

~~~json
  {
    "course_codes": ['JHSC'],
    "login_ids": [1, 2]
  }
~~~

#### JSON Sample Response Body

When courses are successfully assigned, our API will send an empty `JSON` hash as a response: `{ }`
If the assignation requires an extra payment, the response body will include the `extra_payment` key. Example:

~~~json
  {
    "extra_payment": '1'
  }
~~~

#### JSON Sample Response Body: Failure

If something goes wrong, the API will respond with a `HTTP 422` error code and the error’s description in the response body:

~~~json
  {
    "errors": 'You do not have enough units to complete this operation'
  }
~~~

#### XML Sample Request Body

`POST https://learninglogin.com/api/v2/inventories/assign_units.xml`

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<content>
  <course-codes type="array">
     <course-code>JHSC</course-code>
  </course-codes>
  <login-ids type="array">
     <login-id type="integer">1</login-id>
     <login-id type="integer">2</login-id>
  </login-ids>
</content>
~~~

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<content>
   <extra-payment>1</extra-payment>
</content>
~~~

#### XML Sample Response Body: Failure

If something goes wrong, the API will respond with a `HTTP 422` error code and the error’s description in the response body:

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<errors>
   <error>No courses found for given codes</error>
</errors>
~~~
