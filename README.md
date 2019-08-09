# semantix/test
#python.app

# Simple search app

The is the data engineering take home test.

For the assignment descriptions, please see [ASSIGNMENT.md](ASSIGNMENT.md).

The rest of the README is focused on running the app included in this bundle 

## Development environment

The application is written in Python 3 using Tornado to handle web
connectivity.

If starting from a vanila Python environment we suggest the following 
steps to bootstrap an environment.

    > # in the project root
    > pip3 install virtualenv
    > virtualenv -p python3 env
    > source env/bin/activate
    > pip install -r requirements.txt

This will give you an environment, where you can run the app with:

    > ./app.py

## Running 

The app runs on port 8888 and the search functions can be reached at /s followed
by a path element containing the search terms.
For example, to search for the terms _fun_ and _city_:

    > curl http://localhost:8888/s/fun%20city

For convenience:

   > make run

## Testing code

The app uses doc tests, for convenient testing, do:

    > make test

## Load testing

To run a simple load test, do:

    > make loadtest
    time xargs -n 4 curl -s  < queries.txt > /dev/null
    
    real  0m1.023s
    user  0m0.056s
    sys 0m0.071s

When doing parformance comparisons, use the _real_ value.
