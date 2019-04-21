import os
import json
import subprocess
import re
import difflib
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("project_num")
parser.add_argument("executable_path")
args = parser.parse_args()
project_str = f"project{args.project_num}"

ans_dir = os.path.join(project_str, "ans")
if not os.path.exists(ans_dir):
    os.makedirs(ans_dir)
ans_files = os.listdir(ans_dir)

in_dir = os.path.join(project_str, "in")
in_files = os.listdir(in_dir)
in_files.sort(
    key=lambda x: int(x.split(".")[0]) if x.split(".")[0].isdigit() else -1)

out_dir = os.path.join(project_str, "out")
if not os.path.exists(out_dir):
    os.makedirs(out_dir)


def get_ans(project_num):
    in_ans_set_diff = set(in_files) - set(ans_files)
    if not in_ans_set_diff:
        return
    from bs4 import BeautifulSoup
    import requests
    for file in in_ans_set_diff:
        with open(os.path.join(in_dir, file), "r") as f:
            r = requests.post(
                f"https://sslab.cs.nctu.edu.tw/Compiler/project{project_num}",
                {"code": f.read()})
            soup = BeautifulSoup(r.text, 'html.parser')
            ans = soup.find('code').text

            with open(os.path.join(ans_dir, file), "w") as f:
                f.write(ans)


def check_ans_project1(ans_str, out_str):
    ans_match = re.search(r"Error at line (\d*)", ans_str)
    out_match = re.search(r"Error at line (\d*)", out_str)
    ans_error_line = ans_match.group(1) if ans_match else -1
    out_error_line = out_match.group(1) if out_match else -1
    ans_desc = "no lexical error" if ans_error_line == -1 else f"error at line {ans_error_line}"
    out_desc = "no lexical error" if out_error_line == -1 else f"error at line {out_error_line}"
    if ans_str == out_str or (ans_error_line != -1 and ans_error_line == out_error_line):
        return (True, None)
    else:
        if ans_error_line == -1 and out_error_line == -1:
            return (False, "no lexical error but output is incorrect")
        return (False, f'expected "{ans_desc}" but got "{out_desc}" instead')


def check_ans_project2(ans_str, out_str):
    ans_match = re.search(r"Error found in Line #(\d*)", ans_str)
    out_match = re.search(r"Error found in Line #(\d*)", out_str)
    ans_error_line = ans_match.group(1) if ans_match else -1
    out_error_line = out_match.group(1) if out_match else -1
    ans_desc = "no syntactic error" if ans_error_line == -1 else f"error found in line {ans_error_line}"
    out_desc = "no syntactic error" if out_error_line == -1 else f"error found in line {out_error_line}"
    if ans_error_line == out_error_line:
        return (True, None)
    else:
        return (False, f'expected "{ans_desc}" but got "{out_desc}" instead')


def test():
    ac, wa = 0, 0
    for file in in_files:
        print(file, end="\t")
        r = subprocess.run([args.executable_path,
                            os.path.join(in_dir, file)],
                           capture_output=True)
        out_str = r.stdout.decode() + r.stderr.decode()
        with open(os.path.join(out_dir, file), "w") as f:
            f.write(out_str)
        with open(os.path.join(ans_dir, file)) as f:
            ans_str = f.read()
            status, msg = globals()[f"check_ans_{project_str}"](ans_str, out_str)
            if status:
                print(f"\033[92mAC{f': {msg}' if msg else ''}\033[0m")
                ac += 1
            else:
                print(f"\033[91mWA{f': {msg}' if msg else ''}\033[0m")
                print("\033[93m", end="")
                print(''.join(
                    difflib.unified_diff(
                        ans_str.splitlines(True),
                        out_str.splitlines(True),
                        fromfile="answer",
                        tofile="output",
                    )),
                      end="")
                print("\033[0m", end="")
                wa += 1
    print(f"Test complete {ac}/{ac+wa}")


if __name__ == "__main__":
    get_ans(args.project_num)
    test()
