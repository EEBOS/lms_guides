---
title: API
---
<div class="alert alert-danger" role="alert">
  <h3>Deprecation Note</h3>
  <p>
    We are transitioning to a new version of the API including pagination and other improvements.
    The following documentation describes the new version of the API. For the older docs, please visit
    https://api.learninglogin.com/v1/
  </p>
</div>

## What is the OSG LMS API?

The OSG LMS API is a complete programmable interface to all LMS functionality. All resources are exposed through RESTful URLS.


## What can you do with it?

Assigning courses, creating logins, accessing reports. There are quite a number of features we support! Use the left-hand menu to navigate through all the available endpoints for more information.

## How do I get started?

In order to interact with our API, you’re required to include an authentication token in the header of every request. This API key will be provided to you by OSG.


For example, to retrieve the list of logins under your company, you can make the following request via `curl`:

```
curl http://learninglogin.com/api/v2/logins -H 'Authorization: Token token="TOKENHERE"'
```

If your authentication token is not correct, you will receive a “HTTP Token: Access Denied” response.

All of our API responses are sent in `JSON` or `XML` depending on the format requested.

When no suffix is specified, `JSON` is the default format. To request `XML`, make sure to send a `Content-Type` header of `application/xml` and add `.xml` as a suffix to all requests.

## Services

* [Logins](/v2/api/logins.html)
* [Courses](/v2/api/courses.html)
* [Inventories](/v2/api/inventories.html)
* [Train Sessions](/v2/api/train_sessions.html)
* [LMS Access](/v2/api/lms_access.html)
