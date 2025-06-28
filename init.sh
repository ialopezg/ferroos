#!/bin/bash
echo "🔧 Booting FerroOS..."
mkdir -p /mnt/roms /opt/frontend

# Simulate launching frontend
if [ -f /opt/frontend/init.sh ]; then
  echo "🕹  Launching Frontend..."
  bash /opt/frontend/init.sh
else
  echo "❌ No frontend/init.sh found!"
fi

exec bash
