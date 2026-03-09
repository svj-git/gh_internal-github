#!/bin/bash

# Output file to store the results
OUTPUT_FILE="unsolv.txt"

# Clear the output file if it already exists
> "$OUTPUT_FILE"

# Find all .d files in the current directory and all subdirectories
find . -type f -name "*.d" | while read -r file; do
    # Use awk to extract the pattern: UNSOLVED_JOURNAL ~Tilde enclosed text~
    awk '
    /UNSOLVED_JOURNAL ~/ {
        # Skip if already inside a tilde block
        if (inside_tilde) {
            next
        }
        inside_tilde = 1
        buffer = ""
    }
    inside_tilde {
        buffer = buffer $0 "\n"
        if ($0 ~ /~$/) {
            inside_tilde = 0
            # Print the entire buffer, including the UNSOLVED_JOURNAL ~ prefix and the trailing ~
            print buffer
        }
    }
    ' "$file" >> "$OUTPUT_FILE"
done

# Print a message indicating the script has finished
echo "Extraction complete. Results saved in $OUTPUT_FILE"


<<'COMMENT'
Create common linux utilities script Which will:
- From current directory.
- search for ever file with .d extension
- in file with .d extension file search for PATTERN such as example below:
UNSOLVED_JOURNAL ~Protect Revan from assassins

            I have accepted mercenary contract from Revan Artecratos to protect him from assassins while he is traveling with me. As reward i am to receive 15000 gold.~
- copy it exactly tilde enclosed can contain any character newline space etc.
- Resulting file should have every occurence of UNSOLVED_JOURNAL ~Tilde enclosed text~ in unsolv.txt file
- unsolv.txt should be in current directory

Fix this script so it would search current directory and all its subdirectories to:
Find every occurence of which starts with UNSOLVED_JOURNAL ~saved text inside~
Pattern example which i wish to extract.
UNSOLVED_JOURNAL ~Protect Revan from assassins

            I have accepted mercenary contract from Revan Artecratos to protect him from assassins while he is traveling with me. As reward i am to receive 15000 gold.~
            UNSOLVED_JOURNAL ~Protect Revan from assassins

            Ribald Barterman story is plausible though what he would gain or why he would join assassination plot on my companion i do not know. This whole thing does not make any sense.~
COMMENT
