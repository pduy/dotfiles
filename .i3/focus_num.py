#!/usr/bin/env python
import sys

import i3

def focus_num(idx):
    focused_container = i3.filter(focused=True)[0]
    top_container = get_top_parent_of(focused_container)

    if top_container is not None and len(top_container['nodes']) > idx:
        target_container_id = top_container['nodes'][idx]['id']
        i3.focus(con_id=target_container_id)
        while i3.focus('child')[0]:
            pass


def get_top_parent_of(container):
    while True:
        parent = i3.parent(container['id'])
        container = parent
        if container['layout'] == 'tabbed': 
            return container
        if parent is None:
            return None

    return None


if __name__ == "__main__":
    num = int(sys.argv[1]) - 1
    focus_num(num)
