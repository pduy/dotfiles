#!/usr/bin/env python
import sys

import i3


def jump_next_tab(n_tab=1):
    focused_container = i3.filter(focused=True)[0]
    tab_container = get_tab_parent(focused_container)
    all_tab_ids = [node['id'] for node in tab_container['nodes']]
    focus_tab_idx = get_container_idx_in_parent(
        tab_container,
        focused_container,
    )
    i3.focus(con_id=all_tab_ids[(focus_tab_idx + n_tab) % len(all_tab_ids)])
    i3.focus('child')
    i3.focus('child')


def get_container_idx_in_parent(parent, container):
    all_tab_ids = [node['id'] for node in parent['nodes']]
    while container['id'] not in all_tab_ids:
        container = i3.parent(container['id'])
    return all_tab_ids.index(container['id'])


def get_tab_parent(container):
    max_iter = 20
    for _ in range(max_iter):
        parent = i3.parent(container['id'])
        container = parent
        if container['layout'] == 'tabbed':
            return container
        if parent is None:
            return None

    return None


if __name__ == "__main__":
    num = int(sys.argv[1])
    jump_next_tab(num)
