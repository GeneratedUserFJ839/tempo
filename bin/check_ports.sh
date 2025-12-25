#!/usr/bin/env bash
set -euo pipefail

# Checks if key Tempo services ports are already in use.
# Useful before running localnet or integration tests.

PORTS=(
  8545  # RPC
  26657 # Tendermint RPC
  26656 # P2P
)

echo "== Tempo port conflict check =="

for port in "${PORTS[@]}"; do
  if lsof -i :"$port" >/dev/null 2>&1; then
    echo "Port $port is in use:"
    lsof -i :"$port" | awk 'NR==1 || /LISTEN/'
  else
    echo "Port $port is free."
  fi
done
