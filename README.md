[![Build Status](https://travis-ci.org/daverhub/Huntracker.svg?branch=master)](https://travis-ci.org/daverhub/Huntracker) [![Code Climate](https://codeclimate.com/github/daverhub/Huntracker/badges/gpa.svg)](https://codeclimate.com/github/daverhub/Huntracker) [![Coverage Status](https://coveralls.io/repos/daverhub/Huntracker/badge.svg?branch=master)](https://coveralls.io/r/daverhub/Huntracker?branch=master)

# Huntracker

### Is a Job search tracker, search and saves jobs while providing progress tracking functionality

Rails version '4.2.1'

Accesses the Indeed API, requires API keys

### To run:

1. Git Clone: https://github.com/daverhub/Huntracker.git
2. Create a publisher account to get API_KEY here:
    http://www.indeed.com/jsp/apiinfo.jsp
3. create env file and add API_key
4. Run rails server

### Features:

1. Search for jobs by type and location using the Indeed API
2. Saves jobs to watch list
3. Mark job as applied, requires follow-up, or interviewd
4. Writes a note to a job on the watch list
5. Comment on jobs friends are watching

![alt](http://i.imgur.com/oBWe09J.png)

A Search using the IndeedAPI

![alt](http://i.imgur.com/TdXjUqV.png)
