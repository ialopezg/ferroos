#!/bin/bash
ROM_DIR="/mnt/roms"
clear

echo "🎮 FerroOS v0.1 Launcher"
echo "========================"
echo ""
echo "Available ROMs:"

mapfile -t roms < <(ls "$ROM_DIR" 2>/dev/null)

if [ ${#roms[@]} -eq 0 ]; then
  echo "⚠️  No ROMs found in $ROM_DIR"
  exit 1
fi

for i in "${!roms[@]}"; do
  printf " [%d] %s\n" "$((i+1))" "${roms[i]}"
done

echo ""
read -p "Choose a ROM to launch (1-${#roms[@]}): " choice

if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#roms[@]} ]; then
  rom="${roms[$((choice-1))]}"
  echo "🚀 Launching $rom..."
  # simulate launch
  sleep 1
else
  echo "❌ Invalid selection."
  exit 1
fi