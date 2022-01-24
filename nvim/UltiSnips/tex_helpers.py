def del_line_and_exit(snip):
    cursorline = snip.cursor[0]
    del snip.buffer[cursorline]

    # add blank line after \end
    snip.buffer.append("\n", cursorline + 1 + 1)
    # cursorline+1 is the line number (1-based)

    # place cursor on blank line after \end
    snip.cursor.set(cursorline+1, 0)


def in_environment(snip, env):
    # find using searchpairpos
    begin_pos = vim.eval(
        f"searchpairpos('\\\\begin{{{env}}}', '', '\\\\end{{{env}}}', 'bnwz')")
    end_pos = vim.eval(
        f"searchpairpos('\\\\begin{{{env}}}', '', '\\\\end{{{env}}}', 'nWz')")
    cur_pos = snip.cursor.to_vim_cursor()

    if begin_pos == ['0', '0'] or end_pos == ['0', '0']:
        return False

    return pos_compare(begin_pos, cur_pos) < 0 and pos_compare(cur_pos, end_pos) < 0


def in_list(snip):
    return in_environment(snip, "itemize") or in_environment(snip, "enumerate")


def pos_compare(cur1, cur2):
    """ returns -1 if cur1 is before cur2, +1 if after, and 0 if cur1==cur2
        cur1, cur2 are required to be lists of the form [row,col]
    """
    cur1r = int(cur1[0])
    cur1c = int(cur1[1])
    cur2r = int(cur2[0])
    cur2c = int(cur2[1])
    if cur1r < cur2r:
        return -1
    elif cur1r > cur2r:
        return 1
    else:
        if cur1c < cur2c:
            return -1
        elif cur1c > cur2c:
            return 1
        else:
            return 0
