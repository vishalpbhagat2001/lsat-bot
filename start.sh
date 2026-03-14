#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "Error: ANTHROPIC_API_KEY is not set."
  echo "Run: export ANTHROPIC_API_KEY=your_key_here"
  exit 1
fi

# Create venv if it doesn't exist
if [ ! -d ".venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv .venv
fi

source .venv/bin/activate

echo "Installing dependencies..."
pip install -q -r requirements.txt

echo ""
echo "  LSAT Bot running → http://localhost:5050"
echo "  Press Ctrl+C to stop."
echo ""

python app.py
