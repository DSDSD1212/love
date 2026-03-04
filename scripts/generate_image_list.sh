#!/bin/bash

# Configuration
IMAGES_DIR="../assets/images"
OUTPUT_FILE="$IMAGES_DIR/images.json"

# Move to the script's directory so paths are relative to it
cd "$(dirname "$0")"

# Check if the images directory exists
if [ ! -d "$IMAGES_DIR" ]; then
    echo "Error: Directory $IMAGES_DIR not found. Please ensure the assets/images directory exists."
    exit 1
fi

echo "Generating $OUTPUT_FILE..."

# Start the JSON array
echo "[" > "$OUTPUT_FILE"

# Find all valid image files, exclude images.json, and sort them
# We loop through them to build the JSON objects
first=true
find "$IMAGES_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | sort | while read -r filepath; do
    filename=$(basename "$filepath")
    
    # Skip if it is somehow images.json (though not an image extension, just in case)
    if [ "$filename" = "images.json" ]; then
        continue
    fi
    
    # Generate the text caption
    # 1. Remove extension
    text="${filename%.*}"
    # 2. Remove trailing timestamp like _1772443765380
    text=$(echo "$text" | sed -E 's/_[0-9]+$//')
    # 3. Replace underscores with spaces
    text=$(echo "$text" | tr '_' ' ')
    
    # Add comma for previous item if not the first
    if [ "$first" = true ]; then
        first=false
    else
        echo "," >> "$OUTPUT_FILE"
    fi
    
    # Output the JSON object
    # We use printf to safely encode newlines or tabs if any exist
    printf '  {\n    "src": "assets/images/%s",\n    "text": "%s"\n  }' "$filename" "$text" >> "$OUTPUT_FILE"
done

# End the JSON array
echo "" >> "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

echo "Successfully generated $OUTPUT_FILE."
