#!/bin/bash

curl http://127.0.0.1:5005/posts

sleep 5

curl http://127.0.0.1:5005/posts?userId=1
