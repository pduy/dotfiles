#! /usr/bin/python3

import subprocess

bash_monitors = 'bspc query --monitors --names'
monitors = [
    x.decode('utf-8')
    for x in subprocess.run(bash_monitors.split(), stdout=subprocess.PIPE).stdout.split()
]

if len(monitors) == 3:
    subprocess.run(f'bspc monitor {monitors[1]} -d 1 2 3 4'.split())
    subprocess.run(f'bspc monitor {monitors[0]} -d 7 8 9 10'.split())
    subprocess.run(f'bspc monitor {monitors[2]} -d 5 6'.split())
elif len(monitors) == 2:
    subprocess.run(f'bspc monitor {monitors[0]} -d 1 2 3 4 7 8 9 10'.split())
    subprocess.run(f'bspc monitor {monitors[1]} -d 5 6'.split())
elif len(monitors) == 1:
    subprocess.run(f'bspc monitor {monitors[0]} -d 1 2 3 4 5 6 7 8 9 10'.split())

