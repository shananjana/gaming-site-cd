#!/bin/bash

BASE_URL="http://localhost:5000/api/games"

echo "Running integration tests against $BASE_URL"

# Test: GET /api/games
echo -n "GET /api/games: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL" | grep -q 200 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/trending
echo -n "GET /api/games/trending: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/trending" | grep -q 200 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/most-played
echo -n "GET /api/games/most-played: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/most-played" | grep -q 200 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/categories
echo -n "GET /api/games/categories: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/categories" | grep -q 200 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/:id (valid ID)
echo -n "GET /api/games/1: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/1" | grep -q 200 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/:id (invalid ID)
echo -n "GET /api/games/invalid: "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/invalid" | grep -q 400 && echo "PASS" || echo "FAIL"

# Test: GET /api/games/:id (not found ID)
echo -n "GET /api/games/99999 (not found): "
curl -s -o /dev/null -w "%{http_code}\n" "$BASE_URL/99999" | grep -q 404 && echo "PASS" || echo "FAIL"

echo "Integration test run complete."
