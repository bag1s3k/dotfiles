import subprocess
from datetime import datetime


README_PATH = "./README.md"
START_TAG = "<!-- TABLE:START -->"
END_TAG = "<!-- TABLE:END -->"
TABLE_HEADING = """
| App | Last update | Description of Update |
| --- | ----------- | --------------------- |
"""

dirs_output = subprocess.run(
    "echo */", shell=True, capture_output=True, text=True, check=True
)
dirs = dirs_output.stdout.strip().split(" ")

current_data = []
for dir in dirs:
    timestamp_raw = subprocess.run(
        ["git", "log", "-1", "--format=%ct@@SPLIT@@%s", dir],
        capture_output=True,
        text=True,
        check=True,
    )

    timestamp = timestamp_raw.stdout.strip()
    if timestamp:
        details = timestamp.split("@@SPLIT@@")
        current_data.append(
            [dir.replace("/", ""), datetime.fromtimestamp(int(details[0])), details[1]]
        )

table = TABLE_HEADING
for row in current_data:
    app, date, desc = row
    table += f"| {app} | {date} | {desc} |\n"

with open(README_PATH, "r", encoding="utf-8") as file:
    before, rest = file.read().split(START_TAG, 1)
    _, after = rest.split(END_TAG, 1)

    new_content = before + START_TAG + "\n" + table + "\n" + END_TAG + after

with open(README_PATH, "w", encoding="utf-8") as f:
    f.write(new_content)
