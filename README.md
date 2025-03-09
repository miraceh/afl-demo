# AFL++ Fuzzing Demo

This project contains a simple `demo.cpp` program with intentional crash and hang cases, along with a `Makefile` for easy fuzzing using AFL++.

## `demo.cpp` Overview

The program reads an input string and triggers specific behaviors:

- **Crashes (`abort()`)**:
  1. If the first character is `0`.
  2. If two consecutive digits increase by 1 (e.g., `3 -> 4`).

- **Hangs (`sleep(10)`)**:
  1. If the last character is `0`.
  2. If two consecutive digits increase by 2 (e.g., `3 -> 5`).

## Makefile Targets

- **`make check`**: Verify if AFL++ is installed.
- **`make build`**: Compile `demo.cpp` with AFL++.
- **`make seed`**: Generate initial seed inputs.
- **`make fuzz`**: Run AFL++ fuzzing.
- **`make reseeds(If initial seeds all fail)`**: Clear and regenerate seeds.
- **`make clean`**: Remove generated files.

Run `make fuzz` after building and seeding to start fuzzing.

## Reference

For more exercises, please refers to
https://github.com/alex-maleno/Fuzzing-Module