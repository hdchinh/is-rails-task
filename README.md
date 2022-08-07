# README

# 1. Authentication

- Signup

```
{
    "client": {
        "email": "chinh1@mail.com",
        "password": "123123"
    }
}
```

- Login

```
{
    "client": {
        "email": "chinh1@mail.com",
        "password": "123123"
    }
}
```

Response

```
{
    "success": true,
    "message": "Login successfully",
    "data": {
        "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJjbGllbnRfaWQiOjIsImV4cCI6MTY1OTkzMjQ1MX0.2C8AwqReFtZxOm3PAfW3f3udbkeHVQmPW5blrmgjy6k"
    }
}
```

# 2. QueueJobs

- Get all queue jobs

```
GET {baseURl}/api/queue_jobs
```

- Create queue job

```
POST {baseURl}/api/queue_jobs

{
    "queue_job": {
        "job_type": 0, // 0 or 1 => check job_type in queue_job model for more detail.
        "execute_at": "30/08/2022",
        "job_type": {
          "title": "start war"
        }
    }
}

```

# 3. Monitor requests

- count total request per client every hours
- after every hours, count the total request of the last hour to the total request of the month
- after every months, run cron jobs to update report about how many requests per month per client to user_metrics table:

e.g:

```
client_id: 1,
month: "08-2022",
total_requests: 30000
```

# 4. Run queue jobs

> Use sidekiq and sidekiq-cron for background and cron jobs
> For cron jobs config: config/schedule.yml

# 5. Update status of queue jobs

> Use sidekiq-status to check status of the job
> Check the worker app/workers/update_status_of_queue_jobs_worker.rb for more the detail

# 6. Run jobs manually

```
bundle exec rake 'run_queue_job:start[your_job_id_pass_here]'
e.g: b exec rake 'run_queue_job:start[1]' // run job that has id is 1
```

# 8. Unit tests

> Rpec, Factorybot, Shoulda-matchers...
