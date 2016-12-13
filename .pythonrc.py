#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Python run command. Please see metadata (via pydoc) for further info.

LICENSE

See below __license__

USAGE

`[i]py[thon[3]] [-E  # To ignore this startup file] [-...]`

"""
from __future__ import print_function, with_statement, division

######################## Metadata #############################################

# Metadata, used in $ pydoc ./%
__creator__ = "Matt Busby"
__email__ = "@MrMattBusby"
__date__ = "2010-2016"

__version__ = "See GitHub"
__project__ = "https://github.com/MrMattBusby/"

__author__ = "{0} {1}".format(__creator__, __email__)
__copyright__ = "Copyright (c) {year}, {owner}. ".format(
                        owner = __author__,
                        year = "2012") + \
                   "All rights reserved."
__licence__ = """\
        BSD 3-Clause License

        {copyright}

        Redistribution and use in source and binary forms, with or without
        modification, are permitted provided that the following conditions
        are met:

        1. Redistributions of source code must retain the above copyright
           notice, this list of conditions and the following disclaimer.

        2. Redistributions in binary form must reproduce the above copyright
           notice, this list of conditions and the following disclaimer in
           the documentation and/or other materials provided with the
           distribution.

        3. Neither the name of the copyright holder nor the names of its
           contributors may be used to endorse or promote products derived
           from this software without specific prior written permission.

        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
        "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
        LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
        FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
        COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
        INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
        BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
        LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
        CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
        LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
        WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
        POSSIBILITY OF SUCH DAMAGE.
        """.format(copyright=__copyright__)

######################## Imports/Globals ######################################

import csv
import fnmatch
import math
import os
import platform
import pwd
import re
import struct
import sys
import time
from datetime import datetime
try:
    import pandas as pd  # Load time is lengthy!
except ImportError:
    # print(".pythonrc.py: no pandas module found, skipping...")
    pass
try:
    import numpy as np
except ImportError:
    # print(".pythonrc.py: no numpy module found, skipping...")
    pass
# try:
#     import matplotlib.pyplot as plt
# except ImportError:
#     print(".pythonrc.py: no matplotlib module found, skipping...")
try:
    import consts
    from consts import *
except ImportError:
    # print(".pythonrc.py: no consts module found, skipping...")
    pass
try:
    from env import Env
    env = Env()
except ImportError:
    # print(".pythonrc.py: no consts module found, skipping...")
    env = None

# Bind TAB to autocomplete in interactive mode (or use ipython)
import readline
import rlcompleter
readline.parse_and_bind("tab: complete")

######################## Dummy Data ###########################################

# Useful when interactive
b = True
c = 'A'
s = 'Hello World!\n'
f = math.e
i = 2**32
n = 2**64
x = complex(1, -1)
l = [f, i, n]
t = tuple(l)
d = {'b': b, 'c': c, 's': s, 'f': f, 'i': i, 'n': n, 'x': x, 'l': l, 't': t}
try:
    a = np.array([[f, 2 * f, 3 * f], [10 * f, 20 * f, 30 * f]])
except NameError:
    a = [[f, 2 * f, 3 * f], [10 * f, 20 * f, 30 * f]]

def u(a, k=None):
    print("a:{} k:{}".format(a, k))
    return a

class O(object):

    def __init__(self):
        self.__dict__ = d
o = O()
try:
    p = pd.DataFrame(data={'A': a[0], 'B': a[1]}, index=[0, 1, 2])
except NameError:
    p = None
e = set(l)
r = iter(l)
m = lambda: l

######################## Classes ##############################################


class Switch(object):
    """Emulate a C switch statement. Not the fastest but is easy and no lambda.

    Source: http://code.activestate.com/recipes/410692/.

    Usage:
    for case in Switch(input):
        if case(*string.lowercase):
            print "Input is a lowercase!"
            break
        if case('!', '?', '.'):
            print "Input is a terminator!"
            break
        if case():
            print "N/A."
    """

    def __init__(self, value):
        self.value = value
        self.fall = False

    def __iter__(self):
        """Return the match method once, then stop."""
        yield self.match
        raise StopIteration

    def match(self, *args):
        """Indicate whether or not to enter a case suite."""
        if self.fall or not args:
            return True
        elif self.value in args:
            self.fall = True
            return True
        else:
            return False

######################## Decorators ###########################################


def entry_exit(log):
    """Decorator for funciton entry/exit."""

    def decorator(func):
        """Actual decorator."""

        def log_final_time(func, t_i):
            """Log final function execution time."""
            t_f = time.time()
            log.debug("Exiting {} after: {:.3f} sec".format(func, t_f - t_i))

        @wraps(func)
        def wrapper(*args, **kwargs):
            """Replacement function."""
            date = datetime.isoformat(datetime.today())
            log.debug("Entering {} at: {}".format(func.__name__, date))
            t_i = time.time()
            try:
                rtn = func(*args, **kwargs)
            except:
                log_final_time(func.__name__, t_i)
                raise
            else:
                log_final_time(func.__name__, t_i)
            return rtn
        return wrapper

    return decorator

######################## Functions ############################################

# OS/file/IO


def find_pids(name, ignores=['grep', 'gdb', 'ssh']):
    """Find processes by name (w/out psutil)."""
    olist = []
    if not name:
        return olist
    if not ignores:
        ignores = []
    pids = [pid for pid in os.listdir('/proc') if pid.isdigit()]
    for pid in pids:
        proc = ''
        try:
            with open(os.path.join('/proc', pid, 'cmdline'), 'rb') as ifile:
                proc = ifile.read()
        except IOError:
            continue
        if name in proc:
            if all(map(lambda v: v not in proc, ignores)):
                olist.append(int(pid))
    return olist


def perror(string):
    """Print to std err in python < 2.7."""
    try:
        try:
            sys.stderr.write(''.join([string, '\n']))
        except TypeError:
            sys.stderr.write(''.join([str(idx) for idx in string] + ['\n']))
    except Exception as e:
        sys.stderr.write("perror(): Error: %s!\n" % str(e))
    #"""Print to std err."""
    #print(string, sep='', end='\n', file=sys.stderr)


def file_parser(filename):
    """Convenience generator yielding rstipped lines in a file."""
    try:
        with open(filename, 'rb') as ifile:
            for line in ifile:
                yield line.rstrip('\n')
            else:
                raise StopIteration
    except IOError:
        raise StopIteration


def read_lines(filename):
    """Open a file returning list of lines (strings)."""
    lines = []
    try:
        with open(filename, 'r') as infile:
            lines = infile.readlines()
    except IOError:
        perror(">>> open_as_lines: Error opening file {0}.".format(filename))
    return lines


def read_csv(filename, delimiter=',', ig_blank_char=True, ig_blank_line=True,
             header_cnt=0, ig_chars=r'-/#', check_cnt=0):
    """Open a csv file returning list of lines (delimited list of strings)."""
    props = csv.excel()
    props.delimiter = delimiter
    lines = []
    try:
        with open(filename, 'r') as infile:
            read = csv.reader(infile, props)
            for lineno, line in enumerate(read):
                print(line)
                # Skip first line
                if (lineno < header_cnt) or \
                   (line and line[0] and line[0][0] in ig_chars):
                    continue
                # Cleanup in the case delimiter contains spaces
                if ig_blank_char:
                    line = [item.strip() for item in line if item.strip()]
                # Ignore blank lines
                if line or not ig_blank_line:
                    lines.append(line)
                # Check count of items
                if check_cnt and check_cnt != len(line):
                    perror(">>> open_csv: Bad item count on {0}:{1}.".format(
                           filename, lineno))
    except IOError:
        perror(">>> open_csv: Error opening file {0}.".format(filename))
    return lines


def locate(pattern, start_dir='.'):
    """Locate a pattern recursively from the start directory returning a list.

    Essentially a recursive glob returning absolute filenames as strings.

    Usage:
      >>> for file in locate('.*rc','.'):
      ...   for lineno, line in enumerate(open_lines(file)):
      ...     if 'set' in line:
      ...       print(file, line.strip(), lineno)

    Note:
      "pattern" accepts bash-type wildcards * ? [] [!]
      "start_dir" accepts ~
    """
    matches = []
    if '~' in start_dir:
        start_dir = os.path.expanduser(start_dir)
    for path, _, files in os.walk(os.path.abspath(start_dir)):
        for filename in fnmatch.filter(files, pattern):
            matches.append(os.path.join(path, filename))
    return matches


def find(file, quiet=True):
    """Find and return the first filename globbed."""
    import glob
    results = glob.glob(file)
    matches = len(results)
    if matches <= 0:
        perror(">>> find: No matches found!")
        return ''
    if matches > 1:
        perror(">>> find: Found more than one match, using first result!")
    return results[0]


def wait(seconds=1):
    """Sleeps for seconds, can be fractional."""
    time.sleep(seconds)


def pause():
    """Pause until enter."""
    try:
        raw_input(">>> Press ENTER to continue...")
    except KeyboardInterrupt:
        pass


def cls():
    """Clear screen."""
    try:
        os.system("clear")
    except:  # Grabs all..
        pass

# Strings/iterable


def any_in(iter1, iter2):
    """Return if any of the items in iter1 are in iter2."""
    # Faster than list accumulation b/c of break
    for item in iter1:
        if item in iter2:
            return True
    return False


def cnt_in(iter1, iter2):
    """Return count of the items in iter1 also in iter2."""
    # Note: cnt_in('aaa','abc') != cnt_in('abc','aaa')
    # Faster than sum()
    return [item in iter2 for item in iter1].count(True)

######################## Math Patches #########################################

# Inf/nan
try:
    # Infinite and Nan should be std type
    math.inf = float('inf')
    math.nan = float('nan')
except ValueError:
    try:
        math.inf = float('1.#INF')
        math.nan = float('1.#IND')  # Indeterminate
    except ValueError:
        try:
            math.inf = 1e3000
            math.nan = math.inf - math.inf
        except (ValueError, OverflowError):
            math.inf = 9.999999999999999999999999e307
            math.nan = -math.inf  # Give up
inf = math.inf
nan = math.nan

# Tau
math.tau = 2. * math.pi
tau = math.tau


def round_near(ival, near=1.0):
    """Round input to closest fraction.

    In [1]: round_near(4.567, 1/5.)
    Out[1]: 4.6

    """
    return round(ival / near) * near
math.round_near = round_near


def csc(rad):
    """Return cosecant of an angle in radians."""
    return 1. / math.sin(rad)
math.csc = csc


def cot(rad):
    """Return cotangent of an angle in radians."""
    return 1. / math.tan(rad)
math.cot = cot


def sec(rad):
    """Return secant of an angle in radians."""
    return 1. / math.cos(rad)
math.sec = sec


def log2(var):
    """Return log base 2 of var."""
    return log(var, 2)
math.log2 = log2


def log3(var):
    """Return log base 3 of var."""
    return log(var, 3)
math.log3 = log3


def loge(var):
    """Return log base e of var."""
    return math.log(var)
math.loge = loge


def ln(var):
    """Return log base e of var."""
    return math.log(var)
math.ln = ln


def cbrt(var):
    """Return cubed root of var."""
    return math.pow(var, (1. / 3))
math.cbrt = cbrt


def angle(y, x):
    """Return angle (atan2) of y, x."""
    return math.atan2(y, x)
math.angle = angle


def diff(var1, var2):
    """Return difference between two variables."""
    return abs(var1 - var2)
math.diff = diff


def count(var1, var2):
    """Return count between two variables, including start."""
    return abs(var1, var2) + 1
math.count = count


def isodd(var):
    """Return whether var is odd."""
    # Faster than %
    try:
        return var is not 0 and var & 1
    except TypeError:
        var = int(var)
        return var is not 0 and var & 1
math.isodd = isodd


def iseven(var):
    """Return whether var is even, 0 is not even."""
    # Faster than %
    try:
        return var is not 0 and not isodd(var)
    except TypeError:
        var = int(var)
        return var is not 0 and not isodd(var)
math.iseven = iseven


def ispow2(var):
    """Return whether var is a real power of 2."""
    try:
        return var is not 0 and not (var & (var - 1))
    except TypeError:
        return ispow(var, 2)
math.ispow2 = ispow2


def ispow(var, of):
    """Return whether var is a real power of _."""
    return not math.log(var, of) % 1 if var and of else False
math.ispow = ispow


def sign(var):
    """Return sign of var, with sign(0) == 1."""
    # Note: sign(-0.) is (+)
    return (var >= 0) * 2 - 1
math.sign = sign


def sign0(var):
    """Return sign of var, with sign0(0) == 0."""
    return (var > 0) * 2 - 1 if var else var
math.sign0 = sign0


def limit(low, ival, high):
    """Limit input between low and high."""
    return max(min(ival, high), low)
math.limit = limit


def patheq(var1, var2):
    """Pathagorean's equation to find hyp of right triangle."""
    return math.sqrt(var1 * var1 + var2 * var2)
math.patheq = patheq


def limit_unit(var):
    """Limit var between 0 and 1."""
    return max(min(var, 1.), 0.)
math.limit_unit = limit_unit


def norm360(deg):
    """."""
    return deg % 360.
math.norm360 = norm360


def norm180(deg):
    """."""
    ndeg = norm360(deg)
    return ndeg if ndeg < 180. else ndeg - 360.
math.norm180 = norm180


def norm2pi(rad):
    """."""
    return rad % (2. * math.pi)
math.norm2pi = norm2pi


def normpi(rad):
    """."""
    nrad = norm360(rad)
    return nrad if nrad < math.pi else nrad - 2. * math.pi
math.normpi = normpi

######################## Welcome ##############################################


def _welcome():
    """Prints system info, etc."""
    print(
        """\
_______________________________________________________________________________

Python {0}, {10}
{6} {9} {11}/{12} {1} {2} ({8})
{7}
{3}@{4} in {5}
_______________________________________________________________________________
""".format(env.vers,                                                     # 0
           env.ostitl,                                                   # 1
           env.osver,                                                    # 2
           env.user,                                                     # 3
           env.host,                                                     # 4
           env.cwd,                                                      # 5
           env.osname,                                                   # 6
           time.strftime("%a %b %d %H:%M:%S %Z %Y -- w%W d%j",
                         time.localtime()),  # Like $date                # 7
           env.distro,                                                   # 8
           env.plat,                                                     # 9
           env.archp,                                                    # 10
           env.proc,                                                     # 11
           env.mach))                                                    # 12

######################## TEMP #################################################


def work(start=730, stop=1630, lunch=100):
    """Time at work, enter in format '1945' => 7:45pm => 19.75."""
    norm = lambda x: math.floor(x / 100.) + (x % 100) / 60.
    return (norm(stop) - norm(start) - norm(lunch))

######################## Execution ############################################

if __name__ == '__main__':
    if env is not None:
        _welcome()
