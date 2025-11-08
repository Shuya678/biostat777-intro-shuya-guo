#!/usr/bin/env bash
set -euo pipefail

FILE="students.csv"
[ -f "$FILE" ] || { echo "students.csv 不存在"; exit 1; }

echo "== 1) cat =="
cat "$FILE"

echo -e "\n== 2) head 5 =="
head -n 5 "$FILE"

echo -e "\n== 3) tail 3 =="
tail -n 3 "$FILE"

echo -e "\n== 4) wc -l =="
wc -l "$FILE"

echo -e "\n== 5) Subject=Math =="
awk -F, 'NR>1 && $6=="Math"{print}' "$FILE"

echo -e "\n== 6) Gender=F =="
awk -F, 'NR>1 && $4=="F"{print}' "$FILE"

echo -e "\n== 7) Sort by Age ascending =="
{ head -n 1 "$FILE"; tail -n +2 "$FILE" | sort -t, -k3,3n; }

echo -e "\n== 8) Unique subjects =="
tail -n +2 "$FILE" | cut -d, -f6 | sort -u

echo -e "\n== 9) Average grade =="
awk -F, 'NR>1{sum+=$5; n++} END{printf "Average grade = %.2f\n", sum/n}' "$FILE"

echo -e "\n== 10) Replace Math -> Mathematics =="
sed 's/Math/Mathematics/g' "$FILE" | head -n 10
