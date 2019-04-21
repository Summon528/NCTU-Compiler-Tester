# NCTU-Compiler-Tester
A simpler tester specifically for NCTU compiler course (2019 Spring)

### Usage
#### Folder structure
```
- project*
  - in     // test cases
  - ans    // expected results (Taken from TA provided online parser)
  - out    // your output
```
#### Simple testing
```
python test.py project_num executable_path
ex:
python test.py 1 ../project1/scanner
```

#### Add new test data
1. Install `beautifulsoup` and `requests` via `pipenv` or `pip install`
2. Add new files to `project*/in`
3. Run the script normally as it will download answers automatically.
