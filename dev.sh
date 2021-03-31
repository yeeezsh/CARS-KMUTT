#!/bin/bash
code ./frontend-tsx
code ./backend
code ./
docker-compose up --build --remove-orphans
