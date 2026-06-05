#!/bin/bash
cd "$(dirname "$0")"

echo ""
echo " =============================="
echo "   RAAH ENERGIE - Local Server"
echo " =============================="
echo ""

PORT=8000

# Check if port is already in use
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
  echo " Port $PORT is already in use. Trying 8080..."
  PORT=8080
fi

echo " Starting server at http://localhost:$PORT"
echo " Press Ctrl+C to stop."
echo ""

open "http://localhost:$PORT"
python3 -m http.server $PORT
